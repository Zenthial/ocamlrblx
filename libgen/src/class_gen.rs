use std::{
    fs::File,
    io::{BufWriter, Write},
};

use crate::{Class, Member, ValueTypeCategory};

use convert_case::{Case, Casing};

fn map_type(cat: &ValueTypeCategory, ty: String, class_name: &str) -> String {
    use crate::ValueTypeCategory::*;
    match cat {
        Class => {
            if &ty == class_name {
                "t".to_string()
            } else {
                ty + ".t"
            }
        }
        _ => match ty.as_str() {
            "null" => "unit".to_string(),
            "int64" => "int".to_string(),
            "double" => "float".to_string(),
            "Objects" => {
                if class_name == "Instance" {
                    "t list".to_string()
                } else {
                    "Instance.t list".to_string()
                }
            }
            "Variant" => "'a".to_string(),
            "Array" | "Tuple" => "'a list".to_string(),
            "Dictionary" | "Map" => "(string * 'a) list".to_string(),
            "CFrame" => "cframe".to_string(),
            "Vector3" => "vector3".to_string(),
            "Vector2" => "vector2".to_string(),
            "Color3" => "color3".to_string(),
            "Content" => "string".to_string(),
            "Function" => "(unit -> unit)".to_string(),
            _ => {
                if ty.contains("?") {
                    let type_name = ty.split("?").collect::<Vec<&str>>()[0];
                    return format!("{} option", to_snake(type_name.into()));
                }
                to_snake(ty)
            }
        },
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
    let mut type_heading = String::from("  type t = {\n");
    let mut methods = String::new();

    let mut props = 0;

    use crate::MemberType::*;
    for member in &class.members {
        if !clean_member(member) {
            continue;
        }

        match member.member_type {
            Property => {
                let vt = member.value_type.as_ref().unwrap();
                type_heading += &format!(
                    "    {} : {};\n",
                    to_snake(member.name.clone()),
                    map_type(&vt.category, vt.name.clone(), &class.name)
                );
                props += 1;
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
                        mapped_params.push(map_type(
                            &p.p_type.category,
                            p.p_type.name.clone(),
                            &class.name,
                        ));
                    }
                }

                if mapped_params.len() == 0 {
                    mapped_params.push("unit".to_string());
                }

                let return_type = rt.name.clone();
                mapped_params.push(map_type(&rt.category, return_type, &class.name));

                let param_list = mapped_params.join(" -> ");
                methods += &format!("  val {} : {}\n", to_snake(member.name.clone()), param_list);
            }
            _ => {}
        }
    }

    if props == 0 {
        String::from("  type t\n") + &methods
    } else {
        type_heading + "  }\n" + &methods
    }
}

pub fn generate_classes(classes: &Vec<Class>) {
    let imports = String::from("open Types\nopen Enums\n\n[@@@warning \"-67\"]");

    let mut writer = BufWriter::new(File::create("rbx/classes.mli").unwrap());
    let mut first_module = false;

    writer.write_all(imports.as_bytes()).unwrap();

    for class in classes {
        let module = generate_class_module(class);
        if first_module {
            writer
                .write_all(format!("and {} : sig\n", class.name).as_bytes())
                .unwrap();
            writer.write_all(module.as_bytes()).unwrap();
        } else {
            writer
                .write_all(format!("module rec {} : sig\n", class.name).as_bytes())
                .unwrap();
            writer.write_all(module.as_bytes()).unwrap();

            first_module = true;
        }
        writer.write_all("end\n".as_bytes()).unwrap();
    }
}
