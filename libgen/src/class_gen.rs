use crate::Class;

use convert_case::{Case, Casing};

fn map_type(ty: String) -> String {
    match ty.as_str() {
        "null" => "unit".to_string(),
        "int64" => "int".to_string(),
        _ => ty,
    }
}

fn map_super_class(super_class: String) -> String {
    match super_class.as_str() {
        "<<<ROOT>>>" => "object".to_string(),
        _ => super_class,
    }
}

pub fn generate_class(class: &Class) -> String {
    let mut ret = String::new();
    ret += &format!(
        "class {} : {}\n",
        class.name.to_case(Case::Snake),
        map_super_class(class.superclass.clone()).to_case(Case::Snake)
    );

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
                    member.name.to_case(Case::Snake),
                    map_type(vt.name.clone()).to_case(Case::Snake)
                );
            }
            Function => {
                let rt = member.return_type.as_ref().unwrap();
                let params = member.parameters.as_ref().unwrap();
                let mut mapped_params = params
                    .iter()
                    .map(|p| map_type(p.p_type.name.clone()).to_case(Case::Snake))
                    .collect::<Vec<String>>();

                if mapped_params.len() == 0 {
                    mapped_params.push("unit".to_string());
                }

                let return_type = rt.name.clone();
                mapped_params.push(map_type(return_type).to_case(Case::Snake));

                let param_list = mapped_params.join(" -> ");
                ret += &format!(
                    "  method {} : {}\n",
                    member.name.to_case(Case::Snake),
                    param_list
                );
            }
            _ => {}
        }
    }

    ret += &format!("end\n\n");
    return ret;
}
