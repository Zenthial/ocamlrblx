#![allow(dead_code)]

mod class_gen;
mod enum_gen;

use class_gen::generate_classes;
use enum_gen::generate_enum;
use serde::Deserialize;

use std::fs::File;
use std::io::{BufReader, BufWriter, Write};

const DUNE: &str =
    "(include_subdirs unqualified)\n(library (name rbx)\n (modules_without_implementation ";

#[derive(Deserialize, Debug)]
enum ValueTypeCategory {
    Primitive,
    DataType,
    Class,
    Group,
    Enum,
}

#[derive(Deserialize, Debug)]
enum MemberType {
    Property,
    Event,
    Function,
    Callback,
}

#[derive(Deserialize, Debug)]
enum MemoryCategory {
    Internal,
    Animation,
    Gui,
    Instances,
    Script,
    PhysicsParts,
    GraphicsTexture,
}

#[derive(Deserialize, Debug)]
#[serde(rename_all = "PascalCase")]
struct ValueType {
    category: ValueTypeCategory,
    name: String,
}

#[derive(Deserialize, Debug)]
#[serde(rename_all = "PascalCase")]
struct Parameter {
    name: String,
    #[serde(rename = "Type")]
    p_type: ValueType,
}

#[derive(Deserialize, Debug)]
#[serde(rename_all = "PascalCase")]
struct Member {
    category: Option<String>,
    member_type: MemberType,
    name: String,
    tags: Option<Vec<String>>,
    value_type: Option<ValueType>,
    parameters: Option<Vec<Parameter>>, // if parameters, then return type, else value type
    return_type: Option<ValueType>,
}

#[derive(Deserialize, Debug)]
#[serde(rename_all = "PascalCase")]
struct Class {
    members: Vec<Member>,
    name: String,
    superclass: String,
    memory_category: String,
}

#[derive(Deserialize, Debug)]
#[serde(rename_all = "PascalCase")]
struct EnumItem {
    name: String,
    value: i32,
}

#[derive(Deserialize, Debug)]
#[serde(rename_all = "PascalCase")]
struct Enum {
    name: String,
    items: Vec<EnumItem>,
}

#[derive(Deserialize, Debug)]
#[serde(rename_all = "PascalCase")]
struct Api {
    classes: Vec<Class>,
    enums: Vec<Enum>,
}

fn read_api() -> Api {
    let file = File::open("api.json").unwrap();
    let reader = BufReader::new(file);

    serde_json::from_reader(reader).unwrap()
}

fn write_api(writer: &mut BufWriter<File>, buf: String) {
    writer.write_all(buf.as_bytes()).unwrap();
}
fn main() {
    let api = read_api();
    let mut enum_writer = BufWriter::new(File::create("rbx/enums.ml").unwrap());

    for enm in &api.enums {
        let enum_str = generate_enum(enm);
        write_api(&mut enum_writer, enum_str);
    }

    enum_writer.flush().unwrap();

    generate_classes(&api.classes);
}
