#![allow(dead_code)]

mod class_gen;

use class_gen::generate_class;
use serde::Deserialize;

use std::fs::File;
use std::io::{BufReader, BufWriter, Write};

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
struct API {
    classes: Vec<Class>,
}

fn read_api() -> API {
    let file = File::open("api.json").unwrap();
    let reader = BufReader::new(file);

    serde_json::from_reader(reader).unwrap()
}

fn write_api(writer: &mut BufWriter<File>, buf: String) {
    writer.write_all(buf.as_bytes()).unwrap();
}
fn main() {
    let api = read_api();
    let mut writer = BufWriter::new(File::create("classes.ml").unwrap());

    for class in &api.classes {
        let class_str = generate_class(class);
        write_api(&mut writer, class_str);
    }

    writer.flush().unwrap();
}
