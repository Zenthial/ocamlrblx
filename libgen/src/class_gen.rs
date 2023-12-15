use crate::{Class, Member};

use convert_case::{Case, Casing};

fn map_type(ty: String) -> String {
    match ty.as_str() {
        "null" => "unit".to_string(),
        "int64" => "int".to_string(),
        "double" => "float".to_string(),
        "Objects" => "instance list".to_string(),
        "Variant" => "'a".to_string(),
        "Array" | "Tuple" => "'a list".to_string(),
        "Dictionary" => "(string * 'a) list".to_string(),
        _ => to_snake(ty),
    }
}

fn clean_member(member: &Member) -> bool {
    if let Some(ts) = &member.tags {
        if ts.contains(&String::from("Deprecated")) {
            return false;
        }
    }

    true
}

pub fn to_snake(s: String) -> String {
    s.to_case(Case::Snake)
}

pub fn generate_class_module(class: &Class) -> String {
    let imports = String::from("open Types\n");
    let mut type_heading = format!("type {} = {{\n", to_snake(class.name.clone()));
    let mut methods = String::new();

    use crate::MemberType::*;
    for member in &class.members {
        if !clean_member(member) {
            continue;
        }

        match member.member_type {
            Property => {
                let vt = member.value_type.as_ref().unwrap();
                type_heading += &format!(
                    "  {} : {};\n",
                    to_snake(member.name.clone()),
                    map_type(vt.name.clone())
                );
            }
            Function => {
                let rt = member.return_type.as_ref().unwrap();
                if rt.name == "Actor" {
                    continue;
                }
                let params = member.parameters.as_ref().unwrap();
                let mut mapped_params = Vec::new();

                for p in params {
                    if p.p_type.name != "Actor" {
                        mapped_params.push(map_type(p.p_type.name.clone()));
                    }
                }

                if mapped_params.len() == 0 {
                    mapped_params.push("unit".to_string());
                }

                let return_type = rt.name.clone();
                mapped_params.push(map_type(return_type));

                let param_list = mapped_params.join(" -> ");
                methods += &format!("val {} : {}\n", to_snake(member.name.clone()), param_list);
            }
            _ => {}
        }
    }

    imports + &type_heading + "}\n" + &methods
}

pub fn generate_class(class: &Class) -> String {
    let mut ret = String::new();

    if class.name.contains("Actor") {
        return ret;
    }

    let superclass = if class.superclass == "<<<ROOT>>>" {
        "object".to_string()
    } else {
        to_snake(class.superclass.clone()) + " -> object"
    };

    ret += &format!("class {} : {}\n", to_snake(class.name.clone()), superclass);

    use crate::MemberType::*;
    for member in &class.members {
        if let Some(ts) = &member.tags {
            if ts.contains(&String::from("Deprecated")) {
                continue;
            }
        }

        match member.member_type {
            Property => {
                let vt = member.value_type.as_ref().unwrap();
                ret += &format!(
                    "  val {} : {}\n",
                    to_snake(member.name.clone()),
                    map_type(vt.name.clone())
                );
            }
            Function => {
                let rt = member.return_type.as_ref().unwrap();
                let params = member.parameters.as_ref().unwrap();
                let mut mapped_params = params
                    .iter()
                    .map(|p| map_type(p.p_type.name.clone()))
                    .collect::<Vec<String>>();

                if mapped_params.len() == 0 {
                    mapped_params.push("unit".to_string());
                }

                let return_type = rt.name.clone();
                mapped_params.push(map_type(return_type));

                let param_list = mapped_params.join(" -> ");
                ret += &format!(
                    "  method {} : {}\n",
                    to_snake(member.name.clone()),
                    param_list
                );
            }
            _ => {}
        }
    }

    ret += &format!("end\n\n");
    return ret;
}
