use std::{
    collections::HashSet,
    fs::File,
    io::{BufWriter, Write},
};

use crate::{Class, Member, ValueTypeCategory};

use convert_case::{Case, Casing};

fn class_blacklist<'a>() -> HashSet<&'a str> {
    HashSet::from([
        // Classes which Roblox leverages internally/in the CoreScripts but serve no purpose to developers
        "OmniRecommendationsService",
        "CommandService",
        "TutorialService",
        "AnalysticsSettings",
        "BinaryStringValue",
        "BrowserService",
        "CacheableContentProvider",
        "ClusterPacketCache",
        "CookiesService",
        "CorePackages",
        "CoreScript",
        "CoreScriptSyncService",
        "DraftsService",
        "FlagStandService",
        "FlyweightService",
        "FriendService",
        "Geometry",
        "GoogleAnalyticsConfiguration",
        "GuidRegistryService",
        "HttpRbxApiService",
        "HttpRequest",
        "KeyboardService",
        "LocalStorageService",
        "LuaWebService",
        "MemStorageService",
        "MouseService",
        "PartOperationAsset",
        "PermissionsService",
        "PhysicsPacketCache",
        "PlayerEmulatorService",
        "ReflectionMetadataItem",
        "RobloxReplicatedStorage",
        "RuntimeScriptService",
        "SpawnerService",
        "StandalonePluginScripts",
        "StopWatchReporter",
        "ThirdPartyUserService",
        "TimerService",
        "TouchInputService",
        "VirtualInputManager",
        "Visit",
        // never implemented
        "AdvancedDragger",
        "LoginService",
        "NotificationService",
        "ScriptService",
        "Status",
        // super deprecated:
        "AdService",
        "FunctionalTest",
        "PluginManager",
        "VirtualUser",
        // "BevelMesh",
        "CustomEvent",
        "CustomEventReceiver",
        // "CylinderMesh",
        // "DoubleConstrainedValue",
        "Flag",
        "FlagStand",
        // "FloorWire",
        // "Glue",
        "GuiMain",
        // "Hat",
        "Hint",
        // "Hole",
        "Hopper",
        "HopperBin",
        // "IntConstrainedValue",
        // "JointsService",
        "Message",
        // "MotorFeature",
        "PointsService",
        // "SelectionPartLasso",
        // "SelectionPointLasso",
        // "SkateboardPlatform",
        "Skin",
        "ReflectionMetadata",
        "ReflectionMetadataCallbacks",
        "ReflectionMetadataClasses",
        "ReflectionMetadataEnums",
        "ReflectionMetadataEvents",
        "ReflectionMetadataFunctions",
        "ReflectionMetadataProperties",
        "ReflectionMetadataYieldFunctions",
        // unused
        "UGCValidationService",
        "RbxAnalyticsService",
        // PLUGIN ONLY
        "ABTestService",
        "ChangeHistoryService",
        "CoreGui",
        "DataModelSession",
        "DebuggerBreakpoint",
        "DebuggerManager",
        "DebuggerWatch",
        "DebugSettings",
        "File",
        "GameSettings",
        "GlobalSettings",
        "LuaSettings",
        "MemStorageConnection",
        "MultipleDocumentInterfaceInstance",
        "NetworkPeer",
        "NetworkReplicator",
        "NetworkSettings",
        "PackageService",
        "PhysicsSettings",
        "Plugin",
        "PluginAction",
        "PluginDebugService",
        "PluginDragEvent",
        "PluginGui",
        "PluginGuiService",
        "PluginMenu",
        "PluginMouse",
        "PluginToolbar",
        "PluginToolbarButton",
        "RenderingTest",
        "RenderSettings",
        "RobloxPluginGuiService",
        "ScriptDebugger",
        "Selection",
        "StatsItem",
        "Studio",
        "StudioData",
        "StudioService",
        "StudioTheme",
        "TaskScheduler",
        "TestService",
        "VersionControlService",
    ])
}

fn map_type(cat: &ValueTypeCategory, ty: String, class_name: &str) -> String {
    use crate::ValueTypeCategory::*;
    match cat {
        Class => {
            if ty == class_name {
                "t".to_string()
            } else {
                ty + ".t"
            }
        }
        Enum => {
            if ty.contains('?') {
                let type_name = ty.split('?').collect::<Vec<&str>>()[0];
                format!("{}.t option", type_name)
            } else {
                format!("{ty}.t")
            }
        }
        _ => match ty.as_str() {
            "Font" => "Font.t".to_string(),
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
            "Vector3int16" => "vector3_int16".to_string(),
            "Vector2" => "vector2".to_string(),
            "Region3" => "region3".to_string(),
            "Region3int16" => "region3_int16".to_string(),
            "Color3" => "color3".to_string(),
            "Content" => "string".to_string(),
            "Function" => "(unit -> unit)".to_string(),
            "UDim2" => "udim2".to_string(),
            "UDim" => "udim".to_string(),
            _ => {
                if ty.contains('?') {
                    let type_name = ty.split('?').collect::<Vec<&str>>()[0];
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
                let mut member_name = to_snake(member.name.clone());
                if member_name == "type" {
                    member_name = "_type".to_string()
                } else if member_name == "to" {
                    member_name = "_to".to_string()
                } else if member_name == "constraint" {
                    member_name = "_constraint".to_string()
                }
                type_heading += &format!(
                    "    {} : {};\n",
                    member_name,
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

                if mapped_params.is_empty() {
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
    let imports = String::from("open Types\nopen Enum\n\n[@@@warning \"-67\"]");

    let blacklist = class_blacklist();
    let mut writer = BufWriter::new(File::create("rbx/classes.mli").unwrap());
    let mut first_module = false;

    writer.write_all(imports.as_bytes()).unwrap();

    for class in classes {
        if blacklist.contains(class.name.as_str())
            || class.name.contains("Studio")
            || class.name.contains("OpenCloud")
        {
            continue;
        }

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
