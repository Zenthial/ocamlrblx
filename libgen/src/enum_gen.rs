use convert_case::{Case, Casing};

use crate::Enum;

fn to_pascal(s: String) -> String {
    s.to_case(Case::Pascal)
}

pub fn generate_enum(enum_def: &Enum) -> String {
    let mut ret = String::new();

    ret += &format!("module {} = struct\n", enum_def.name.clone());

    ret += "  type t =\n";

    for item in &enum_def.items {
        ret += &format!("    | {}\n", to_pascal(item.name.clone()));
    }

    ret += "end\n\n";

    ret
}
