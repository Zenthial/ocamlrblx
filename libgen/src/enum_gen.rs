use convert_case::{Case, Casing};

use crate::{class_gen::to_snake, Enum};

fn to_pascal(s: String) -> String {
    s.to_case(Case::Pascal)
}

pub fn generate_enum(enum_def: &Enum) -> String {
    let mut ret = String::new();

    ret += &format!("type {} =\n", to_snake(enum_def.name.clone()));

    for item in &enum_def.items {
        ret += &format!("  | {}\n", to_pascal(item.name.clone()));
    }

    ret += "\n";

    return ret;
}
