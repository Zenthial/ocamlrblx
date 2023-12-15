open Types
open Enums

[@@@warning "-67"]module rec Instance : sig
  type t = {
    archivable : bool;
    class_name : string;
    name : string;
    parent : t;
    roblox_locked : bool;
    source_asset_id : int;
  }
  val add_tag : string -> unit
  val clear_all_children : unit -> unit
  val clone : unit -> t
  val destroy : unit -> unit
  val find_first_ancestor : string -> t
  val find_first_ancestor_of_class : string -> t
  val find_first_ancestor_which_is_a : string -> t
  val find_first_child : string -> bool -> t
  val find_first_child_of_class : string -> t
  val find_first_child_which_is_a : string -> bool -> t
  val find_first_descendant : string -> t
  val get_attribute : string -> 'a
  val get_attribute_changed_signal : string -> rbx_script_signal
  val get_attributes : unit -> (string * 'a) list
  val get_children : unit -> t list
  val get_debug_id : int -> string
  val get_descendants : unit -> 'a list
  val get_full_name : unit -> string
  val get_property_changed_signal : string -> rbx_script_signal
  val get_tags : unit -> 'a list
  val has_tag : string -> bool
  val is_a : string -> bool
  val is_ancestor_of : t -> bool
  val is_descendant_of : t -> bool
  val is_property_modified : string -> bool
  val remove_tag : string -> unit
  val reset_property_to_default : string -> unit
  val set_attribute : string -> 'a -> unit
  val wait_for_child : string -> float -> t
end
and AccessoryDescription : sig
  type t = {
    accessory_type : accessory_type;
    asset_id : int;
    instance : Instance.t;
    is_layered : bool;
    order : int;
    puffiness : float;
  }
end
and AccountService : sig
  type t
  val device_integrity_available : unit -> bool
  val get_device_integrity_token : string -> string
end
and Accoutrement : sig
  type t = {
    attachment_forward : vector3;
    attachment_point : cframe;
    attachment_pos : vector3;
    attachment_right : vector3;
    attachment_up : vector3;
  }
end
and Accessory : sig
  type t = {
    accessory_type : accessory_type;
  }
end
and Hat : sig
  type t
end
and AdPortal : sig
  type t = {
    portal_invalid_reason : string;
    portal_version : int;
    status : ad_unit_status;
  }
  val teleport_confirmed : int -> Player.t -> unit
  val teleport_rejected : bool -> bool -> unit
end
and AdService : sig
  type t
  val get_ad_teleport_info : unit -> 'a list
  val get_report_ad_info : unit -> 'a list
  val return_to_publisher_experience : ad_teleport_method -> unit
end
and AdvancedDragger : sig
  type t
end
and AnalyticsService : sig
  type t
  val fire_custom_event : Instance.t -> string -> 'a -> unit
  val fire_in_game_economy_event : Instance.t -> string -> analytics_economy_action -> string -> int -> string -> 'a -> 'a -> unit
  val fire_log_event : Instance.t -> analytics_log_level -> string -> 'a -> 'a -> unit
  val fire_player_progression_event : Instance.t -> string -> analytics_progression_status -> 'a -> 'a -> 'a -> unit
end
and Animation : sig
  type t = {
    animation_id : string;
  }
end
and AnimationClip : sig
  type t = {
    guid : string;
    loop : bool;
    priority : animation_priority;
  }
end
and CurveAnimation : sig
  type t
end
and KeyframeSequence : sig
  type t = {
    authored_hip_height : float;
  }
  val add_keyframe : Instance.t -> unit
  val get_keyframes : unit -> Instance.t list
  val remove_keyframe : Instance.t -> unit
end
and AnimationClipProvider : sig
  type t
  val get_mem_stats : unit -> (string * 'a) list
  val register_active_animation_clip : AnimationClip.t -> string
  val register_animation_clip : AnimationClip.t -> string
  val get_animation_clip_async : string -> AnimationClip.t
  val get_animations : int -> Instance.t
  val get_clip_evaluator_async : string -> clip_evaluator
end
and AnimationController : sig
  type t
end
and AnimationFromVideoCreatorService : sig
  type t
  val create_job : string -> string
  val download_job_result : string -> string -> string
  val full_process : string -> (unit -> unit) -> string
  val get_job_status : string -> string
end
and AnimationFromVideoCreatorStudioService : sig
  type t
  val is_age_restricted : unit -> bool
  val create_animation_by_uploading_video : (unit -> unit) -> string
  val import_video_with_prompt : unit -> string
end
and AnimationRigData : sig
  type t
  val load_from_humanoid : Instance.t -> bool
end
and AnimationStreamTrack : sig
  type t = {
    animation : TrackerStreamAnimation.t;
    is_playing : bool;
    priority : animation_priority;
    weight_current : float;
    weight_target : float;
  }
  val adjust_weight : float -> float -> unit
  val get_tracker_data : unit -> 'a list
  val play : float -> float -> unit
  val stop : float -> unit
  val toggle_pause : bool -> unit
end
and AnimationTrack : sig
  type t = {
    animation : Animation.t;
    is_playing : bool;
    length : float;
    looped : bool;
    priority : animation_priority;
    speed : float;
    time_position : float;
    weight_current : float;
    weight_target : float;
  }
  val adjust_speed : float -> unit
  val adjust_weight : float -> float -> unit
  val get_marker_reached_signal : string -> rbx_script_signal
  val get_time_of_keyframe : string -> float
  val play : float -> float -> float -> unit
  val stop : float -> unit
end
and Animator : sig
  type t = {
    evaluation_throttled : bool;
    prefer_lod_enabled : bool;
    root_motion : cframe;
    root_motion_weight : float;
  }
  val apply_joint_velocities : 'a -> unit
  val get_playing_animation_tracks : unit -> 'a list
  val get_playing_animation_tracks_core_script : unit -> 'a list
  val load_animation : Animation.t -> AnimationTrack.t
  val load_animation_core_script : Animation.t -> AnimationTrack.t
  val load_stream_animation : TrackerStreamAnimation.t -> AnimationStreamTrack.t
  val load_stream_animation_for_selfie_view_deprecated : TrackerStreamAnimation.t -> Player.t -> AnimationStreamTrack.t
  val register_evaluation_parallel_callback : (unit -> unit) -> unit
  val step_animations : float -> unit
end
and AppUpdateService : sig
  type t
  val can_perform_binary_update : unit -> bool
  val check_for_update : (unit -> unit) -> unit
  val disable_duar : unit -> unit
  val disable_duar_and_open_survey : string -> unit
  val perform_managed_update : unit -> bool
end
and AssetCounterService : sig
  type t
end
and AssetDeliveryProxy : sig
  type t = {
    interface : string;
    port : int;
    start_server : bool;
  }
end
and AssetImportService : sig
  type t
  val get_all_presets : unit -> (string * 'a) list
  val get_preset : string -> (string * 'a) list
  val remove_preset : string -> unit
  val save_preset : string -> (string * 'a) list -> bool
  val start_session_with_path : string -> AssetImportSession.t
  val pick_file_with_prompt : unit -> string
  val pick_multiple_files_with_prompt : unit -> 'a list
  val start_session_with_prompt : unit -> AssetImportSession.t
end
and AssetImportSession : sig
  type t
  val apply_preset : (string * 'a) list -> unit
  val apply_settings : unit -> unit
  val cancel : unit -> unit
  val create_preset_from_data : Instance.t -> (string * 'a) list
  val get_current_status_table : unit -> (string * 'a) list
  val get_filename : unit -> string
  val get_import_tree : unit -> Instance.t
  val get_instance : int -> Instance.t
  val get_rig_visualization : unit -> Instance.t
  val has_animation : unit -> bool
  val is_avatar : unit -> bool
  val is_gltf : unit -> bool
  val is_r_15 : unit -> bool
  val reset : unit -> unit
  val upload : unit -> unit
  val uses_custom_rest_pose_lua : unit -> bool
end
and AssetManagerService : sig
  type t
  val get_mesh_id_from_alias_name : string -> int
  val get_mesh_id_from_asset_id : int -> int
  val get_texture_id_from_alias_name : string -> int
  val get_texture_id_from_asset_id : int -> int
  val has_unpublished_changes_for_linked_source : string -> bool
  val insert_audio : int -> string -> unit
  val insert_image : int -> unit
  val insert_linked_source_as_local_script : string -> unit
  val insert_linked_source_as_module_script : string -> unit
  val insert_linked_source_as_script : string -> unit
  val insert_mesh : string -> bool -> unit
  val insert_meshes_with_location : 'a list -> unit
  val insert_model : int -> unit
  val insert_package : int -> unit
  val insert_video : int -> string -> unit
  val open_linked_source : string -> unit
  val open_place : int -> unit
  val refresh_linked_source : string -> unit
  val revert_linked_source_to_last_published_version : string -> unit
  val show_package_details : int -> unit
  val update_all_packages : int -> unit
  val view_package_on_website : int -> unit
  val add_new_place : unit -> int
  val create_alias : int -> int -> string -> unit
  val delete_alias : string -> unit
  val publish_linked_source : int -> string -> unit
  val remove_place : int -> unit
  val rename_alias : int -> int -> string -> string -> unit
  val rename_model : int -> string -> unit
  val rename_place : int -> string -> unit
end
and AssetPatchSettings : sig
  type t = {
    content_id : string;
    output_path : string;
    patch_id : string;
  }
end
and AssetService : sig
  type t
  val deserialize_instance : string -> Instance.t
  val get_bundle_details_sync : int -> (string * 'a) list
  val register_ugc_validation_function : (unit -> unit) -> unit
  val create_editable_image_async : string -> EditableImage.t
  val create_editable_mesh_async : string -> EditableMesh.t
  val create_editable_mesh_from_part_async : Instance.t -> EditableMesh.t
  val create_place_async : string -> int -> string -> int
  val create_place_in_player_inventory_async : Instance.t -> string -> int -> string -> int
  val get_asset_ids_for_package : int -> 'a list
  val get_bundle_details_async : int -> (string * 'a) list
  val get_game_places_async : unit -> Instance.t
  val prompt_create_asset_async : Player.t -> Instance.t -> asset_type -> 'a list
  val prompt_import_animation_clip_from_video_async : Player.t -> (unit -> unit) -> 'a list
  val save_place_async : unit -> unit
  val search_audio : AudioSearchParams.t -> AudioPages.t
end
and Atmosphere : sig
  type t = {
    color : color3;
    decay : color3;
    density : float;
    glare : float;
    haze : float;
    offset : float;
  }
end
and Attachment : sig
  type t = {
    axis : vector3;
    c_frame : cframe;
    orientation : vector3;
    position : vector3;
    secondary_axis : vector3;
    visible : bool;
    world_axis : vector3;
    world_c_frame : cframe;
    world_orientation : vector3;
    world_position : vector3;
    world_secondary_axis : vector3;
  }
  val get_constraints : unit -> Instance.t list
end
and Bone : sig
  type t = {
    transform : cframe;
    transformed_c_frame : cframe;
    transformed_world_c_frame : cframe;
  }
end
and AudioAnalyzer : sig
  type t = {
    peak_level : float;
    rms_level : float;
  }
  val get_connected_wires : string -> 'a list
  val get_spectrum : unit -> 'a list
end
and AudioChorus : sig
  type t = {
    depth : float;
    mix : float;
    rate : float;
  }
  val get_connected_wires : string -> 'a list
end
and AudioCompressor : sig
  type t = {
    attack : float;
    makeup_gain : float;
    ratio : float;
    release : float;
    threshold : float;
  }
  val get_connected_wires : string -> 'a list
end
and AudioDeviceInput : sig
  type t = {
    access_type : access_modifier_type;
    active : bool;
    is_ready : bool;
    muted : bool;
    player : Player.t;
  }
  val get_connected_wires : string -> 'a list
  val get_user_id_access_list : unit -> 'a list
  val set_user_id_access_list : 'a list -> unit
end
and AudioDeviceOutput : sig
  type t = {
    player : Player.t;
  }
  val get_connected_wires : string -> 'a list
end
and AudioDistortion : sig
  type t = {
    level : float;
  }
  val get_connected_wires : string -> 'a list
end
and AudioEcho : sig
  type t = {
    delay_time : float;
    dry_level : float;
    feedback : float;
    wet_level : float;
  }
  val get_connected_wires : string -> 'a list
end
and AudioEmitter : sig
  type t = {
    audio_interaction_group : string;
  }
  val get_audibility_for : AudioListener.t -> float
  val get_connected_wires : string -> 'a list
  val get_interacting_listeners : unit -> 'a list
end
and AudioEqualizer : sig
  type t = {
    high_gain : float;
    low_gain : float;
    mid_gain : float;
    mid_range : number_range;
  }
  val get_connected_wires : string -> 'a list
end
and AudioFader : sig
  type t = {
    volume : float;
  }
  val get_connected_wires : string -> 'a list
end
and AudioFlanger : sig
  type t = {
    depth : float;
    mix : float;
    rate : float;
  }
  val get_connected_wires : string -> 'a list
end
and AudioListener : sig
  type t = {
    audio_interaction_group : string;
  }
  val get_audibility_of : AudioEmitter.t -> float
  val get_connected_wires : string -> 'a list
  val get_interacting_emitters : unit -> 'a list
end
and AudioPitchShifter : sig
  type t = {
    pitch : float;
  }
  val get_connected_wires : string -> 'a list
end
and AudioPlayer : sig
  type t = {
    asset_id : string;
    auto_load : bool;
    is_playing : bool;
    is_ready : bool;
    loop_region : number_range;
    looping : bool;
    playback_region : number_range;
    playback_speed : float;
    time_length : float;
    time_position : float;
  }
  val get_connected_wires : string -> 'a list
  val play : unit -> unit
  val stop : unit -> unit
end
and AudioReverb : sig
  type t = {
    decay_ratio : float;
    decay_time : float;
    density : float;
    diffusion : float;
    dry_level : float;
    early_delay_time : float;
    high_cut_frequency : float;
    late_delay_time : float;
    low_shelf_frequency : float;
    low_shelf_gain : float;
    reference_frequency : float;
    wet_level : float;
  }
  val get_connected_wires : string -> 'a list
end
and AudioSearchParams : sig
  type t = {
    album : string;
    artist : string;
    audio_sub_type : audio_sub_type;
    max_duration : int;
    min_duration : int;
    search_keyword : string;
    tag : string;
    title : string;
  }
end
and AvatarChatService : sig
  type t = {
    client_features : int;
    client_features_initialized : bool;
    server_features : int;
  }
  val is_enabled : int -> avatar_chat_service_feature -> bool
  val is_place_enabled : unit -> bool
  val is_universe_enabled : unit -> bool
  val poll_client_features : unit -> int
  val poll_server_features : unit -> int
  val get_client_features_async : unit -> int
  val get_server_features_async : unit -> int
end
and AvatarCreationService : sig
  type t
  val prompt_create_avatar_async : Player.t -> HumanoidDescription.t -> 'a list
end
and AvatarEditorService : sig
  type t
  val get_accessory_type : avatar_asset_type -> accessory_type
  val no_prompt_create_outfit : HumanoidDescription.t -> humanoid_rig_type -> string -> bool
  val no_prompt_delete_outfit : int -> bool
  val no_prompt_rename_outfit : int -> string -> bool
  val no_prompt_save_avatar : HumanoidDescription.t -> humanoid_rig_type -> (string * 'a) list -> int -> bool
  val no_prompt_save_avatar_thumbnail_customization : avatar_thumbnail_customization_type -> int -> float -> float -> float -> bool
  val no_prompt_set_favorite : int -> avatar_item_type -> bool -> bool
  val no_prompt_update_outfit : int -> HumanoidDescription.t -> humanoid_rig_type -> bool
  val perform_create_outfit_with_description : HumanoidDescription.t -> string -> unit
  val perform_delete_outfit : unit -> unit
  val perform_rename_outfit : string -> unit
  val perform_save_avatar_with_description : HumanoidDescription.t -> 'a list -> 'a list -> unit
  val perform_set_favorite : unit -> unit
  val perform_update_outfit : HumanoidDescription.t -> unit
  val prompt_allow_inventory_read_access : unit -> unit
  val prompt_create_outfit : HumanoidDescription.t -> humanoid_rig_type -> unit
  val prompt_delete_outfit : int -> unit
  val prompt_rename_outfit : int -> unit
  val prompt_save_avatar : HumanoidDescription.t -> humanoid_rig_type -> unit
  val prompt_set_favorite : int -> avatar_item_type -> bool -> unit
  val prompt_update_outfit : int -> HumanoidDescription.t -> humanoid_rig_type -> unit
  val set_allow_inventory_read_access : bool -> unit
  val signal_create_outfit_failed : unit -> unit
  val signal_create_outfit_permission_denied : unit -> unit
  val signal_delete_outfit_failed : unit -> unit
  val signal_delete_outfit_permission_denied : unit -> unit
  val signal_rename_outfit_failed : unit -> unit
  val signal_rename_outfit_permission_denied : unit -> unit
  val signal_save_avatar_failed : unit -> unit
  val signal_save_avatar_permission_denied : unit -> unit
  val signal_set_favorite_failed : unit -> unit
  val signal_set_favorite_permission_denied : unit -> unit
  val signal_update_outfit_failed : unit -> unit
  val signal_update_outfit_permission_denied : unit -> unit
  val check_apply_default_clothing : HumanoidDescription.t -> HumanoidDescription.t
  val conform_to_avatar_rules : HumanoidDescription.t -> HumanoidDescription.t
  val get_avatar_rules : unit -> (string * 'a) list
  val get_batch_item_details : 'a list -> avatar_item_type -> 'a list
  val get_favorite : int -> avatar_item_type -> bool
  val get_inventory : 'a list -> InventoryPages.t
  val get_item_details : int -> avatar_item_type -> (string * 'a) list
  val get_outfit_details : int -> (string * 'a) list
  val get_outfits : outfit_source -> outfit_type -> OutfitPages.t
  val get_recommended_assets : avatar_asset_type -> int -> 'a list
  val get_recommended_bundles : int -> 'a list
  val search_catalog : catalog_search_params -> CatalogPages.t
end
and AvatarImportService : sig
  type t
  val import_fbx_animation_from_file_path_user_may_choose_model : string -> Instance.t -> (unit -> unit) -> Instance.t
  val import_fbx_animation_user_may_choose_model : Instance.t -> (unit -> unit) -> Instance.t
  val import_fbx_rig_without_scene_load : bool -> Instance.t
  val import_loaded_fbx_animation : bool -> Instance.t
  val load_rig_and_detect_type : (unit -> unit) -> Instance.t
end
and Backpack : sig
  type t
end
and BadgeService : sig
  type t
  val award_badge : int -> int -> bool
  val get_badge_info_async : int -> (string * 'a) list
  val user_has_badge_async : int -> int -> bool
end
and BaseImportData : sig
  type t = {
    id : string;
    import_name : string;
    should_import : bool;
  }
  val create_preset_from_data : unit -> (string * 'a) list
  val get_statuses : unit -> (string * 'a) list
  val get_statuses_deprecated : unit -> (string * 'a) list
end
and AnimationImportData : sig
  type t
end
and FacsImportData : sig
  type t
end
and GroupImportData : sig
  type t = {
    anchored : bool;
    import_as_model_asset : bool;
    insert_in_workspace : bool;
  }
end
and JointImportData : sig
  type t
end
and MaterialImportData : sig
  type t = {
    diffuse_file_path : string;
    is_pbr : bool;
    metalness_file_path : string;
    normal_file_path : string;
    roughness_file_path : string;
  }
end
and MeshImportData : sig
  type t = {
    anchored : bool;
    cage_manifold : bool;
    cage_mesh_intersected_preview : bool;
    cage_mesh_not_intersected : bool;
    cage_no_overlapping_vertices : bool;
    cage_non_manifold_preview : bool;
    cage_overlapping_vertices_preview : bool;
    cage_uv_matched : bool;
    cage_uv_mis_matched_preview : bool;
    dimensions : vector3;
    double_sided : bool;
    ignore_vertex_colors : bool;
    irrelevant_cage_modified_preview : bool;
    mesh_hole_detected_preview : bool;
    mesh_no_hole_detected : bool;
    no_irrelevant_cage_modified : bool;
    no_outer_cage_far_extended_from_mesh : bool;
    outer_cage_far_extended_from_mesh_preview : bool;
    polygon_count : float;
    use_imported_pivot : bool;
  }
end
and RootImportData : sig
  type t = {
    add_model_to_inventory : bool;
    anchored : bool;
    animation_id_for_rest_pose : float;
    existing_package_id : string;
    file_dimensions : vector3;
    import_as_model_asset : bool;
    import_as_package : bool;
    insert_in_workspace : bool;
    insert_with_scene_position : bool;
    invert_negative_faces : bool;
    merge_meshes : bool;
    polygon_count : float;
    rest_pose : rest_pose;
    rig_scale : rig_scale;
    rig_type : rig_type;
    rig_visualization : bool;
    scale_unit : mesh_scale_unit;
    use_scene_origin_as_c_frame : bool;
    use_scene_origin_as_pivot : bool;
    uses_cages : bool;
    validate_ugc_body : bool;
    world_forward : normal_id;
    world_up : normal_id;
  }
end
and BasePlayerGui : sig
  type t
  val get_gui_objects_at_position : int -> int -> Instance.t list
  val get_gui_objects_in_circle : vector2 -> float -> Instance.t list
end
and CoreGui : sig
  type t = {
    selection_image_object : GuiObject.t;
    version : int;
  }
  val set_user_gui_rendering : bool -> Instance.t -> normal_id -> float -> unit
  val take_screenshot : unit -> unit
  val toggle_recording : unit -> unit
end
and PlayerGui : sig
  type t = {
    current_screen_orientation : screen_orientation;
    screen_orientation : screen_orientation;
    selection_image_object : GuiObject.t;
  }
end
and StarterGui : sig
  type t = {
    process_user_input : bool;
    rtl_text_support : rtl_text_support;
    screen_orientation : screen_orientation;
    show_development_gui : bool;
    virtual_cursor_mode : virtual_cursor_mode;
  }
  val get_core_gui_enabled : core_gui_type -> bool
  val register_get_core : string -> (unit -> unit) -> unit
  val register_set_core : string -> (unit -> unit) -> unit
  val set_core : string -> 'a -> unit
  val set_core_gui_enabled : core_gui_type -> bool -> unit
  val get_core : string -> 'a
end
and BaseRemoteEvent : sig
  type t
end
and RemoteEvent : sig
  type t
  val fire_all_clients : 'a list -> unit
  val fire_client : Player.t -> 'a list -> unit
  val fire_server : 'a list -> unit
end
and UnreliableRemoteEvent : sig
  type t
  val fire_all_clients : 'a list -> unit
  val fire_client : Player.t -> 'a list -> unit
  val fire_server : 'a list -> unit
end
and BaseWrap : sig
  type t = {
    cage_mesh_id : string;
    cage_origin : cframe;
    cage_origin_world : cframe;
    hsr_asset_id : string;
    import_origin : cframe;
    import_origin_world : cframe;
  }
  val get_cage_offset : unit -> vector3
  val get_faces : cage_type -> 'a list
  val get_vertices : cage_type -> 'a list
  val is_hsr_ready : unit -> bool
  val modify_vertices : cage_type -> 'a list -> unit
end
and WrapLayer : sig
  type t = {
    auto_skin : wrap_layer_auto_skin;
    bind_offset : cframe;
    color : color3;
    debug_mode : wrap_layer_debug_mode;
    enabled : bool;
    order : int;
    puffiness : float;
    reference_mesh_id : string;
    reference_origin : cframe;
    reference_origin_world : cframe;
    shrink_factor : float;
  }
end
and WrapTarget : sig
  type t = {
    color : color3;
    debug_mode : wrap_target_debug_mode;
    stiffness : float;
  }
end
and Beam : sig
  type t = {
    attachment_0 : Attachment.t;
    attachment_1 : Attachment.t;
    brightness : float;
    color : color_sequence;
    curve_size_0 : float;
    curve_size_1 : float;
    enabled : bool;
    face_camera : bool;
    light_emission : float;
    light_influence : float;
    segments : int;
    texture : string;
    texture_length : float;
    texture_mode : texture_mode;
    texture_speed : float;
    transparency : number_sequence;
    width_0 : float;
    width_1 : float;
    z_offset : float;
  }
  val set_texture_offset : float -> unit
end
and BindableEvent : sig
  type t
  val fire : 'a list -> unit
end
and BindableFunction : sig
  type t
  val invoke : 'a list -> 'a list
end
and BodyMover : sig
  type t
end
and BodyAngularVelocity : sig
  type t = {
    angular_velocity : vector3;
    max_torque : vector3;
    p : float;
  }
end
and BodyForce : sig
  type t = {
    force : vector3;
  }
end
and BodyGyro : sig
  type t = {
    c_frame : cframe;
    d : float;
    max_torque : vector3;
    p : float;
  }
end
and BodyPosition : sig
  type t = {
    d : float;
    max_force : vector3;
    p : float;
    position : vector3;
  }
  val get_last_force : unit -> vector3
end
and BodyThrust : sig
  type t = {
    force : vector3;
    location : vector3;
  }
end
and BodyVelocity : sig
  type t = {
    max_force : vector3;
    p : float;
    velocity : vector3;
  }
  val get_last_force : unit -> vector3
  val last_force : unit -> vector3
end
and RocketPropulsion : sig
  type t = {
    cartoon_factor : float;
    max_speed : float;
    max_thrust : float;
    max_torque : vector3;
    target : BasePart.t;
    target_offset : vector3;
    target_radius : float;
    thrust_d : float;
    thrust_p : float;
    turn_d : float;
    turn_p : float;
  }
  val abort : unit -> unit
  val fire : unit -> unit
end
and BodyPartDescription : sig
  type t = {
    asset_id : int;
    body_part : body_part;
    color : color3;
    instance : Instance.t;
  }
end
and Breakpoint : sig
  type t = {
    condition : string;
    continue_execution : bool;
    enabled : bool;
    id : int;
    line : int;
    log_message : string;
    meta_breakpoint_id : int;
    remove_on_hit : bool;
    script : string;
    valid : bool;
    verified : bool;
  }
end
and BrowserService : sig
  type t
  val close_browser_window : unit -> unit
  val copy_auth_cookie_from_browser_to_engine : unit -> unit
  val emit_hybrid_event : string -> string -> string -> unit
  val execute_java_script : string -> unit
  val open_browser_window : string -> unit
  val open_native_overlay : string -> string -> unit
  val open_we_chat_auth_window : unit -> unit
  val return_to_java_script : string -> bool -> string -> unit
  val send_command : string -> unit
end
and BubbleChatMessageProperties : sig
  type t = {
    background_color_3 : color3;
    background_transparency : float;
    font_face : font;
    tail_visible : bool;
    text_color_3 : color3;
    text_size : int;
  }
end
and BulkImportService : sig
  type t
  val launch_bulk_import : int -> unit
  val show_bulk_import_view : unit -> unit
end
and CacheableContentProvider : sig
  type t
end
and HSRDataContentProvider : sig
  type t
end
and MeshContentProvider : sig
  type t
  val get_content_memory_data : unit -> (string * 'a) list
end
and SolidModelContentProvider : sig
  type t
end
and CalloutService : sig
  type t
  val attach_callout : string -> string -> Instance.t -> unit
  val define_callout : string -> string -> string -> string -> unit
  val detach_callouts_by_definition_id : string -> unit
end
and Camera : sig
  type t = {
    c_frame : cframe;
    camera_subject : Instance.t;
    camera_type : camera_type;
    diagonal_field_of_view : float;
    field_of_view : float;
    field_of_view_mode : field_of_view_mode;
    focus : cframe;
    head_locked : bool;
    head_scale : float;
    max_axis_field_of_view : float;
    near_plane_z : float;
    vr_tilt_and_roll_enabled : bool;
    viewport_size : vector2;
  }
  val get_parts_obscuring_target : 'a list -> Instance.t list -> Instance.t list
  val get_render_c_frame : unit -> cframe
  val get_roll : unit -> float
  val screen_point_to_ray : float -> float -> float -> ray
  val set_image_server_view : cframe -> unit
  val set_roll : float -> unit
  val viewport_point_to_ray : float -> float -> float -> ray
  val world_to_screen_point : vector3 -> 'a list
  val world_to_viewport_point : vector3 -> 'a list
  val zoom : float -> bool
  val zoom_to_extents : cframe -> vector3 -> unit
end
and CaptureService : sig
  type t
  val delete_capture : string -> unit
  val on_capture_began : unit -> unit
  val on_capture_ended : unit -> unit
  val on_save_prompt_finished : int -> (string * 'a) list -> unit
  val on_share_prompt_finished : int -> bool -> unit
  val prompt_save_captures_to_gallery : 'a list -> (unit -> unit) -> unit
  val prompt_share_capture : string -> string -> (unit -> unit) -> (unit -> unit) -> unit
  val retrieve_captures : unit -> 'a list
  val save_capture_to_external_storage : string -> unit
  val save_screenshot_capture : unit -> unit
  val get_capture_size_async : string -> vector2
end
and ChangeHistoryService : sig
  type t
  val finish_recording : string -> finish_recording_operation -> dictionary option -> unit
  val get_can_redo : unit -> 'a list
  val get_can_undo : unit -> 'a list
  val is_recording_in_progress : string option -> bool
  val redo : unit -> unit
  val reset_waypoints : unit -> unit
  val set_enabled : bool -> unit
  val set_waypoint : string -> unit
  val try_begin_recording : string -> string option -> string option
  val undo : unit -> unit
end
and CharacterAppearance : sig
  type t
end
and BodyColors : sig
  type t = {
    head_color : brick_color;
    head_color_3 : color3;
    left_arm_color : brick_color;
    left_arm_color_3 : color3;
    left_leg_color : brick_color;
    left_leg_color_3 : color3;
    right_arm_color : brick_color;
    right_arm_color_3 : color3;
    right_leg_color : brick_color;
    right_leg_color_3 : color3;
    torso_color : brick_color;
    torso_color_3 : color3;
  }
end
and CharacterMesh : sig
  type t = {
    base_texture_id : int;
    body_part : body_part;
    mesh_id : int;
    overlay_texture_id : int;
  }
end
and Clothing : sig
  type t = {
    color_3 : color3;
  }
end
and Pants : sig
  type t = {
    pants_template : string;
  }
end
and Shirt : sig
  type t = {
    shirt_template : string;
  }
end
and ShirtGraphic : sig
  type t = {
    color_3 : color3;
    graphic : string;
  }
end
and Skin : sig
  type t = {
    skin_color : brick_color;
  }
end
and Chat : sig
  type t = {
    bubble_chat_enabled : bool;
    load_default_chat : bool;
  }
  val chat : Instance.t -> string -> chat_color -> unit
  val chat_local : Instance.t -> string -> chat_color -> unit
  val get_should_use_lua_chat : unit -> bool
  val invoke_chat_callback : chat_callback_type -> 'a list -> 'a list
  val register_chat_callback : chat_callback_type -> (unit -> unit) -> unit
  val set_bubble_chat_settings : 'a -> unit
  val can_user_chat_async : int -> bool
  val can_users_chat_async : int -> int -> bool
  val filter_string_async : string -> Player.t -> Player.t -> string
  val filter_string_for_broadcast : string -> Player.t -> string
end
and ChatbotUIService : sig
  type t
  val display_content : string -> (string * 'a) list -> unit
  val get_settings : unit -> (string * 'a) list
end
and ClickDetector : sig
  type t = {
    cursor_icon : string;
    max_activation_distance : float;
  }
end
and DragDetector : sig
  type t = {
    activated_cursor_icon : string;
    apply_at_center_of_mass : bool;
    axis : vector3;
    drag_frame : cframe;
    drag_style : drag_detector_drag_style;
    enabled : bool;
    gamepad_mode_switch_key_code : key_code;
    keyboard_mode_switch_key_code : key_code;
    max_drag_angle : float;
    max_drag_translation : vector3;
    max_force : float;
    max_torque : float;
    min_drag_angle : float;
    min_drag_translation : vector3;
    orientation : vector3;
    reference_instance : Instance.t;
    response_style : drag_detector_response_style;
    responsiveness : float;
    run_locally : bool;
    secondary_axis : vector3;
    trackball_radial_pull_factor : float;
    trackball_roll_factor : float;
    vr_switch_key_code : key_code;
    world_axis : vector3;
    world_secondary_axis : vector3;
  }
  val add_constraint_function : int -> (unit -> unit) -> rbx_script_connection
  val get_reference_frame : unit -> cframe
  val restart_drag : unit -> unit
  val set_drag_style_function : (unit -> unit) -> unit
end
and Clouds : sig
  type t = {
    color : color3;
    cover : float;
    density : float;
    enabled : bool;
  }
end
and ClusterPacketCache : sig
  type t
end
and Collaborator : sig
  type t = {
    c_frame : cframe;
    collaborator_color : int;
    cur_doc_guid : string;
    cur_script_line_number : int;
    user_id : int;
    username : string;
  }
end
and CollaboratorsService : sig
  type t
end
and CollectionService : sig
  type t
  val add_tag : Instance.t -> string -> unit
  val get_all_tags : unit -> 'a list
  val get_instance_added_signal : string -> rbx_script_signal
  val get_instance_removed_signal : string -> rbx_script_signal
  val get_tagged : string -> Instance.t list
  val get_tags : Instance.t -> 'a list
  val has_tag : Instance.t -> string -> bool
  val remove_tag : Instance.t -> string -> unit
end
and CommandInstance : sig
  type t = {
    allow_gui_access_points : bool;
    checked : bool;
    default_shortcut : string;
    display_name : string;
    enabled : bool;
    icon : string;
    name : string;
    permission : command_permission;
    status_tip : string;
  }
  val enable_gui_access : string -> string -> string -> unit
  val register_execution_callback : (unit -> unit) -> unit
end
and CommandService : sig
  type t
  val execute : string -> 'a -> 'a
  val register_command : Plugin.t -> string -> string -> command_permission -> CommandInstance.t
end
and Configuration : sig
  type t
end
and ConfigureServerService : sig
  type t
end
and Constraint : sig
  type t = {
    active : bool;
    attachment_0 : Attachment.t;
    attachment_1 : Attachment.t;
    color : brick_color;
    enabled : bool;
    visible : bool;
  }
end
and AlignOrientation : sig
  type t = {
    align_type : align_type;
    c_frame : cframe;
    look_at_position : vector3;
    max_angular_velocity : float;
    max_torque : float;
    mode : orientation_alignment_mode;
    primary_axis : vector3;
    primary_axis_only : bool;
    reaction_torque_enabled : bool;
    responsiveness : float;
    rigidity_enabled : bool;
    secondary_axis : vector3;
  }
end
and AlignPosition : sig
  type t = {
    apply_at_center_of_mass : bool;
    force_limit_mode : force_limit_mode;
    force_relative_to : actuator_relative_to;
    max_axes_force : vector3;
    max_force : float;
    max_velocity : float;
    mode : position_alignment_mode;
    position : vector3;
    reaction_force_enabled : bool;
    responsiveness : float;
    rigidity_enabled : bool;
  }
end
and AngularVelocity : sig
  type t = {
    angular_velocity : vector3;
    max_torque : float;
    reaction_torque_enabled : bool;
    relative_to : actuator_relative_to;
  }
end
and AnimationConstraint : sig
  type t = {
    is_kinematic : bool;
    max_force : float;
    max_torque : float;
    transform : cframe;
  }
end
and BallSocketConstraint : sig
  type t = {
    limits_enabled : bool;
    max_friction_torque : float;
    radius : float;
    restitution : float;
    twist_limits_enabled : bool;
    twist_lower_angle : float;
    twist_upper_angle : float;
    upper_angle : float;
  }
end
and HingeConstraint : sig
  type t = {
    actuator_type : actuator_type;
    angular_responsiveness : float;
    angular_speed : float;
    angular_velocity : float;
    current_angle : float;
    limits_enabled : bool;
    lower_angle : float;
    motor_max_acceleration : float;
    motor_max_torque : float;
    radius : float;
    restitution : float;
    servo_max_torque : float;
    softlock_servo_upon_reaching_target : bool;
    target_angle : float;
    upper_angle : float;
  }
end
and LineForce : sig
  type t = {
    apply_at_center_of_mass : bool;
    inverse_square_law : bool;
    magnitude : float;
    max_force : float;
    reaction_force_enabled : bool;
  }
end
and LinearVelocity : sig
  type t = {
    force_limit_mode : force_limit_mode;
    force_limits_enabled : bool;
    line_direction : vector3;
    line_velocity : float;
    max_axes_force : vector3;
    max_force : float;
    max_planar_axes_force : vector2;
    plane_velocity : vector2;
    primary_tangent_axis : vector3;
    relative_to : actuator_relative_to;
    secondary_tangent_axis : vector3;
    vector_velocity : vector3;
    velocity_constraint_mode : velocity_constraint_mode;
  }
end
and PlaneConstraint : sig
  type t
end
and Plane : sig
  type t
end
and RigidConstraint : sig
  type t
end
and RodConstraint : sig
  type t = {
    current_distance : float;
    length : float;
    limit_angle_0 : float;
    limit_angle_1 : float;
    limits_enabled : bool;
    thickness : float;
  }
end
and RopeConstraint : sig
  type t = {
    current_distance : float;
    length : float;
    restitution : float;
    thickness : float;
    winch_enabled : bool;
    winch_force : float;
    winch_responsiveness : float;
    winch_speed : float;
    winch_target : float;
  }
end
and SlidingBallConstraint : sig
  type t = {
    actuator_type : actuator_type;
    current_position : float;
    limits_enabled : bool;
    linear_responsiveness : float;
    lower_limit : float;
    motor_max_acceleration : float;
    motor_max_force : float;
    restitution : float;
    servo_max_force : float;
    size : float;
    softlock_servo_upon_reaching_target : bool;
    speed : float;
    target_position : float;
    upper_limit : float;
    velocity : float;
  }
end
and CylindricalConstraint : sig
  type t = {
    angular_actuator_type : actuator_type;
    angular_limits_enabled : bool;
    angular_responsiveness : float;
    angular_restitution : float;
    angular_speed : float;
    angular_velocity : float;
    current_angle : float;
    inclination_angle : float;
    lower_angle : float;
    motor_max_angular_acceleration : float;
    motor_max_torque : float;
    rotation_axis_visible : bool;
    servo_max_torque : float;
    softlock_angular_servo_upon_reaching_target : bool;
    target_angle : float;
    upper_angle : float;
    world_rotation_axis : vector3;
  }
end
and PrismaticConstraint : sig
  type t
end
and SpringConstraint : sig
  type t = {
    coils : float;
    current_length : float;
    damping : float;
    free_length : float;
    limits_enabled : bool;
    max_force : float;
    max_length : float;
    min_length : float;
    radius : float;
    stiffness : float;
    thickness : float;
  }
end
and Torque : sig
  type t = {
    relative_to : actuator_relative_to;
    torque : vector3;
  }
end
and TorsionSpringConstraint : sig
  type t = {
    coils : float;
    current_angle : float;
    damping : float;
    limits_enabled : bool;
    max_angle : float;
    max_torque : float;
    radius : float;
    restitution : float;
    stiffness : float;
  }
end
and UniversalConstraint : sig
  type t = {
    limits_enabled : bool;
    max_angle : float;
    radius : float;
    restitution : float;
  }
end
and VectorForce : sig
  type t = {
    apply_at_center_of_mass : bool;
    force : vector3;
    relative_to : actuator_relative_to;
  }
end
and ContentProvider : sig
  type t = {
    base_url : string;
    request_queue_size : int;
  }
  val calculate_num_triangles_in_mesh_sync : string -> int
  val get_asset_fetch_status : string -> asset_fetch_status
  val get_asset_fetch_status_changed_signal : string -> rbx_script_signal
  val get_detailed_failed_requests : unit -> 'a list
  val get_failed_requests : unit -> 'a list
  val list_encrypted_assets : unit -> 'a list
  val register_default_encryption_key : string -> unit
  val register_default_session_key : string -> unit
  val register_encrypted_asset : string -> string -> unit
  val register_session_encrypted_asset : string -> string -> unit
  val set_base_url : string -> unit
  val unregister_default_encryption_key : unit -> unit
  val unregister_encrypted_asset : string -> unit
  val calculate_num_triangles_in_mesh : string -> int
  val preload_async : 'a list -> (unit -> unit) -> unit
end
and ContextActionService : sig
  type t
  val bind_action : string -> (unit -> unit) -> bool -> 'a list -> unit
  val bind_action_at_priority : string -> (unit -> unit) -> bool -> int -> 'a list -> unit
  val bind_activate : user_input_type -> 'a list -> unit
  val bind_core_action : string -> (unit -> unit) -> bool -> 'a list -> unit
  val bind_core_action_at_priority : string -> (unit -> unit) -> bool -> int -> 'a list -> unit
  val bind_core_activate : user_input_type -> 'a list -> unit
  val call_function : string -> user_input_state -> Instance.t -> 'a list
  val fire_action_button_found_signal : string -> Instance.t -> unit
  val get_all_bound_action_info : unit -> (string * 'a) list
  val get_all_bound_core_action_info : unit -> (string * 'a) list
  val get_bound_action_info : string -> (string * 'a) list
  val get_bound_core_action_info : string -> (string * 'a) list
  val get_current_local_tool_icon : unit -> string
  val set_description : string -> string -> unit
  val set_image : string -> string -> unit
  val set_position : string -> u_dim_2 -> unit
  val set_title : string -> string -> unit
  val unbind_action : string -> unit
  val unbind_activate : user_input_type -> key_code -> unit
  val unbind_all_actions : unit -> unit
  val unbind_core_action : string -> unit
  val unbind_core_activate : user_input_type -> key_code -> unit
  val get_button : string -> Instance.t
end
and Controller : sig
  type t
  val bind_button : button -> string -> unit
  val get_button : button -> bool
  val unbind_button : button -> unit
end
and HumanoidController : sig
  type t
end
and SkateboardController : sig
  type t = {
    steer : float;
    throttle : float;
  }
end
and VehicleController : sig
  type t
end
and ControllerBase : sig
  type t = {
    active : bool;
    balance_rigidity_enabled : bool;
    move_speed_factor : float;
  }
end
and AirController : sig
  type t = {
    balance_max_torque : float;
    balance_speed : float;
    linear_impulse : vector3;
    maintain_angular_momentum : bool;
    maintain_linear_momentum : bool;
    move_max_force : float;
    turn_max_torque : float;
    turn_speed_factor : float;
  }
end
and ClimbController : sig
  type t = {
    acceleration_time : float;
    balance_max_torque : float;
    balance_speed : float;
    move_max_force : float;
  }
end
and GroundController : sig
  type t = {
    acceleration_lean : float;
    acceleration_time : float;
    balance_max_torque : float;
    balance_speed : float;
    deceleration_time : float;
    friction : float;
    friction_weight : float;
    ground_offset : float;
    stand_force : float;
    stand_speed : float;
    turn_speed_factor : float;
  }
end
and SwimController : sig
  type t = {
    acceleration_time : float;
    pitch_max_torque : float;
    pitch_speed_factor : float;
    roll_max_torque : float;
    roll_speed_factor : float;
  }
end
and ControllerManager : sig
  type t = {
    active_controller : ControllerBase.t;
    base_move_speed : float;
    base_turn_speed : float;
    climb_sensor : ControllerSensor.t;
    facing_direction : vector3;
    ground_sensor : ControllerSensor.t;
    moving_direction : vector3;
    root_part : BasePart.t;
  }
end
and ControllerService : sig
  type t
end
and CookiesService : sig
  type t
end
and CorePackages : sig
  type t
end
and CoreScriptDebuggingManagerHelper : sig
  type t
end
and CoreScriptSyncService : sig
  type t
  val get_script_file_path : Instance.t -> 'a
end
and CreationDBService : sig
  type t
end
and CrossDMScriptChangeListener : sig
  type t
  val is_watching_script_line : string -> int -> bool
  val start_watching_script_line : string -> int -> int -> unit
end
and CustomEvent : sig
  type t
  val get_attached_receivers : unit -> Instance.t list
  val set_value : float -> unit
end
and CustomEventReceiver : sig
  type t = {
    source : Instance.t;
  }
  val get_current_value : unit -> float
end
and DataModelMesh : sig
  type t = {
    offset : vector3;
    scale : vector3;
    vertex_color : vector3;
  }
end
and BevelMesh : sig
  type t
end
and BlockMesh : sig
  type t
end
and CylinderMesh : sig
  type t
end
and EditableMesh : sig
  type t = {
    mesh_version : int;
  }
  val add_triangle : int -> int -> int -> int
  val add_vertex : vector3 -> int
  val find_closest_point_on_surface : vector3 -> 'a list
  val find_closest_vertex : vector3 -> int
  val find_vertices_within_sphere : vector3 -> float -> 'a list
  val get_adjacent_triangles : int -> 'a list
  val get_adjacent_vertices : int -> 'a list
  val get_position : int -> vector3
  val get_triangle_vertices : int -> 'a list
  val get_triangles : unit -> 'a list
  val get_uv : int -> vector2
  val get_vertex_color : int -> color3
  val get_vertex_color_alpha : int -> float
  val get_vertex_normal : int -> vector3
  val get_vertices : unit -> 'a list
  val raycast_local : vector3 -> vector3 -> 'a list
  val remove_triangle : int -> unit
  val remove_vertex : int -> unit
  val set_position : int -> vector3 -> unit
  val set_uv : int -> vector2 -> unit
  val set_vertex_color : int -> color3 -> unit
  val set_vertex_color_alpha : int -> float -> unit
  val set_vertex_normal : int -> vector3 -> unit
  val create_mesh_part_async : collision_fidelity -> MeshPart.t
end
and FileMesh : sig
  type t = {
    mesh_id : string;
    texture_id : string;
  }
end
and SpecialMesh : sig
  type t = {
    mesh_type : mesh_type;
  }
end
and DataModelPatchService : sig
  type t
  val get_patch : string -> Instance.t
  val register_patch : string -> string -> string -> int -> unit
  val update_patch : int -> string -> (unit -> unit) -> unit
end
and DataModelSession : sig
  type t = {
    current_data_model_type : studio_data_model_type;
    session_id : string;
  }
end
and DataStoreGetOptions : sig
  type t = {
    use_cache : bool;
  }
end
and DataStoreIncrementOptions : sig
  type t
  val get_metadata : unit -> (string * 'a) list
  val set_metadata : (string * 'a) list -> unit
end
and DataStoreInfo : sig
  type t = {
    created_time : int;
    data_store_name : string;
    updated_time : int;
  }
end
and DataStoreKey : sig
  type t = {
    key_name : string;
  }
end
and DataStoreKeyInfo : sig
  type t = {
    created_time : int;
    updated_time : int;
    version : string;
  }
  val get_metadata : unit -> (string * 'a) list
  val get_user_ids : unit -> 'a list
end
and DataStoreObjectVersionInfo : sig
  type t = {
    created_time : int;
    is_deleted : bool;
    version : string;
  }
end
and DataStoreOptions : sig
  type t = {
    all_scopes : bool;
  }
  val set_experimental_features : (string * 'a) list -> unit
end
and DataStoreService : sig
  type t = {
    automatic_retry : bool;
  }
  val get_data_store : string -> string -> Instance.t -> GlobalDataStore.t
  val get_global_data_store : unit -> GlobalDataStore.t
  val get_ordered_data_store : string -> string -> OrderedDataStore.t
  val get_request_budget_for_request_type : data_store_request_type -> int
  val list_data_stores_async : string -> int -> string -> DataStoreListingPages.t
end
and DataStoreSetOptions : sig
  type t
  val get_metadata : unit -> (string * 'a) list
  val set_metadata : (string * 'a) list -> unit
end
and Debris : sig
  type t
  val add_item : Instance.t -> float -> unit
  val set_legacy_max_items : bool -> unit
end
and DebugSettings : sig
  type t = {
    data_model : int;
    instance_count : int;
    is_script_stack_tracing_enabled : bool;
    job_count : int;
    player_count : int;
    report_sound_warnings : bool;
    roblox_version : string;
    tick_count_precise_override : tick_count_sample_method;
  }
end
and DebuggablePluginWatcher : sig
  type t
end
and DebuggerBreakpoint : sig
  type t = {
    condition : string;
    continue_execution : bool;
    is_enabled : bool;
    line : int;
    log_expression : string;
    is_context_dependent_breakpoint : bool;
  }
end
and DebuggerConnection : sig
  type t = {
    error_message : string;
    has_error : bool;
    id : int;
    is_paused : bool;
  }
  val add_breakpoint : string -> int -> Breakpoint.t -> unit
  val close : unit -> unit
  val evaluate_watch : string -> StackFrame.t -> (unit -> unit) -> int
  val get_frame_by_id : int -> StackFrame.t
  val get_source : string -> (unit -> unit) -> int
  val get_thread_by_id : int -> ThreadState.t
  val get_threads : (unit -> unit) -> int
  val get_variable_by_id : int -> DebuggerVariable.t
  val pause : ThreadState.t -> (unit -> unit) -> int
  val populate : Instance.t -> (unit -> unit) -> int
  val remove_breakpoint : Breakpoint.t -> unit
  val resume : ThreadState.t -> (unit -> unit) -> int
  val set_exception_break_mode : debugger_exception_break_mode -> (unit -> unit) -> int
  val set_variable : DebuggerVariable.t -> string -> (unit -> unit) -> int
  val step : ThreadState.t -> (unit -> unit) -> int
  val step_in : ThreadState.t -> (unit -> unit) -> int
  val step_out : ThreadState.t -> (unit -> unit) -> int
  val update_selected_frame : int -> int -> unit
end
and LocalDebuggerConnection : sig
  type t
end
and DebuggerConnectionManager : sig
  type t = {
    timeout : float;
  }
  val connect_local : DataModel.t -> int
  val connect_remote : string -> int -> int
  val focus_connection : DebuggerConnection.t -> unit
  val get_connection_by_id : int -> DebuggerConnection.t
end
and DebuggerLuaResponse : sig
  type t = {
    is_error : bool;
    is_success : bool;
    message : string;
    request_id : int;
    status : debugger_status;
  }
  val get_arg : unit -> 'a
end
and DebuggerManager : sig
  type t = {
    debugging_enabled : bool;
  }
  val add_debugger : Instance.t -> Instance.t
  val enable_debugging : unit -> unit
  val get_debuggers : unit -> Instance.t list
  val resume : unit -> unit
end
and DebuggerUIService : sig
  type t
  val edit_breakpoint : int -> unit
  val edit_watch : string -> unit
  val is_connection_for_play_data_model : int -> bool
  val open_exception_message_popup : string -> int -> unit
  val open_script_at_line : string -> int -> int -> bool -> unit
  val pause : unit -> unit
  val remove_script_line_markers : int -> bool -> unit
  val resume : unit -> unit
  val set_current_thread_id : int -> unit
  val set_script_line_marker : string -> int -> int -> bool -> unit
  val set_watch_expressions : 'a list -> unit
end
and DebuggerVariable : sig
  type t = {
    name : string;
    populated : bool;
    type : string;
    value : string;
    variable_id : int;
    variables_count : int;
  }
  val get_variable_by_index : int -> t
  val get_variable_by_name : string -> t
end
and DebuggerWatch : sig
  type t = {
    expression : string;
  }
end
and DeviceIdService : sig
  type t
  val get_device_id : unit -> string
end
and Dialog : sig
  type t = {
    behavior_type : dialog_behavior_type;
    conversation_distance : float;
    goodbye_choice_active : bool;
    goodbye_dialog : string;
    in_use : bool;
    initial_prompt : string;
    purpose : dialog_purpose;
    tone : dialog_tone;
    trigger_distance : float;
    trigger_offset : vector3;
  }
  val get_current_players : unit -> Instance.t list
  val set_player_is_using : Instance.t -> bool -> unit
  val signal_dialog_choice_selected : Instance.t -> Instance.t -> unit
end
and DialogChoice : sig
  type t = {
    goodbye_choice_active : bool;
    goodbye_dialog : string;
    response_dialog : string;
    user_dialog : string;
  }
end
and DraftsService : sig
  type t
  val discard_edits : Instance.t list -> unit
  val get_draft_status : Instance.t -> draft_status_code
  val get_editors : Instance.t -> Instance.t list
  val restore_scripts : Instance.t list -> unit
  val show_diffs_against_base : Instance.t list -> unit
  val show_diffs_against_server : Instance.t list -> unit
  val commit_edits : Instance.t list -> unit
  val get_drafts : unit -> Instance.t list
  val update_to_latest_version : Instance.t list -> unit
end
and Dragger : sig
  type t
  val axis_rotate : axis -> unit
  val mouse_down : Instance.t -> vector3 -> Instance.t list -> unit
  val mouse_move : ray -> unit
  val mouse_up : unit -> unit
end
and DraggerService : sig
  type t = {
    align_dragged_objects : bool;
    angle_snap_enabled : bool;
    angle_snap_increment : float;
    animate_hover : bool;
    collisions_enabled : bool;
    dragger_coordinate_space : dragger_coordinate_space;
    dragger_movement_mode : dragger_movement_mode;
    geometry_snap_color : color3;
    hover_animate_frequency : float;
    hover_line_thickness : int;
    hover_thickness : float;
    joints_enabled : bool;
    linear_snap_enabled : bool;
    linear_snap_increment : float;
    pivot_snap_to_geometry : bool;
    show_hover : bool;
    show_pivot_indicator : bool;
  }
end
and EditableImage : sig
  type t = {
    size : vector2;
  }
  val copy : vector2 -> vector2 -> t
  val crop : vector2 -> vector2 -> unit
  val draw_circle : vector2 -> int -> color3 -> float -> unit
  val draw_image : vector2 -> t -> image_combine_type -> unit
  val draw_line : vector2 -> vector2 -> color3 -> float -> unit
  val draw_rectangle : vector2 -> vector2 -> color3 -> float -> unit
  val read_pixels : vector2 -> vector2 -> 'a list
  val resize : vector2 -> unit
  val rotate : float -> bool -> unit
  val write_pixels : vector2 -> vector2 -> 'a list -> unit
end
and EngineAPICloudProcessingService : sig
  type t
end
and EulerRotationCurve : sig
  type t = {
    rotation_order : rotation_order;
  }
  val get_angles_at_time : float -> 'a list
  val get_rotation_at_time : float -> cframe
  val x : unit -> FloatCurve.t
  val y : unit -> FloatCurve.t
  val z : unit -> FloatCurve.t
end
and EventIngestService : sig
  type t
  val send_event_deferred : string -> string -> string -> (string * 'a) list -> unit
  val send_event_immediately : string -> string -> string -> (string * 'a) list -> unit
  val set_rbx_event : string -> string -> string -> (string * 'a) list -> unit
  val set_rbx_event_stream : string -> string -> string -> (string * 'a) list -> unit
end
and ExperienceAuthService : sig
  type t
  val scope_check_ui_complete : string -> 'a list -> scope_check_result -> (string * 'a) list -> unit
end
and ExperienceInviteOptions : sig
  type t = {
    invite_message_id : string;
    invite_user : int;
    launch_data : string;
    prompt_message : string;
  }
end
and ExperienceNotificationService : sig
  type t
  val create_user_notification_async : string -> UserNotification.t -> Instance.t
end
and ExperienceService : sig
  type t
  val launch_experience : (string * 'a) list -> string
  val launch_experience_from_source : (string * 'a) list -> string -> string
  val launch_experience_from_source_with_callback : (string * 'a) list -> string -> (unit -> unit) -> unit
  val register_for_experience_join : (unit -> unit) -> rbx_script_connection
  val register_for_experience_leave : (unit -> unit) -> rbx_script_connection
end
and ExperienceStateCaptureService : sig
  type t = {
    is_in_capture_mode : bool;
  }
  val reset_highlight : unit -> unit
  val toggle_capture_mode : unit -> unit
end
and Explosion : sig
  type t = {
    blast_pressure : float;
    blast_radius : float;
    destroy_joint_radius_percent : float;
    explosion_type : explosion_type;
    position : vector3;
    time_scale : float;
    visible : bool;
  }
end
and FaceAnimatorService : sig
  type t = {
    audio_animation_enabled : bool;
    face_tracking_status_enum : tracker_face_tracking_status;
    flip_head_orientation : bool;
    video_animation_enabled : bool;
  }
  val get_tracker_lod_controller : unit -> TrackerLodController.t
  val init : bool -> bool -> unit
  val is_started : unit -> bool
  val start : unit -> unit
  val step : unit -> unit
  val stop : unit -> unit
end
and FaceControls : sig
  type t = {
    chin_raiser : float;
    chin_raiser_upper_lip : float;
    corrugator : float;
    eyes_look_down : float;
    eyes_look_left : float;
    eyes_look_right : float;
    eyes_look_up : float;
    flat_pucker : float;
    funneler : float;
    jaw_drop : float;
    jaw_left : float;
    jaw_right : float;
    left_brow_lowerer : float;
    left_cheek_puff : float;
    left_cheek_raiser : float;
    left_dimpler : float;
    left_eye_closed : float;
    left_eye_upper_lid_raiser : float;
    left_inner_brow_raiser : float;
    left_lip_corner_down : float;
    left_lip_corner_puller : float;
    left_lip_stretcher : float;
    left_lower_lip_depressor : float;
    left_nose_wrinkler : float;
    left_outer_brow_raiser : float;
    left_upper_lip_raiser : float;
    lip_presser : float;
    lips_together : float;
    lower_lip_suck : float;
    mouth_left : float;
    mouth_right : float;
    pucker : float;
    right_brow_lowerer : float;
    right_cheek_puff : float;
    right_cheek_raiser : float;
    right_dimpler : float;
    right_eye_closed : float;
    right_eye_upper_lid_raiser : float;
    right_inner_brow_raiser : float;
    right_lip_corner_down : float;
    right_lip_corner_puller : float;
    right_lip_stretcher : float;
    right_lower_lip_depressor : float;
    right_nose_wrinkler : float;
    right_outer_brow_raiser : float;
    right_upper_lip_raiser : float;
    tongue_down : float;
    tongue_out : float;
    tongue_up : float;
    upper_lip_suck : float;
  }
end
and FaceInstance : sig
  type t = {
    face : normal_id;
  }
end
and Decal : sig
  type t = {
    color_3 : color3;
    local_transparency_modifier : float;
    texture : string;
    transparency : float;
    z_index : int;
  }
end
and Texture : sig
  type t = {
    offset_studs_u : float;
    offset_studs_v : float;
    studs_per_tile_u : float;
    studs_per_tile_v : float;
  }
end
and FacialAnimationRecordingService : sig
  type t = {
    biometric_data_consent : bool;
  }
  val is_age_restricted : unit -> bool
  val check_or_request_camera_permission : unit -> string
end
and FacialAnimationStreamingServiceStats : sig
  type t
  val get : string -> int
  val get_with_player_id : string -> int -> int
end
and FacialAnimationStreamingServiceV2 : sig
  type t = {
    service_state : int;
  }
  val get_stats : unit -> FacialAnimationStreamingServiceStats.t
  val is_audio_enabled : int -> bool
  val is_place_enabled : int -> bool
  val is_server_enabled : int -> bool
  val is_video_enabled : int -> bool
  val resolve_state_for_user : int -> int
end
and FacialAnimationStreamingSubsessionStats : sig
  type t
end
and Feature : sig
  type t = {
    face_id : normal_id;
    in_out : in_out;
    left_right : left_right;
    top_bottom : top_bottom;
  }
end
and Hole : sig
  type t
end
and MotorFeature : sig
  type t
end
and File : sig
  type t = {
    size : int;
  }
  val get_binary_contents : unit -> string
  val get_temporary_id : unit -> string
end
and Fire : sig
  type t = {
    color : color3;
    enabled : bool;
    heat : float;
    secondary_color : color3;
    size : float;
    time_scale : float;
  }
  val fast_forward : int -> unit
end
and FlagStandService : sig
  type t
end
and FloatCurve : sig
  type t = {
    length : int;
  }
  val get_key_at_index : int -> float_curve_key
  val get_key_indices_at_time : float -> 'a list
  val get_keys : unit -> 'a list
  val get_value_at_time : float -> float option
  val insert_key : float_curve_key -> 'a list
  val remove_key_at_index : int -> int -> int
  val set_keys : 'a list -> int
end
and FlyweightService : sig
  type t
end
and CSGDictionaryService : sig
  type t
end
and NonReplicatedCSGDictionaryService : sig
  type t
end
and Folder : sig
  type t
end
and ForceField : sig
  type t = {
    visible : bool;
  }
end
and FriendService : sig
  type t
  val get_platform_friends : unit -> 'a list
end
and FunctionalTest : sig
  type t = {
    description : string;
  }
  val error : string -> unit
  val failed : string -> unit
  val pass : string -> unit
  val passed : string -> unit
  val warn : string -> unit
end
and GamePassService : sig
  type t
end
and GameSettings : sig
  type t = {
    video_capture_enabled : bool;
    video_recording : bool;
  }
end
and GamepadService : sig
  type t = {
    gamepad_cursor_enabled : bool;
  }
  val disable_gamepad_cursor : unit -> unit
  val enable_gamepad_cursor : Instance.t -> unit
  val get_gamepad_cursor_position : unit -> vector2
  val set_gamepad_cursor_position : vector2 -> unit
end
and Geometry : sig
  type t
end
and GeometryService : sig
  type t
  val calculate_constraints_to_preserve : Instance.t -> 'a list -> (string * 'a) list -> 'a list
  val hash_mesh_async : string -> string
  val intersect_async : Instance.t -> 'a list -> (string * 'a) list -> 'a list
  val stitch_meshes_async : 'a list -> string
  val subtract_async : Instance.t -> 'a list -> (string * 'a) list -> 'a list
  val union_async : Instance.t -> 'a list -> (string * 'a) list -> 'a list
end
and GetTextBoundsParams : sig
  type t = {
    font : font;
    size : float;
    text : string;
    width : float;
  }
end
and GlobalDataStore : sig
  type t
  val get_async : string -> DataStoreGetOptions.t -> 'a list
  val increment_async : string -> int -> 'a list -> DataStoreIncrementOptions.t -> 'a
  val remove_async : string -> 'a list
  val set_async : string -> 'a -> 'a list -> DataStoreSetOptions.t -> 'a
  val update_async : string -> (unit -> unit) -> 'a list
end
and DataStore : sig
  type t
  val get_version_async : string -> string -> 'a list
  val list_keys_async : string -> int -> string -> bool -> DataStoreKeyPages.t
  val list_versions_async : string -> sort_direction -> int -> int -> int -> DataStoreVersionPages.t
  val remove_version_async : string -> string -> unit
end
and OrderedDataStore : sig
  type t
  val get_sorted_async : bool -> int -> 'a -> 'a -> Instance.t
end
and GoogleAnalyticsConfiguration : sig
  type t
end
and GroupService : sig
  type t
  val get_allies_async : int -> StandardPages.t
  val get_enemies_async : int -> StandardPages.t
  val get_group_info_async : int -> 'a
  val get_groups_async : int -> 'a list
end
and GuiBase : sig
  type t
end
and GuiBase2d : sig
  type t = {
    absolute_position : vector2;
    absolute_rotation : float;
    absolute_size : vector2;
    auto_localize : bool;
    clipped_rect : rect;
    is_not_occluded : bool;
    raw_rect_2_d : rect;
    root_localization_table : LocalizationTable.t;
    selection_behavior_down : selection_behavior;
    selection_behavior_left : selection_behavior;
    selection_behavior_right : selection_behavior;
    selection_behavior_up : selection_behavior;
    selection_group : bool;
    total_group_scale : float;
  }
end
and GuiObject : sig
  type t = {
    active : bool;
    anchor_point : vector2;
    automatic_size : automatic_size;
    background_color_3 : color3;
    background_transparency : float;
    border_color_3 : color3;
    border_mode : border_mode;
    border_size_pixel : int;
    clips_descendants : bool;
    gui_state : gui_state;
    interactable : bool;
    layout_order : int;
    next_selection_down : t;
    next_selection_left : t;
    next_selection_right : t;
    next_selection_up : t;
    position : u_dim_2;
    rotation : float;
    selectable : bool;
    selection_image_object : t;
    selection_order : int;
    size : u_dim_2;
    size_constraint : size_constraint;
    transparency : float;
    visible : bool;
    z_index : int;
  }
  val tween_position : u_dim_2 -> easing_direction -> easing_style -> float -> bool -> (unit -> unit) -> bool
  val tween_size : u_dim_2 -> easing_direction -> easing_style -> float -> bool -> (unit -> unit) -> bool
  val tween_size_and_position : u_dim_2 -> u_dim_2 -> easing_direction -> easing_style -> float -> bool -> (unit -> unit) -> bool
end
and CanvasGroup : sig
  type t = {
    group_color_3 : color3;
    group_transparency : float;
  }
end
and Frame : sig
  type t = {
    style : frame_style;
  }
end
and GuiButton : sig
  type t = {
    auto_button_color : bool;
    modal : bool;
    selected : bool;
    style : button_style;
  }
end
and ImageButton : sig
  type t = {
    content_image_size : vector2;
    hover_image : string;
    image : string;
    image_color_3 : color3;
    image_rect_offset : vector2;
    image_rect_size : vector2;
    image_transparency : float;
    is_loaded : bool;
    pressed_image : string;
    resample_mode : resampler_mode;
    scale_type : scale_type;
    slice_center : rect;
    slice_scale : float;
    tile_size : u_dim_2;
  }
  val set_enable_content_image_size_changed_events : bool -> unit
end
and TextButton : sig
  type t = {
    content_text : string;
    font : font;
    font_face : font;
    line_height : float;
    localization_match_identifier : string;
    localization_matched_source_text : string;
    localized_text : string;
    max_visible_graphemes : int;
    rich_text : bool;
    text : string;
    text_bounds : vector2;
    text_color_3 : color3;
    text_direction : text_direction;
    text_fits : bool;
    text_scaled : bool;
    text_size : float;
    text_stroke_color_3 : color3;
    text_stroke_transparency : float;
    text_transparency : float;
    text_truncate : text_truncate;
    text_wrapped : bool;
    text_x_alignment : text_x_alignment;
    text_y_alignment : text_y_alignment;
  }
  val set_text_from_input : string -> unit
end
and GuiLabel : sig
  type t
end
and ImageLabel : sig
  type t = {
    content_image_size : vector2;
    image : string;
    image_color_3 : color3;
    image_rect_offset : vector2;
    image_rect_size : vector2;
    image_transparency : float;
    is_loaded : bool;
    resample_mode : resampler_mode;
    scale_type : scale_type;
    slice_center : rect;
    slice_scale : float;
    tile_size : u_dim_2;
  }
  val set_enable_content_image_size_changed_events : bool -> unit
end
and TextLabel : sig
  type t = {
    content_text : string;
    font : font;
    font_face : font;
    line_height : float;
    localization_match_identifier : string;
    localization_matched_source_text : string;
    localized_text : string;
    max_visible_graphemes : int;
    rich_text : bool;
    text : string;
    text_bounds : vector2;
    text_color_3 : color3;
    text_direction : text_direction;
    text_fits : bool;
    text_scaled : bool;
    text_size : float;
    text_stroke_color_3 : color3;
    text_stroke_transparency : float;
    text_transparency : float;
    text_truncate : text_truncate;
    text_wrapped : bool;
    text_x_alignment : text_x_alignment;
    text_y_alignment : text_y_alignment;
  }
  val set_text_from_input : string -> unit
end
and ScrollingFrame : sig
  type t = {
    absolute_canvas_size : vector2;
    absolute_window_size : vector2;
    automatic_canvas_size : automatic_size;
    bottom_image : string;
    canvas_position : vector2;
    canvas_size : u_dim_2;
    elastic_behavior : elastic_behavior;
    horizontal_bar_rect : rect;
    horizontal_scroll_bar_inset : scroll_bar_inset;
    max_canvas_position : vector2;
    mid_image : string;
    scroll_bar_image_color_3 : color3;
    scroll_bar_image_transparency : float;
    scroll_bar_thickness : int;
    scroll_velocity : vector2;
    scrolling_direction : scrolling_direction;
    scrolling_enabled : bool;
    top_image : string;
    vertical_bar_rect : rect;
    vertical_scroll_bar_inset : scroll_bar_inset;
    vertical_scroll_bar_position : vertical_scroll_bar_position;
  }
  val clear_inertial_scrolling : unit -> unit
  val get_sampled_inertial_velocity : unit -> vector2
  val scroll_to_top : unit -> unit
end
and TextBox : sig
  type t = {
    clear_text_on_focus : bool;
    content_text : string;
    cursor_position : int;
    font : font;
    font_face : font;
    line_height : float;
    localization_match_identifier : string;
    localization_matched_source_text : string;
    manual_focus_release : bool;
    max_visible_graphemes : int;
    multi_line : bool;
    overlay_native_input : bool;
    placeholder_color_3 : color3;
    placeholder_text : string;
    return_key_type : return_key_type;
    rich_text : bool;
    selection_start : int;
    show_native_input : bool;
    text : string;
    text_bounds : vector2;
    text_color_3 : color3;
    text_direction : text_direction;
    text_editable : bool;
    text_fits : bool;
    text_input_type : text_input_type;
    text_scaled : bool;
    text_size : float;
    text_stroke_color_3 : color3;
    text_stroke_transparency : float;
    text_transparency : float;
    text_truncate : text_truncate;
    text_wrapped : bool;
    text_x_alignment : text_x_alignment;
    text_y_alignment : text_y_alignment;
  }
  val capture_focus : unit -> unit
  val is_focused : unit -> bool
  val release_focus : bool -> unit
  val reset_keyboard_mode : unit -> unit
  val set_text_from_input : string -> unit
end
and VideoFrame : sig
  type t = {
    is_loaded : bool;
    looped : bool;
    playing : bool;
    resolution : vector2;
    time_length : float;
    time_position : float;
    video : string;
    volume : float;
  }
  val pause : unit -> unit
  val play : unit -> unit
end
and ViewportFrame : sig
  type t = {
    ambient : color3;
    current_camera : Camera.t;
    image_color_3 : color3;
    image_transparency : float;
    is_mirrored : bool;
    light_color : color3;
    light_direction : vector3;
  }
  val capture_snapshot_async : unit -> string
end
and LayerCollector : sig
  type t = {
    enabled : bool;
    reset_on_spawn : bool;
    z_index_behavior : z_index_behavior;
  }
end
and BillboardGui : sig
  type t = {
    active : bool;
    adornee : Instance.t;
    always_on_top : bool;
    brightness : float;
    clips_descendants : bool;
    current_distance : float;
    distance_lower_limit : float;
    distance_step : float;
    distance_upper_limit : float;
    extents_offset : vector3;
    extents_offset_world_space : vector3;
    light_influence : float;
    max_distance : float;
    player_to_hide_from : Instance.t;
    size : u_dim_2;
    size_offset : vector2;
    studs_offset : vector3;
    studs_offset_world_space : vector3;
  }
  val get_screen_space_bounds : unit -> 'a
end
and PluginGui : sig
  type t = {
    title : string;
  }
  val bind_to_close : (unit -> unit) -> unit
  val get_relative_mouse_position : unit -> vector2
end
and DockWidgetPluginGui : sig
  type t = {
    host_widget_was_restored : bool;
  }
  val request_raise : unit -> unit
end
and QWidgetPluginGui : sig
  type t
end
and ScreenGui : sig
  type t = {
    clip_to_device_safe_area : bool;
    display_order : int;
    ignore_gui_inset : bool;
    on_top_of_core_blur : bool;
    safe_area_compatibility : safe_area_compatibility;
    screen_insets : screen_insets;
  }
end
and GuiMain : sig
  type t
end
and SurfaceGuiBase : sig
  type t = {
    active : bool;
    adornee : Instance.t;
    face : normal_id;
  }
end
and AdGui : sig
  type t = {
    ad_shape : ad_shape;
    enable_video_ads : bool;
    fallback_image : string;
    status : ad_unit_status;
  }
end
and SurfaceGui : sig
  type t = {
    always_on_top : bool;
    brightness : float;
    canvas_size : vector2;
    clips_descendants : bool;
    horizontal_curvature : float;
    light_influence : float;
    max_distance : float;
    pixels_per_stud : float;
    shape : surface_gui_shape;
    sizing_mode : surface_gui_sizing_mode;
    tool_punch_through_distance : float;
    z_offset : float;
  }
end
and GuiBase3d : sig
  type t = {
    color_3 : color3;
    transparency : float;
    visible : bool;
  }
end
and FloorWire : sig
  type t = {
    cycle_offset : float;
    from : BasePart.t;
    studs_between_textures : float;
    texture : string;
    texture_size : vector2;
    to : BasePart.t;
    velocity : float;
    wire_radius : float;
  }
end
and InstanceAdornment : sig
  type t = {
    adornee : Instance.t;
  }
end
and SelectionBox : sig
  type t = {
    line_thickness : float;
    studio_selection_box : bool;
    surface_color_3 : color3;
    surface_transparency : float;
  }
end
and PVAdornment : sig
  type t = {
    adornee : PVInstance.t;
  }
end
and HandleAdornment : sig
  type t = {
    adorn_culling_mode : adorn_culling_mode;
    always_on_top : bool;
    c_frame : cframe;
    size_relative_offset : vector3;
    z_index : int;
  }
end
and BoxHandleAdornment : sig
  type t = {
    size : vector3;
  }
end
and ConeHandleAdornment : sig
  type t = {
    height : float;
    radius : float;
  }
end
and CylinderHandleAdornment : sig
  type t = {
    angle : float;
    height : float;
    inner_radius : float;
    radius : float;
  }
end
and ImageHandleAdornment : sig
  type t = {
    image : string;
    size : vector2;
  }
end
and LineHandleAdornment : sig
  type t = {
    length : float;
    thickness : float;
  }
end
and SphereHandleAdornment : sig
  type t = {
    radius : float;
  }
end
and WireframeHandleAdornment : sig
  type t = {
    scale : vector3;
  }
  val add_line : vector3 -> vector3 -> unit
  val add_lines : 'a list -> unit
  val add_path : 'a list -> bool -> unit
  val clear : unit -> unit
end
and ParabolaAdornment : sig
  type t = {
    a : float;
    b : float;
    c : float;
    range : float;
    thickness : float;
  }
  val find_part_on_parabola : Instance.t list -> 'a list
end
and SelectionSphere : sig
  type t = {
    surface_color_3 : color3;
    surface_transparency : float;
  }
end
and PartAdornment : sig
  type t = {
    adornee : BasePart.t;
  }
end
and HandlesBase : sig
  type t
end
and ArcHandles : sig
  type t = {
    axes : axes;
  }
end
and Handles : sig
  type t = {
    faces : faces;
    style : handles_style;
  }
end
and SurfaceSelection : sig
  type t = {
    target_surface : normal_id;
  }
end
and SelectionLasso : sig
  type t = {
    humanoid : Humanoid.t;
  }
end
and SelectionPartLasso : sig
  type t = {
    part : BasePart.t;
  }
end
and SelectionPointLasso : sig
  type t = {
    point : vector3;
  }
end
and Path2D : sig
  type t = {
    absolute_size : vector2;
    color : color3;
    position : u_dim_2;
    selected_control_point : int;
    thickness : float;
    transparency : float;
    visible : bool;
  }
  val get_control_points : unit -> 'a list
  val get_position_on_curve : float -> u_dim_2
  val get_position_on_curve_arc_length : float -> u_dim_2
  val get_segment_count : unit -> int
  val get_tangent_on_curve : float -> vector2
  val get_tangent_on_curve_arc_length : float -> vector2
  val set_control_points : 'a list -> unit
end
and GuiService : sig
  type t = {
    auto_select_gui_enabled : bool;
    core_effect_folder : Folder.t;
    core_gui_folder : Folder.t;
    core_gui_navigation_enabled : bool;
    gui_navigation_enabled : bool;
    menu_is_open : bool;
    preferred_transparency : float;
    reduced_motion_enabled : bool;
    selected_core_object : GuiObject.t;
    selected_object : GuiObject.t;
    topbar_inset : rect;
    touch_controls_enabled : bool;
  }
  val add_center_dialog : Instance.t -> center_dialog_type -> (unit -> unit) -> (unit -> unit) -> unit
  val add_key : string -> unit
  val add_selection_parent : string -> Instance.t -> unit
  val add_selection_tuple : string -> 'a list -> unit
  val add_special_key : special_key -> unit
  val broadcast_notification : string -> int -> unit
  val clear_error : unit -> unit
  val close_inspect_menu : unit -> unit
  val close_stats_based_on_input_string : string -> bool
  val force_ten_foot_interface : bool -> unit
  val get_brick_count : unit -> int
  val get_closest_dialog_to_position : vector3 -> Instance.t
  val get_emotes_menu_open : unit -> bool
  val get_error_code : unit -> connection_error
  val get_error_type : unit -> connection_error
  val get_gameplay_paused_notification_enabled : unit -> bool
  val get_gui_inset : unit -> 'a list
  val get_gui_is_visible : gui_type -> bool
  val get_hardware_safe_viewport : unit -> vector2
  val get_inspect_menu_enabled : unit -> bool
  val get_notification_type_list : unit -> (string * 'a) list
  val get_resolution_scale : unit -> int
  val get_safe_zone_offsets : unit -> (string * 'a) list
  val get_ui_message : unit -> string
  val inspect_player_from_humanoid_description : Instance.t -> string -> unit
  val inspect_player_from_user_id : int -> unit
  val inspect_player_from_user_id_with_ctx : int -> string -> unit
  val is_memory_tracker_enabled : unit -> bool
  val is_ten_foot_interface : unit -> bool
  val remove_center_dialog : Instance.t -> unit
  val remove_key : string -> unit
  val remove_selection_group : string -> unit
  val remove_special_key : special_key -> unit
  val select : Instance.t -> unit
  val send_ui_occlusion_metrics_for_query_region : u_dim_2 -> u_dim_2 -> string -> unit
  val set_emotes_menu_open : bool -> unit
  val set_gameplay_paused_notification_enabled : bool -> unit
  val set_global_gui_inset : int -> int -> int -> int -> unit
  val set_hardware_safe_area_insets : float -> float -> float -> float -> unit
  val set_inspect_menu_enabled : bool -> unit
  val set_menu_is_open : bool -> string -> unit
  val set_purchase_prompt_is_shown : bool -> unit
  val set_safe_zone_offsets : float -> float -> float -> float -> unit
  val set_topbar_inset : rect -> unit
  val set_ui_message : ui_message_type -> string -> unit
  val show_stats_based_on_input_string : string -> bool
  val toggle_fullscreen : unit -> unit
  val toggle_gui_is_visible_for_captures : gui_type -> unit
  val toggle_gui_is_visible_if_allowed : gui_type -> unit
  val get_screen_resolution : unit -> vector2
end
and GuidRegistryService : sig
  type t
end
and HapticService : sig
  type t
  val get_motor : user_input_type -> vibration_motor -> 'a list
  val is_motor_supported : user_input_type -> vibration_motor -> bool
  val is_vibration_supported : user_input_type -> bool
  val set_motor : user_input_type -> vibration_motor -> 'a list -> unit
end
and HeightmapImporterService : sig
  type t
  val cancel_import_heightmap : unit -> unit
  val is_valid_colormap : string -> 'a list
  val is_valid_heightmap : string -> 'a list
  val set_import_heightmap_paused : bool -> unit
  val get_heightmap_preview_async : string -> 'a list
  val import_heightmap : region_3 -> string -> string -> material -> unit
end
and HiddenSurfaceRemovalAsset : sig
  type t
end
and Highlight : sig
  type t = {
    adornee : Instance.t;
    depth_mode : highlight_depth_mode;
    enabled : bool;
    fill_color : color3;
    fill_transparency : float;
    line_thickness : int;
    outline_color : color3;
    outline_transparency : float;
    reserved_id : reserved_highlight_id;
  }
end
and Hopper : sig
  type t
end
and HttpRbxApiService : sig
  type t
  val get_documentation_url : string -> string
  val get_async : string -> throttling_priority -> http_request_type -> string
  val get_async_full_url : string -> throttling_priority -> http_request_type -> string
  val post_async : string -> string -> throttling_priority -> http_content_type -> http_request_type -> string
  val post_async_full_url : string -> string -> throttling_priority -> http_content_type -> http_request_type -> string
  val request_async : (string * 'a) list -> throttling_priority -> http_content_type -> http_request_type -> string
  val request_limited_async : (string * 'a) list -> throttling_priority -> http_content_type -> http_request_type -> string
end
and HttpRequest : sig
  type t
  val cancel : unit -> unit
  val start : (unit -> unit) -> unit
end
and HttpService : sig
  type t = {
    http_enabled : bool;
  }
  val generate_guid : bool -> string
  val get_http_enabled : unit -> bool
  val get_secret : string -> secret
  val get_user_agent : unit -> string
  val json_decode : string -> 'a
  val json_encode : 'a -> string
  val request_internal : (string * 'a) list -> Instance.t
  val set_http_enabled : bool -> unit
  val url_encode : string -> string
  val get_async : string -> bool -> 'a -> string
  val post_async : string -> string -> http_content_type -> bool -> 'a -> string
  val request_async : (string * 'a) list -> (string * 'a) list
end
and Humanoid : sig
  type t = {
    auto_jump_enabled : bool;
    auto_rotate : bool;
    automatic_scaling_enabled : bool;
    break_joints_on_death : bool;
    camera_offset : vector3;
    display_distance_type : humanoid_display_distance_type;
    display_name : string;
    evaluate_state_machine : bool;
    floor_material : material;
    health : float;
    health_display_distance : float;
    health_display_type : humanoid_health_display_type;
    hip_height : float;
    internal_display_name : string;
    jump : bool;
    jump_height : float;
    jump_power : float;
    max_health : float;
    max_slope_angle : float;
    move_direction : vector3;
    name_display_distance : float;
    name_occlusion : name_occlusion;
    platform_stand : bool;
    requires_neck : bool;
    rig_type : humanoid_rig_type;
    root_part : BasePart.t;
    seat_part : BasePart.t;
    sit : bool;
    target_point : vector3;
    use_jump_power : bool;
    walk_speed : float;
    walk_to_part : BasePart.t;
    walk_to_point : vector3;
  }
  val add_accessory : Instance.t -> unit
  val build_rig_from_attachments : unit -> unit
  val cache_defaults : unit -> unit
  val change_state : humanoid_state_type -> unit
  val equip_tool : Instance.t -> unit
  val get_accessories : unit -> 'a list
  val get_accessory_handle_scale : Instance.t -> body_part_r_15 -> vector3
  val get_applied_description : unit -> HumanoidDescription.t
  val get_body_part_r_15 : Instance.t -> body_part_r_15
  val get_limb : Instance.t -> limb
  val get_move_velocity : unit -> vector3
  val get_state : unit -> humanoid_state_type
  val get_state_enabled : humanoid_state_type -> bool
  val move : vector3 -> bool -> unit
  val move_to : vector3 -> Instance.t -> unit
  val remove_accessories : unit -> unit
  val replace_body_part_r_15 : body_part_r_15 -> BasePart.t -> bool
  val set_click_to_walk_enabled : bool -> unit
  val set_state_enabled : humanoid_state_type -> bool -> unit
  val take_damage : float -> unit
  val unequip_tools : unit -> unit
  val apply_description : HumanoidDescription.t -> asset_type_verification -> unit
  val apply_description_client_server : HumanoidDescription.t -> unit
  val apply_description_reset : HumanoidDescription.t -> asset_type_verification -> unit
  val play_emote : string -> bool
  val play_emote_and_get_anim_track_by_id : int -> 'a list
end
and HumanoidDescription : sig
  type t = {
    accessory_blob : string;
    back_accessory : string;
    body_type_scale : float;
    climb_animation : int;
    depth_scale : float;
    face : int;
    face_accessory : string;
    fall_animation : int;
    front_accessory : string;
    graphic_t_shirt : int;
    hair_accessory : string;
    hat_accessory : string;
    head : int;
    head_color : color3;
    head_scale : float;
    height_scale : float;
    idle_animation : int;
    jump_animation : int;
    left_arm : int;
    left_arm_color : color3;
    left_leg : int;
    left_leg_color : color3;
    mood_animation : int;
    neck_accessory : string;
    number_emotes_loaded : int;
    pants : int;
    proportion_scale : float;
    right_arm : int;
    right_arm_color : color3;
    right_leg : int;
    right_leg_color : color3;
    run_animation : int;
    shirt : int;
    shoulders_accessory : string;
    swim_animation : int;
    torso : int;
    torso_color : color3;
    waist_accessory : string;
    walk_animation : int;
    width_scale : float;
  }
  val add_emote : string -> int -> unit
  val get_accessories : bool -> 'a list
  val get_emotes : unit -> (string * 'a) list
  val get_equipped_emotes : unit -> 'a list
  val remove_emote : string -> unit
  val set_accessories : 'a list -> bool -> unit
  val set_emotes : (string * 'a) list -> unit
  val set_equipped_emotes : 'a list -> unit
end
and IKControl : sig
  type t = {
    chain_root : Instance.t;
    enabled : bool;
    end_effector : Instance.t;
    end_effector_offset : cframe;
    offset : cframe;
    pole : Instance.t;
    priority : int;
    smooth_time : float;
    target : Instance.t;
    type : ik_control_type;
    weight : float;
  }
  val get_chain_count : unit -> int
  val get_chain_length : unit -> float
  val get_node_local_c_frame : int -> cframe
  val get_node_world_c_frame : int -> cframe
  val get_raw_final_target : unit -> cframe
  val get_smoothed_final_target : unit -> cframe
end
and ILegacyStudioBridge : sig
  type t
end
and LegacyStudioBridge : sig
  type t
end
and IXPService : sig
  type t
  val clear_user_layers : unit -> unit
  val get_browser_tracker_layer_loading_status : unit -> ixp_loading_status
  val get_browser_tracker_layer_variables : string -> (string * 'a) list
  val get_browser_tracker_status_for_layer : string -> ixp_loading_status option
  val get_registered_user_layers_to_status : unit -> (string * 'a) list
  val get_user_layer_loading_status : unit -> ixp_loading_status
  val get_user_layer_variables : string -> (string * 'a) list
  val get_user_status_for_layer : string -> ixp_loading_status option
  val initialize_user_layers : int -> unit
  val log_browser_tracker_layer_exposure : string -> unit
  val log_user_layer_exposure : string -> unit
  val register_user_layers : 'a -> unit
end
and IncrementalPatchBuilder : sig
  type t = {
    add_paths_to_bundle : bool;
    build_debounce_period : float;
    high_compression : bool;
    serialize_patch : bool;
    zstd_compression : bool;
  }
end
and InputObject : sig
  type t = {
    delta : vector3;
    key_code : key_code;
    position : vector3;
    user_input_state : user_input_state;
    user_input_type : user_input_type;
  }
  val is_modifier_key_down : modifier_key -> bool
end
and InsertService : sig
  type t = {
    allow_client_insert_models : bool;
  }
  val get_local_file_contents : string -> string
  val load_local_asset : string -> Instance.t
  val load_package_asset : string -> Instance.t list
  val create_mesh_part_async : string -> collision_fidelity -> render_fidelity -> MeshPart.t
  val get_collection : int -> 'a list
  val get_free_decals : string -> int -> 'a list
  val get_free_models : string -> int -> 'a list
  val get_latest_asset_version_async : int -> int
  val get_user_sets : int -> 'a list
  val load_asset : int -> Instance.t
  val load_asset_version : int -> Instance.t
  val load_asset_with_format : int -> string -> Instance.t list
  val load_package_asset_async : string -> Instance.t list
end
and JointInstance : sig
  type t = {
    active : bool;
    c_0 : cframe;
    c_1 : cframe;
    enabled : bool;
    part_0 : BasePart.t;
    part_1 : BasePart.t;
  }
end
and DynamicRotate : sig
  type t = {
    base_angle : float;
  }
end
and RotateP : sig
  type t
end
and RotateV : sig
  type t
end
and Glue : sig
  type t = {
    f_0 : vector3;
    f_1 : vector3;
    f_2 : vector3;
    f_3 : vector3;
  }
end
and ManualSurfaceJointInstance : sig
  type t
end
and ManualGlue : sig
  type t
end
and ManualWeld : sig
  type t
end
and Motor : sig
  type t = {
    current_angle : float;
    desired_angle : float;
    max_velocity : float;
  }
  val set_desired_angle : float -> unit
end
and Motor6D : sig
  type t = {
    child_name : string;
    parent_name : string;
    transform : cframe;
  }
end
and Rotate : sig
  type t
end
and Snap : sig
  type t
end
and VelocityMotor : sig
  type t = {
    current_angle : float;
    desired_angle : float;
    hole : Hole.t;
    max_velocity : float;
  }
end
and Weld : sig
  type t
end
and JointsService : sig
  type t
  val clear_join_after_move_joints : unit -> unit
  val create_join_after_move_joints : unit -> unit
  val set_join_after_move_instance : Instance.t -> unit
  val set_join_after_move_target : Instance.t -> unit
  val show_permissible_joints : unit -> unit
end
and KeyboardService : sig
  type t
end
and Keyframe : sig
  type t = {
    time : float;
  }
  val add_marker : Instance.t -> unit
  val add_pose : Instance.t -> unit
  val get_markers : unit -> Instance.t list
  val get_poses : unit -> Instance.t list
  val remove_marker : Instance.t -> unit
  val remove_pose : Instance.t -> unit
end
and KeyframeMarker : sig
  type t = {
    value : string;
  }
end
and KeyframeSequenceProvider : sig
  type t
  val get_mem_stats : unit -> (string * 'a) list
  val register_active_keyframe_sequence : Instance.t -> string
  val register_keyframe_sequence : Instance.t -> string
  val get_animations : int -> Instance.t
  val get_keyframe_sequence_async : string -> Instance.t
end
and LSPFileSyncService : sig
  type t
end
and LanguageService : sig
  type t
end
and Light : sig
  type t = {
    brightness : float;
    color : color3;
    enabled : bool;
    shadows : bool;
  }
end
and PointLight : sig
  type t = {
    range : float;
  }
end
and SpotLight : sig
  type t = {
    angle : float;
    face : normal_id;
    range : float;
  }
end
and SurfaceLight : sig
  type t = {
    angle : float;
    face : normal_id;
    range : float;
  }
end
and Lighting : sig
  type t = {
    ambient : color3;
    brightness : float;
    clock_time : float;
    color_shift_bottom : color3;
    color_shift_top : color3;
    environment_diffuse_scale : float;
    environment_specular_scale : float;
    exposure_compensation : float;
    fog_color : color3;
    fog_end : float;
    fog_start : float;
    geographic_latitude : float;
    global_shadows : bool;
    outdoor_ambient : color3;
    shadow_softness : float;
    technology : technology;
    temp_use_new_sky_removal_behaviour : bool;
    time_of_day : string;
  }
  val get_minutes_after_midnight : unit -> float
  val get_moon_direction : unit -> vector3
  val get_moon_phase : unit -> float
  val get_sun_direction : unit -> vector3
  val set_minutes_after_midnight : float -> unit
end
and LiveScriptingService : sig
  type t
end
and LocalStorageService : sig
  type t
  val flush : unit -> unit
  val get_item : string -> string
  val set_item : string -> string -> unit
  val when_loaded : (unit -> unit) -> unit
end
and AppStorageService : sig
  type t
end
and UserStorageService : sig
  type t
end
and LocalizationService : sig
  type t = {
    force_play_mode_game_locale_id : string;
    force_play_mode_roblox_locale_id : string;
    is_text_scraper_running : bool;
    roblox_force_play_mode_game_locale_id : string;
    roblox_force_play_mode_roblox_locale_id : string;
    roblox_locale_id : string;
    system_locale_id : string;
  }
  val get_corescript_localizations : unit -> Instance.t list
  val get_table_entries : Instance.t -> 'a list
  val get_translator_for_player : Instance.t -> Instance.t
  val set_roblox_locale_id : string -> unit
  val start_text_scraper : unit -> unit
  val stop_text_scraper : unit -> unit
  val get_country_region_for_player_async : Instance.t -> string
  val get_translator_for_locale_async : string -> Instance.t
  val get_translator_for_player_async : Instance.t -> Instance.t
  val prompt_download_game_table_to_csv : Instance.t -> unit
  val prompt_export_to_cs_vs : unit -> unit
  val prompt_import_from_cs_vs : unit -> unit
  val prompt_upload_csv_to_game_table : unit -> Instance.t
end
and LocalizationTable : sig
  type t = {
    source_locale_id : string;
  }
  val get_entries : unit -> 'a list
  val get_translator : string -> Instance.t
  val remove_entry : string -> string -> string -> unit
  val remove_entry_value : string -> string -> string -> string -> unit
  val remove_target_locale : string -> unit
  val set_entries : 'a -> unit
  val set_entry_context : string -> string -> string -> string -> unit
  val set_entry_example : string -> string -> string -> string -> unit
  val set_entry_key : string -> string -> string -> string -> unit
  val set_entry_source : string -> string -> string -> string -> unit
  val set_entry_value : string -> string -> string -> string -> string -> unit
  val set_is_exempt_from_ugc_analytics : bool -> unit
end
and CloudLocalizationTable : sig
  type t
end
and LodDataEntity : sig
  type t = {
    entity_lod_enabled : bool;
  }
end
and LodDataService : sig
  type t
end
and LogReporterService : sig
  type t
  val report_log : string -> string -> bool
end
and LogService : sig
  type t
  val clear_output : unit -> unit
  val execute_script : string -> unit
  val get_http_result_history : unit -> 'a list
  val get_log_history : unit -> 'a list
  val request_http_result_approved : unit -> unit
  val request_server_http_result : unit -> unit
  val request_server_output : unit -> unit
end
and LoginService : sig
  type t
  val logout : unit -> unit
  val prompt_login : unit -> unit
end
and LuaSettings : sig
  type t
end
and LuaSourceContainer : sig
  type t = {
    current_editor : Instance.t;
    runtime_source : string;
  }
end
and BaseScript : sig
  type t = {
    disabled : bool;
    enabled : bool;
    linked_source : string;
    run_context : run_context;
  }
end
and CoreScript : sig
  type t
end
and Script : sig
  type t = {
    source : protected_string;
  }
  val get_hash : unit -> string
end
and LocalScript : sig
  type t
end
and ModuleScript : sig
  type t = {
    linked_source : string;
    source : protected_string;
  }
end
and LuaWebService : sig
  type t
end
and LuauScriptAnalyzerService : sig
  type t
end
and MarkerCurve : sig
  type t = {
    length : int;
  }
  val get_marker_at_index : int -> (string * 'a) list
  val get_markers : unit -> 'a list
  val insert_marker_at_time : float -> string -> 'a list
  val remove_marker_at_index : int -> int -> int
end
and MarketplaceService : sig
  type t
  val player_can_make_purchases : Instance.t -> bool
  val prepare_collectibles_purchase : Instance.t -> int -> string -> string -> string -> int -> unit
  val prompt_bundle_purchase : Instance.t -> int -> unit
  val prompt_collectibles_purchase : Instance.t -> int -> string -> string -> string -> int -> unit
  val prompt_game_pass_purchase : Instance.t -> int -> unit
  val prompt_native_purchase : Instance.t -> string -> unit
  val prompt_native_purchase_with_local_player : string -> unit
  val prompt_premium_purchase : Instance.t -> unit
  val prompt_product_purchase : Instance.t -> int -> bool -> currency_type -> unit
  val prompt_purchase : Instance.t -> int -> bool -> currency_type -> unit
  val prompt_roblox_purchase : int -> bool -> unit
  val prompt_subscription_purchase : Player.t -> string -> unit
  val prompt_third_party_purchase : Instance.t -> string -> unit
  val report_asset_sale : string -> int -> unit
  val report_robux_upsell_started : unit -> unit
  val signal_asset_type_purchased : Instance.t -> asset_type -> unit
  val signal_client_purchase_success : string -> int -> int -> unit
  val signal_mock_purchase_premium : unit -> unit
  val signal_prompt_bundle_purchase_finished : Instance.t -> int -> bool -> unit
  val signal_prompt_game_pass_purchase_finished : Instance.t -> int -> bool -> unit
  val signal_prompt_premium_purchase_finished : bool -> unit
  val signal_prompt_product_purchase_finished : int -> int -> bool -> unit
  val signal_prompt_purchase_finished : Instance.t -> int -> bool -> unit
  val signal_prompt_subscription_purchase_finished : string -> bool -> unit
  val signal_server_lua_dialog_closed : bool -> unit
  val get_developer_products_async : unit -> Instance.t
  val get_product_info : int -> info_type -> (string * 'a) list
  val get_robux_balance : unit -> int
  val get_subscription_product_info_async : string -> (string * 'a) list
  val get_subscription_purchase_info_async : string -> (string * 'a) list
  val get_user_subscription_payment_history_async : Player.t -> string -> 'a list
  val get_user_subscription_status_async : Player.t -> string -> (string * 'a) list
  val perform_purchase : info_type -> int -> int -> string -> bool -> string -> string -> string -> string -> (string * 'a) list
  val perform_purchase_v_2 : info_type -> int -> int -> string -> bool -> (string * 'a) list -> (string * 'a) list
  val perform_subscription_purchase : string -> string
  val player_owns_asset : Instance.t -> int -> bool
  val player_owns_bundle : Player.t -> int -> bool
  val user_owns_game_pass_async : int -> int -> bool
end
and MaterialGenerationService : sig
  type t
  val start_session : unit -> MaterialGenerationSession.t
  val generate_material_variants_async : string -> int -> Instance.t list
  val get_accounting_balance_async : unit -> float
  val refill_accounting_balance_async : unit -> float
  val upload_material_variants_async : Instance.t list -> unit
end
and MaterialGenerationSession : sig
  type t
  val generate_images_async : string -> (string * 'a) list -> 'a list
  val generate_material_maps_async : string -> (string * 'a) list
  val upload_material_async : string -> (string * 'a) list
end
and MaterialService : sig
  type t = {
    asphalt_name : string;
    basalt_name : string;
    brick_name : string;
    cardboard_name : string;
    carpet_name : string;
    ceramic_tiles_name : string;
    clay_roof_tiles_name : string;
    cobblestone_name : string;
    concrete_name : string;
    corroded_metal_name : string;
    cracked_lava_name : string;
    diamond_plate_name : string;
    fabric_name : string;
    foil_name : string;
    glacier_name : string;
    granite_name : string;
    grass_name : string;
    ground_name : string;
    ice_name : string;
    leafy_grass_name : string;
    leather_name : string;
    limestone_name : string;
    marble_name : string;
    metal_name : string;
    mud_name : string;
    pavement_name : string;
    pebble_name : string;
    plaster_name : string;
    plastic_name : string;
    rock_name : string;
    roof_shingles_name : string;
    rubber_name : string;
    salt_name : string;
    sand_name : string;
    sandstone_name : string;
    slate_name : string;
    smooth_plastic_name : string;
    snow_name : string;
    use_2022_materials : bool;
    wood_name : string;
    wood_planks_name : string;
  }
  val get_base_material_override : material -> string
  val get_material_override_changed : material -> rbx_script_signal
  val get_material_variant : material -> string -> MaterialVariant.t
  val get_override_status : material -> property_status
  val set_base_material_override : material -> string -> unit
end
and MaterialVariant : sig
  type t = {
    base_material : material;
    color_map : string;
    custom_physical_properties : physical_properties;
    material_pattern : material_pattern;
    metalness_map : string;
    normal_map : string;
    roughness_map : string;
    studs_per_tile : float;
  }
end
and MemStorageConnection : sig
  type t
  val disconnect : unit -> unit
end
and MemStorageService : sig
  type t
  val bind : string -> (unit -> unit) -> MemStorageConnection.t
  val bind_and_fire : string -> (unit -> unit) -> MemStorageConnection.t
  val call : string -> 'a -> 'a
  val fire : string -> string -> unit
  val get_item : string -> string -> string
  val has_item : string -> bool
  val remove_item : string -> bool
  val set_item : string -> string -> unit
end
and MemoryStoreHashMap : sig
  type t
  val get_async : string -> 'a
  val list_items_async : int -> MemoryStoreHashMapPages.t
  val remove_async : string -> unit
  val set_async : string -> 'a -> int -> bool
  val update_async : string -> (unit -> unit) -> int -> 'a
end
and MemoryStoreQueue : sig
  type t
  val add_async : 'a -> int -> float -> unit
  val read_async : int -> bool -> float -> 'a list
  val remove_async : string -> unit
end
and MemoryStoreService : sig
  type t
  val get_hash_map : string -> MemoryStoreHashMap.t
  val get_queue : string -> int -> MemoryStoreQueue.t
  val get_sorted_map : string -> MemoryStoreSortedMap.t
end
and MemoryStoreSortedMap : sig
  type t
  val get_async : string -> 'a list
  val get_range_async : sort_direction -> int -> 'a -> 'a -> 'a list
  val remove_async : string -> unit
  val set_async : string -> 'a -> int -> 'a -> bool
  val update_async : string -> (unit -> unit) -> int -> 'a list
end
and Message : sig
  type t = {
    text : string;
  }
end
and Hint : sig
  type t
end
and MessageBusConnection : sig
  type t
  val disconnect : unit -> unit
end
and MessageBusService : sig
  type t
  val call : string -> 'a -> 'a
  val get_last : string -> 'a
  val get_message_id : string -> string -> string
  val get_protocol_method_request_message_id : string -> string -> string
  val get_protocol_method_response_message_id : string -> string -> string
  val make_request : string -> string -> 'a -> (unit -> unit) -> 'a -> unit
  val publish : string -> 'a -> unit
  val publish_protocol_method_request : string -> string -> 'a -> 'a -> unit
  val publish_protocol_method_response : string -> string -> 'a -> int -> 'a -> unit
  val set_request_handler : string -> string -> (unit -> unit) -> unit
  val subscribe : string -> (unit -> unit) -> bool -> bool -> Instance.t
  val subscribe_to_protocol_method_request : string -> string -> (unit -> unit) -> bool -> bool -> Instance.t
  val subscribe_to_protocol_method_response : string -> string -> (unit -> unit) -> bool -> bool -> Instance.t
end
and MessagingService : sig
  type t
  val publish_async : string -> 'a -> unit
  val subscribe_async : string -> (unit -> unit) -> rbx_script_connection
end
and MetaBreakpoint : sig
  type t = {
    condition : string;
    continue_execution : bool;
    enabled : bool;
    id : int;
    is_logpoint : bool;
    line : int;
    log_message : string;
    remove_on_hit : bool;
    script : string;
    valid : bool;
  }
  val get_context_breakpoints : unit -> (string * 'a) list
  val remove : (unit -> unit) -> int
  val set_child_breakpoint_enabled_by_script_and_context : string -> int -> bool -> unit
  val set_context_enabled : int -> bool -> unit
  val set_continue_execution : bool -> unit
  val set_enabled : bool -> unit
  val set_line : int -> (unit -> unit) -> int
  val set_remove_on_hit : bool -> unit
end
and MetaBreakpointContext : sig
  type t
end
and MetaBreakpointManager : sig
  type t
  val add_breakpoint : Instance.t -> int -> Instance.t -> Instance.t
  val get_breakpoint_by_id : int -> MetaBreakpoint.t
  val remove_breakpoint_by_id : int -> unit
end
and Mouse : sig
  type t = {
    hit : cframe;
    icon : string;
    origin : cframe;
    target : BasePart.t;
    target_filter : Instance.t;
    target_surface : normal_id;
    unit_ray : ray;
    view_size_x : int;
    view_size_y : int;
    x : int;
    y : int;
  }
end
and PlayerMouse : sig
  type t
end
and PluginMouse : sig
  type t
end
and MouseService : sig
  type t
end
and MultipleDocumentInterfaceInstance : sig
  type t = {
    focused_data_model_session : Instance.t;
  }
end
and NetworkMarker : sig
  type t
end
and NetworkPeer : sig
  type t
  val set_outgoing_kbps_limit : int -> unit
end
and NetworkClient : sig
  type t
end
and NetworkServer : sig
  type t
  val encrypt_string_for_player_id : string -> int -> string
end
and NetworkReplicator : sig
  type t
  val get_player : unit -> Instance.t
end
and ClientReplicator : sig
  type t
  val request_rcc_profiler_data : int -> int -> unit
  val request_server_script_profiling : bool -> int option -> unit
  val request_server_script_profiling_data : unit -> unit
  val request_server_stats : bool -> unit
end
and ServerReplicator : sig
  type t
end
and NetworkSettings : sig
  type t = {
    emulated_total_memory_in_mb : int;
    free_memory_m_bytes : float;
    http_proxy_enabled : bool;
    http_proxy_url : string;
    incoming_replication_lag : float;
    print_join_size_breakdown : bool;
    print_physics_errors : bool;
    print_stream_instance_quota : bool;
    randomize_join_instance_order : bool;
    render_streamed_regions : bool;
    show_active_animation_asset : bool;
  }
end
and NoCollisionConstraint : sig
  type t = {
    enabled : bool;
    part_0 : BasePart.t;
    part_1 : BasePart.t;
  }
end
and NotificationService : sig
  type t = {
    is_connected : bool;
    is_lua_chat_enabled : bool;
    is_lua_game_details_enabled : bool;
    selected_theme : string;
  }
  val action_enabled : app_shell_action_type -> unit
  val action_taken : app_shell_action_type -> unit
  val cancel_all_notification : int -> unit
  val cancel_notification : int -> int -> unit
  val schedule_notification : int -> int -> string -> int -> unit
  val switched_to_app_shell_feature : app_shell_feature -> unit
  val get_scheduled_notifications : int -> 'a list
end
and OmniRecommendationsService : sig
  type t
  val clear_session_id : unit -> unit
  val get_session_id : unit -> string
  val make_request : string -> HttpRequest.t
end
and OpenCloudApiV1 : sig
  type t
  val create_model : string -> open_cloud_model
  val create_user_notification_async : string -> open_cloud_model -> open_cloud_model
end
and OpenCloudService : sig
  type t
  val get_api_v_1 : unit -> OpenCloudApiV1.t
  val register_open_cloud : string -> string -> (unit -> unit) -> unit
  val registration_complete : unit -> unit
  val http_request_async : (string * 'a) list -> (string * 'a) list
  val invoke_async : string -> string -> (string * 'a) list -> (string * 'a) list
end
and OperationGraph : sig
  type t
end
and PVInstance : sig
  type t = {
    origin : cframe;
    pivot_offset : cframe;
  }
  val get_pivot : unit -> cframe
  val pivot_to : cframe -> unit
end
and BasePart : sig
  type t = {
    anchored : bool;
    assembly_angular_velocity : vector3;
    assembly_center_of_mass : vector3;
    assembly_linear_velocity : vector3;
    assembly_mass : float;
    assembly_root_part : t;
    back_surface : surface_type;
    bottom_surface : surface_type;
    brick_color : brick_color;
    c_frame : cframe;
    can_collide : bool;
    can_query : bool;
    can_touch : bool;
    cast_shadow : bool;
    center_of_mass : vector3;
    collision_group : string;
    color : color3;
    current_physical_properties : physical_properties;
    custom_physical_properties : physical_properties;
    enable_fluid_forces : bool;
    extents_c_frame : cframe;
    extents_size : vector3;
    front_surface : surface_type;
    left_surface : surface_type;
    local_transparency_modifier : float;
    locked : bool;
    mass : float;
    massless : bool;
    material : material;
    material_variant : string;
    orientation : vector3;
    pivot_offset : cframe;
    position : vector3;
    receive_age : float;
    reflectance : float;
    resize_increment : int;
    resizeable_faces : faces;
    right_surface : surface_type;
    root_priority : int;
    rotation : vector3;
    size : vector3;
    top_surface : surface_type;
    transparency : float;
  }
  val angular_acceleration_to_torque : vector3 -> vector3 -> vector3
  val apply_angular_impulse : vector3 -> unit
  val apply_impulse : vector3 -> unit
  val apply_impulse_at_position : vector3 -> vector3 -> unit
  val can_collide_with : t -> bool
  val can_set_network_ownership : unit -> 'a list
  val get_closest_point_on_surface : vector3 -> vector3
  val get_connected_parts : bool -> Instance.t list
  val get_joints : unit -> Instance.t list
  val get_mass : unit -> float
  val get_network_owner : unit -> Instance.t
  val get_network_ownership_auto : unit -> bool
  val get_no_collision_constraints : unit -> Instance.t list
  val get_root_part : unit -> Instance.t
  val get_touching_parts : unit -> Instance.t list
  val get_velocity_at_position : vector3 -> vector3
  val is_grounded : unit -> bool
  val resize : normal_id -> int -> bool
  val set_network_owner : Player.t -> unit
  val set_network_ownership_auto : unit -> unit
  val torque_to_angular_acceleration : vector3 -> vector3 -> vector3
  val intersect_async : Instance.t list -> collision_fidelity -> render_fidelity -> Instance.t
  val subtract_async : Instance.t list -> collision_fidelity -> render_fidelity -> Instance.t
  val union_async : Instance.t list -> collision_fidelity -> render_fidelity -> Instance.t
end
and CornerWedgePart : sig
  type t
end
and FormFactorPart : sig
  type t
end
and Part : sig
  type t = {
    shape : part_type;
  }
end
and FlagStand : sig
  type t = {
    team_color : brick_color;
  }
end
and Platform : sig
  type t
end
and Seat : sig
  type t = {
    disabled : bool;
    occupant : Humanoid.t;
  }
  val sit : Instance.t -> unit
end
and SkateboardPlatform : sig
  type t = {
    controller : SkateboardController.t;
    controlling_humanoid : Humanoid.t;
    steer : int;
    sticky_wheels : bool;
    throttle : int;
  }
  val apply_specific_impulse : vector3 -> unit
end
and SpawnLocation : sig
  type t = {
    allow_team_change_on_touch : bool;
    duration : int;
    enabled : bool;
    neutral : bool;
    team_color : brick_color;
  }
end
and WedgePart : sig
  type t
end
and Terrain : sig
  type t = {
    decoration : bool;
    grass_length : float;
    last_used_modification_method : terrain_acquisition_method;
    material_colors : binary_string;
    max_extents : region_3_int_16;
    shorelines_upgraded : bool;
    smooth_voxels_upgraded : bool;
    water_color : color3;
    water_reflectance : float;
    water_transparency : float;
    water_wave_size : float;
    water_wave_speed : float;
  }
  val can_shorelines_be_upgraded : unit -> bool
  val can_smooth_voxels_be_upgraded : unit -> bool
  val cell_center_to_world : int -> int -> int -> vector3
  val cell_corner_to_world : int -> int -> int -> vector3
  val clear : unit -> unit
  val copy_region : region_3_int_16 -> TerrainRegion.t
  val count_cells : unit -> int
  val fill_ball : vector3 -> float -> material -> unit
  val fill_block : cframe -> vector3 -> material -> unit
  val fill_cylinder : cframe -> float -> float -> material -> unit
  val fill_region : region_3 -> float -> material -> unit
  val fill_wedge : cframe -> vector3 -> material -> unit
  val get_material_color : material -> color3
  val get_terrain_wireframe : cframe -> vector3 -> 'a list
  val paste_region : TerrainRegion.t -> vector_3_int_16 -> bool -> unit
  val read_voxel_channels : region_3 -> float -> 'a list -> (string * 'a) list
  val read_voxels : region_3 -> float -> 'a list
  val replace_material : region_3 -> float -> material -> material -> unit
  val replace_material_in_transform : cframe -> vector3 -> material -> material -> unit
  val replace_material_in_transform_subregion : cframe -> vector3 -> material -> material -> region_3_int_16 -> unit
  val set_material_color : material -> color3 -> unit
  val set_material_in_transform : cframe -> vector3 -> material -> unit
  val set_material_in_transform_subregion : cframe -> vector3 -> material -> region_3_int_16 -> unit
  val smooth_region : region_3 -> float -> float -> 'a list
  val world_to_cell : vector3 -> vector3
  val world_to_cell_prefer_empty : vector3 -> vector3
  val world_to_cell_prefer_solid : vector3 -> vector3
  val write_voxel_channels : region_3 -> float -> (string * 'a) list -> unit
  val write_voxels : region_3 -> float -> 'a list -> 'a list -> unit
end
and TriangleMeshPart : sig
  type t = {
    collision_fidelity : collision_fidelity;
    fluid_fidelity : fluid_fidelity;
    mesh_size : vector3;
  }
end
and MeshPart : sig
  type t = {
    double_sided : bool;
    has_joint_offset : bool;
    has_skinned_mesh : bool;
    joint_offset : vector3;
    mesh_id : string;
    render_fidelity : render_fidelity;
    texture_id : string;
  }
  val apply_mesh : Instance.t -> unit
end
and PartOperation : sig
  type t = {
    render_fidelity : render_fidelity;
    smoothing_angle : float;
    triangle_count : int;
    use_part_color : bool;
  }
  val substitute_geometry : Instance.t -> unit
end
and IntersectOperation : sig
  type t
end
and NegateOperation : sig
  type t
end
and UnionOperation : sig
  type t
end
and TrussPart : sig
  type t = {
    style : style;
  }
end
and VehicleSeat : sig
  type t = {
    are_hinges_detected : int;
    disabled : bool;
    heads_up_display : bool;
    max_speed : float;
    occupant : Humanoid.t;
    steer : int;
    steer_float : float;
    throttle : int;
    throttle_float : float;
    torque : float;
    turn_speed : float;
  }
  val sit : Instance.t -> unit
end
and Model : sig
  type t = {
    level_of_detail : model_level_of_detail;
    model_streaming_mode : model_streaming_mode;
    primary_part : BasePart.t;
    scale : float;
    world_pivot : cframe;
  }
  val add_persistent_player : Player.t -> unit
  val get_bounding_box : unit -> 'a list
  val get_extents_size : unit -> vector3
  val get_persistent_players : unit -> Instance.t list
  val get_scale : unit -> float
  val move_to : vector3 -> unit
  val remove_persistent_player : Player.t -> unit
  val scale_to : float -> unit
  val translate_by : vector3 -> unit
end
and Actor : sig
  type t
  val bind_to_message : string -> (unit -> unit) -> rbx_script_connection
  val bind_to_message_parallel : string -> (unit -> unit) -> rbx_script_connection
  val send_message : string -> 'a list -> unit
end
and BackpackItem : sig
  type t = {
    texture_id : string;
  }
end
and HopperBin : sig
  type t = {
    active : bool;
    bin_type : bin_type;
  }
  val disable : unit -> unit
  val toggle_select : unit -> unit
end
and Tool : sig
  type t = {
    can_be_dropped : bool;
    enabled : bool;
    grip : cframe;
    grip_forward : vector3;
    grip_pos : vector3;
    grip_right : vector3;
    grip_up : vector3;
    manual_activation_only : bool;
    requires_handle : bool;
    tool_tip : string;
  }
  val activate : unit -> unit
  val deactivate : unit -> unit
end
and Flag : sig
  type t = {
    team_color : brick_color;
  }
end
and Status : sig
  type t
end
and WorldRoot : sig
  type t
  val are_parts_touching_others : Instance.t list -> float -> bool
  val blockcast : cframe -> vector3 -> vector3 -> raycast_params -> raycast_result
  val bulk_move_to : Instance.t list -> 'a list -> bulk_move_mode -> unit
  val cache_current_terrain : string -> vector3 -> float -> string
  val clear_cached_terrain : string -> bool
  val get_part_bounds_in_box : cframe -> vector3 -> overlap_params -> Instance.t list
  val get_part_bounds_in_radius : vector3 -> float -> overlap_params -> Instance.t list
  val get_parts_in_part : BasePart.t -> overlap_params -> Instance.t list
  val ik_move_to : BasePart.t -> cframe -> float -> float -> ik_collisions_mode -> unit
  val raycast : vector3 -> vector3 -> raycast_params -> raycast_result
  val raycast_cached_terrain : string -> vector3 -> vector3 -> bool -> raycast_result
  val set_insert_point : vector3 -> bool -> unit
  val shapecast : BasePart.t -> vector3 -> raycast_params -> raycast_result
  val spherecast : vector3 -> float -> vector3 -> raycast_params -> raycast_result
end
and Workspace : sig
  type t = {
    air_density : float;
    allow_third_party_sales : bool;
    avatar_unification_mode : avatar_unification_mode;
    client_animator_throttling : client_animator_throttling_mode;
    current_camera : Camera.t;
    distributed_game_time : float;
    editor_live_scripting : editor_live_scripting;
    fallen_parts_destroy_height : float;
    fluid_forces : fluid_forces;
    global_wind : vector3;
    gravity : float;
    ik_control_constraint_support : ik_control_constraint_support;
    interpolation_throttling : interpolation_throttling_mode;
    mesh_part_heads_and_accessories : mesh_part_heads_and_accessories;
    model_streaming_behavior : model_streaming_behavior;
    physics_stepping_method : physics_stepping_method;
    player_character_destroy_behavior : player_character_destroy_behavior;
    primal_physics_solver : primal_physics_solver;
    reject_character_deletions : reject_character_deletions;
    replicate_instance_destroy_setting : replicate_instance_destroy_setting;
    retargeting : animator_retargeting_mode;
    signal_behavior : signal_behavior;
    stream_out_behavior : stream_out_behavior;
    streaming_enabled : bool;
    streaming_integrity_mode : streaming_integrity_mode;
    streaming_min_radius : int;
    streaming_target_radius : int;
    terrain : Terrain.t;
    touches_use_collision_groups : bool;
  }
  val calculate_jump_distance : float -> float -> float -> float
  val calculate_jump_height : float -> float -> float
  val calculate_jump_power : float -> float -> float
  val experimental_solver_is_enabled : unit -> bool
  val get_num_awake_parts : unit -> int
  val get_physics_throttling : unit -> int
  val get_real_physics_fps : unit -> float
  val get_server_time_now : unit -> float
  val join_to_outsiders : Instance.t list -> joint_creation_mode -> unit
  val pgs_is_enabled : unit -> bool
  val set_avatar_unification_mode : avatar_unification_mode -> unit
  val set_mesh_part_heads_and_accessories : mesh_part_heads_and_accessories -> unit
  val set_physics_throttle_enabled : bool -> unit
  val unjoin_from_outsiders : Instance.t list -> unit
  val zoom_to_extents : unit -> unit
end
and WorldModel : sig
  type t
end
and PackageLink : sig
  type t = {
    auto_update : bool;
    creator : string;
    default_name : string;
    package_asset_name : string;
    package_id : string;
    permission_level : package_permission;
    serialized_default_attributes : binary_string;
    status : string;
    version_number : int;
  }
end
and PackageService : sig
  type t
end
and PackageUIService : sig
  type t
  val convert_to_package_upload : string -> Instance.t list -> Instance.t list -> unit
  val get_package_info : int -> (string * 'a) list
  val publish_package : Instance.t -> unit
  val set_package_version : Instance.t -> int -> Instance.t
end
and Pages : sig
  type t = {
    is_finished : bool;
  }
  val get_current_page : unit -> 'a list
  val advance_to_next_page_async : unit -> unit
end
and AudioPages : sig
  type t
end
and CatalogPages : sig
  type t
end
and DataStoreKeyPages : sig
  type t = {
    cursor : string;
  }
end
and DataStoreListingPages : sig
  type t = {
    cursor : string;
  }
end
and DataStorePages : sig
  type t
end
and DataStoreVersionPages : sig
  type t
end
and FriendPages : sig
  type t
end
and InventoryPages : sig
  type t
end
and EmotesPages : sig
  type t
end
and MemoryStoreHashMapPages : sig
  type t
end
and OutfitPages : sig
  type t
end
and StandardPages : sig
  type t
end
and PartOperationAsset : sig
  type t
end
and ParticleEmitter : sig
  type t = {
    acceleration : vector3;
    brightness : float;
    color : color_sequence;
    drag : float;
    emission_direction : normal_id;
    enabled : bool;
    flipbook_framerate : number_range;
    flipbook_incompatible : string;
    flipbook_layout : particle_flipbook_layout;
    flipbook_mode : particle_flipbook_mode;
    flipbook_start_random : bool;
    lifetime : number_range;
    light_emission : float;
    light_influence : float;
    locked_to_part : bool;
    orientation : particle_orientation;
    rate : float;
    rot_speed : number_range;
    rotation : number_range;
    shape : particle_emitter_shape;
    shape_in_out : particle_emitter_shape_in_out;
    shape_partial : float;
    shape_style : particle_emitter_shape_style;
    size : number_sequence;
    speed : number_range;
    spread_angle : vector2;
    squash : number_sequence;
    texture : string;
    time_scale : float;
    transparency : number_sequence;
    velocity_inheritance : float;
    wind_affects_drag : bool;
    z_offset : float;
  }
  val clear : unit -> unit
  val emit : int -> unit
  val fast_forward : int -> unit
end
and PatchBundlerFileWatch : sig
  type t
end
and PatchMapping : sig
  type t = {
    flatten_tree : bool;
    patch_id : string;
    target_path : string;
  }
end
and Path : sig
  type t = {
    status : path_status;
  }
  val get_waypoints : unit -> 'a list
  val check_occlusion_async : int -> int
  val compute_async : vector3 -> vector3 -> unit
end
and PathfindingLink : sig
  type t = {
    attachment_0 : Attachment.t;
    attachment_1 : Attachment.t;
    is_bidirectional : bool;
    label : string;
  }
end
and PathfindingModifier : sig
  type t = {
    label : string;
    pass_through : bool;
  }
end
and PathfindingService : sig
  type t
  val create_path : (string * 'a) list -> Instance.t
  val find_path_async : vector3 -> vector3 -> Instance.t
end
and PausedState : sig
  type t = {
    all_threads_paused : bool;
    reason : debugger_pause_reason;
    thread_id : int;
  }
end
and PausedStateBreakpoint : sig
  type t = {
    breakpoint : Breakpoint.t;
  }
end
and PausedStateException : sig
  type t = {
    exception_text : string;
  }
end
and PermissionsService : sig
  type t
  val get_is_third_party_asset_allowed : unit -> bool
  val get_is_third_party_purchase_allowed : unit -> bool
  val get_is_third_party_teleport_allowed : unit -> bool
  val get_permissions : string -> 'a list
  val set_permissions : string -> 'a list -> unit
end
and PhysicsService : sig
  type t
  val collision_group_set_collidable : string -> string -> bool -> unit
  val collision_groups_are_collidable : string -> string -> bool
  val get_max_collision_groups : unit -> int
  val get_registered_collision_groups : unit -> 'a list
  val ik_solve : BasePart.t -> cframe -> float -> float -> unit
  val is_collision_group_registered : string -> bool
  val local_ik_solve : BasePart.t -> cframe -> float -> float -> unit
  val register_collision_group : string -> unit
  val rename_collision_group : string -> string -> unit
  val unregister_collision_group : string -> unit
end
and PhysicsSettings : sig
  type t = {
    allow_sleep : bool;
    are_anchors_shown : bool;
    are_assemblies_shown : bool;
    are_assembly_centers_of_mass_shown : bool;
    are_awake_parts_highlighted : bool;
    are_body_types_shown : bool;
    are_collision_costs_shown : bool;
    are_constraint_forces_shown_for_selected_or_hovered_instances : bool;
    are_constraint_torques_shown_for_selected_or_hovered_instances : bool;
    are_contact_forces_shown_for_selected_or_hovered_assemblies : bool;
    are_contact_islands_shown : bool;
    are_contact_points_shown : bool;
    are_gravity_forces_shown_for_selected_or_hovered_assemblies : bool;
    are_joint_coordinates_shown : bool;
    are_magnitudes_shown_for_drawn_forces_and_torques : bool;
    are_mechanisms_shown : bool;
    are_model_coords_shown : bool;
    are_non_anchors_shown : bool;
    are_owners_shown : bool;
    are_part_coords_shown : bool;
    are_regions_shown : bool;
    are_solver_islands_shown : bool;
    are_terrain_replication_regions_shown : bool;
    are_timesteps_shown : bool;
    are_unaligned_parts_shown : bool;
    are_world_coords_shown : bool;
    disable_cs_gv_2 : bool;
    disable_cs_gv_3_for_plugins : bool;
    fluid_force_draw_scale : float;
    force_cs_gv_2 : bool;
    force_draw_scale : float;
    is_interpolation_throttle_shown : bool;
    is_receive_age_shown : bool;
    is_tree_shown : bool;
    physics_environmental_throttle : enviromental_physics_throttle;
    show_decomposition_geometry : bool;
    show_fluid_forces_for_selected_or_hovered_mechanisms : bool;
    solver_convergence_metric_type : solver_convergence_metric_type;
    solver_convergence_visualization_mode : solver_convergence_visualization_mode;
    throttle_adjust_time : float;
    use_cs_gv_2 : bool;
  }
end
and PlaceStatsService : sig
  type t
end
and PlacesService : sig
  type t
  val start_play_solo : unit -> unit
  val stop_play_solo : unit -> unit
end
and PlatformCloudStorageService : sig
  type t
  val is_user_data_available : unit -> bool
  val get_user_data_async : string -> (string * 'a) list
  val set_user_data_async : string -> (string * 'a) list -> unit
end
and PlatformFriendsService : sig
  type t
  val is_invite_friends_enabled : unit -> bool
  val is_profile_enabled : unit -> bool
  val show_invite_friends_ui : unit -> unit
  val show_profile : string -> unit
  val get_party_members : unit -> 'a list
end
and Player : sig
  type t = {
    account_age : int;
    auto_jump_enabled : bool;
    camera_max_zoom_distance : float;
    camera_min_zoom_distance : float;
    camera_mode : camera_mode;
    can_load_character_appearance : bool;
    character : Model.t;
    character_appearance_id : int;
    chat_mode : chat_mode;
    dev_camera_occlusion_mode : dev_camera_occlusion_mode;
    dev_computer_camera_mode : dev_computer_camera_movement_mode;
    dev_computer_movement_mode : dev_computer_movement_mode;
    dev_enable_mouse_lock : bool;
    dev_touch_camera_mode : dev_touch_camera_movement_mode;
    dev_touch_movement_mode : dev_touch_movement_mode;
    display_name : string;
    follow_user_id : int;
    gameplay_paused : bool;
    guest : bool;
    has_verified_badge : bool;
    health_display_distance : float;
    locale_id : string;
    maximum_simulation_radius : float;
    membership_type : membership_type;
    name_display_distance : float;
    neutral : bool;
    os_platform : string;
    platform_name : string;
    replication_focus : Instance.t;
    respawn_location : SpawnLocation.t;
    simulation_radius : float;
    team : Team.t;
    team_color : brick_color;
    teleported : bool;
    teleported_in : bool;
    unfiltered_chat : bool;
    user_id : int;
    vr_device : string;
    vr_enabled : bool;
  }
  val add_to_block_list : 'a list -> unit
  val clear_character_appearance : unit -> unit
  val distance_from_character : vector3 -> float
  val get_friend_status : t -> friend_status
  val get_game_session_id : unit -> string
  val get_join_data : unit -> (string * 'a) list
  val get_mouse : unit -> Mouse.t
  val get_network_ping : unit -> float
  val get_under_13 : unit -> bool
  val has_appearance_loaded : unit -> bool
  val is_verified : unit -> bool
  val kick : string -> unit
  val move : vector3 -> bool -> unit
  val remove_character : unit -> unit
  val request_friendship : t -> unit
  val revoke_friendship : t -> unit
  val set_account_age : int -> unit
  val set_block_list_initialized : unit -> unit
  val set_character_appearance_json : string -> unit
  val set_experience_settings_locale_id : string -> unit
  val set_membership_type : membership_type -> unit
  val set_moderation_access_key : string -> unit
  val set_super_safe_chat : bool -> unit
  val update_player_blocked : int -> bool -> unit
  val get_friends_online : int -> 'a list
  val get_rank_in_group : int -> int
  val get_role_in_group : int -> string
  val is_friends_with : int -> bool
  val is_in_group : int -> bool
  val load_character : unit -> unit
  val load_character_blocking : unit -> unit
  val load_character_with_humanoid_description : HumanoidDescription.t -> unit
  val request_stream_around_async : vector3 -> float -> unit
end
and PlayerEmulatorService : sig
  type t = {
    custom_policies_enabled : bool;
    emulated_country_code : string;
    emulated_game_locale : string;
    player_emulation_enabled : bool;
    serialized_emulated_policy_info : binary_string;
  }
  val get_emulated_policy_info : unit -> (string * 'a) list
  val region_code_will_have_automatic_non_custom_policies : string -> bool
  val set_emulated_policy_info : (string * 'a) list -> unit
end
and PlayerScripts : sig
  type t
  val clear_computer_camera_movement_modes : unit -> unit
  val clear_computer_movement_modes : unit -> unit
  val clear_touch_camera_movement_modes : unit -> unit
  val clear_touch_movement_modes : unit -> unit
  val get_registered_computer_camera_movement_modes : unit -> 'a list
  val get_registered_computer_movement_modes : unit -> 'a list
  val get_registered_touch_camera_movement_modes : unit -> 'a list
  val get_registered_touch_movement_modes : unit -> 'a list
  val register_computer_camera_movement_mode : computer_camera_movement_mode -> unit
  val register_computer_movement_mode : computer_movement_mode -> unit
  val register_touch_camera_movement_mode : touch_camera_movement_mode -> unit
  val register_touch_movement_mode : touch_movement_mode -> unit
end
and PlayerViewService : sig
  type t
  val get_device_camera_c_frame : Player.t -> cframe
end
and Players : sig
  type t = {
    bubble_chat : bool;
    character_auto_loads : bool;
    classic_chat : bool;
    local_player : Player.t;
    max_players : int;
    max_players_internal : int;
    preferred_players : int;
    preferred_players_internal : int;
    respawn_time : float;
    use_strafing_animations : bool;
  }
  val chat : string -> unit
  val create_local_player : unit -> Player.t
  val get_player_by_user_id : int -> Player.t
  val get_player_from_character : Model.t -> Player.t
  val get_players : unit -> Instance.t list
  val report_abuse : Player.t -> string -> string -> unit
  val report_abuse_v_3 : Player.t -> string -> unit
  val reset_local_player : unit -> unit
  val set_chat_style : chat_style -> unit
  val set_local_player_info : int -> string -> string -> membership_type -> bool -> unit
  val team_chat : string -> unit
  val whisper_chat : string -> Instance.t -> unit
  val create_humanoid_model_from_description : HumanoidDescription.t -> humanoid_rig_type -> asset_type_verification -> Model.t
  val create_humanoid_model_from_user_id : int -> Model.t
  val get_character_appearance_info_async : int -> (string * 'a) list
  val get_friends_async : int -> FriendPages.t
  val get_humanoid_description_from_outfit_id : int -> HumanoidDescription.t
  val get_humanoid_description_from_user_id : int -> HumanoidDescription.t
  val get_name_from_user_id_async : int -> string
  val get_user_id_from_name_async : string -> int
  val get_user_thumbnail_async : int -> thumbnail_type -> thumbnail_size -> 'a list
end
and Plugin : sig
  type t = {
    collision_enabled : bool;
    grid_size : float;
    host_data_model_type : studio_data_model_type;
    host_data_model_type_is_current : bool;
    multiple_document_interface_instance : MultipleDocumentInterfaceInstance.t;
    uses_asset_insertion_drag : bool;
  }
  val activate : bool -> unit
  val create_plugin_action : string -> string -> string -> string -> bool -> PluginAction.t
  val create_plugin_menu : string -> string -> string -> PluginMenu.t
  val create_toolbar : string -> PluginToolbar.t
  val deactivate : unit -> unit
  val get_item : string -> 'a -> 'a
  val get_join_mode : unit -> joint_creation_mode
  val get_mouse : unit -> PluginMouse.t
  val get_selected_ribbon_tool : unit -> ribbon_tool
  val get_setting : string -> 'a
  val intersect : Instance.t list -> Instance.t
  val invoke : string -> 'a list -> unit
  val is_activated : unit -> bool
  val is_activated_with_exclusive_mouse : unit -> bool
  val negate : Instance.t list -> Instance.t list
  val on_invoke : string -> (unit -> unit) -> Instance.t
  val on_set_item : string -> (unit -> unit) -> Instance.t
  val open_script : LuaSourceContainer.t -> int -> unit
  val open_wiki_page : string -> unit
  val pause_sound : Instance.t -> unit
  val play_sound : Instance.t -> float -> unit
  val resume_sound : Instance.t -> unit
  val save_selected_to_roblox : unit -> unit
  val select_ribbon_tool : ribbon_tool -> u_dim_2 -> unit
  val separate : Instance.t list -> Instance.t list
  val set_item : string -> 'a -> unit
  val set_ready : unit -> unit
  val set_setting : string -> 'a -> unit
  val start_decal_drag : Instance.t -> unit
  val start_drag : (string * 'a) list -> unit
  val stop_all_sounds : unit -> unit
  val union : Instance.t list -> Instance.t
  val create_dock_widget_plugin_gui : string -> dock_widget_plugin_gui_info -> DockWidgetPluginGui.t
  val create_q_widget_plugin_gui : string -> (string * 'a) list -> QWidgetPluginGui.t
  val import_fbx_animation : Instance.t -> bool -> Instance.t
  val import_fbx_rig : bool -> Instance.t
  val prompt_for_existing_asset_id : string -> int
  val prompt_save_selection : string -> bool
end
and PluginAction : sig
  type t = {
    action_id : string;
    allow_binding : bool;
    checked : bool;
    default_shortcut : string;
    enabled : bool;
    status_tip : string;
    text : string;
  }
end
and PluginCapabilities : sig
  type t = {
    manifest : string;
  }
end
and PluginDebugService : sig
  type t
end
and PluginDragEvent : sig
  type t = {
    data : string;
    mime_type : string;
    position : vector2;
    sender : string;
  }
end
and PluginGuiService : sig
  type t
end
and PluginManagementService : sig
  type t
  val set_auto_update : int -> bool -> unit
  val get_ota_plugin_version : string -> int
end
and PluginManager : sig
  type t
  val export_place : string -> unit
  val export_selection : string -> unit
end
and PluginManagerInterface : sig
  type t
  val export_place : string -> unit
  val export_selection : string -> unit
end
and PluginMenu : sig
  type t = {
    icon : string;
    title : string;
  }
  val add_action : Instance.t -> unit
  val add_menu : Instance.t -> unit
  val add_new_action : string -> string -> string -> Instance.t
  val add_separator : unit -> unit
  val clear : unit -> unit
  val show_async : unit -> Instance.t
end
and PluginPolicyService : sig
  type t
  val get_plugin_policy : string -> (string * 'a) list
end
and PluginToolbar : sig
  type t
  val create_button : string -> string -> string -> string -> Instance.t
  val create_popup_button : string -> string -> string -> string -> Instance.t
end
and PluginToolbarButton : sig
  type t = {
    clickable_when_viewport_hidden : bool;
    enabled : bool;
    icon : string;
  }
  val set_active : bool -> unit
end
and PointsService : sig
  type t
end
and PolicyService : sig
  type t = {
    is_luobu_server : tri_state_boolean;
    luobu_whitelisted : tri_state_boolean;
  }
  val get_policy_info_for_player_async : Instance.t -> (string * 'a) list
  val get_policy_info_for_server_roblox_only_async : unit -> (string * 'a) list
end
and PoseBase : sig
  type t = {
    easing_direction : pose_easing_direction;
    easing_style : pose_easing_style;
    weight : float;
  }
end
and NumberPose : sig
  type t = {
    value : float;
  }
end
and Pose : sig
  type t = {
    c_frame : cframe;
  }
  val add_sub_pose : Instance.t -> unit
  val get_sub_poses : unit -> Instance.t list
  val remove_sub_pose : Instance.t -> unit
end
and PostEffect : sig
  type t = {
    enabled : bool;
  }
end
and BloomEffect : sig
  type t = {
    intensity : float;
    size : float;
    threshold : float;
  }
end
and BlurEffect : sig
  type t = {
    size : float;
  }
end
and ColorCorrectionEffect : sig
  type t = {
    brightness : float;
    contrast : float;
    saturation : float;
    tint_color : color3;
  }
end
and DepthOfFieldEffect : sig
  type t = {
    far_intensity : float;
    focus_distance : float;
    in_focus_radius : float;
    near_intensity : float;
  }
end
and SunRaysEffect : sig
  type t = {
    intensity : float;
    spread : float;
  }
end
and ProcessInstancePhysicsService : sig
  type t
end
and ProximityPrompt : sig
  type t = {
    action_text : string;
    auto_localize : bool;
    clickable_prompt : bool;
    enabled : bool;
    exclusivity : proximity_prompt_exclusivity;
    gamepad_key_code : key_code;
    hold_duration : float;
    keyboard_key_code : key_code;
    max_activation_distance : float;
    object_text : string;
    requires_line_of_sight : bool;
    root_localization_table : LocalizationTable.t;
    style : proximity_prompt_style;
    ui_offset : vector2;
  }
  val input_hold_begin : unit -> unit
  val input_hold_end : unit -> unit
end
and ProximityPromptService : sig
  type t = {
    enabled : bool;
    max_prompts_visible : int;
  }
end
and PublishService : sig
  type t
  val publish_descendant_assets : Instance.t -> bool
  val create_asset_and_wait_for_asset_id : Instance.t list -> string -> asset_creator_type -> int -> string -> string -> string -> int -> int
  val publish_cage_mesh_async : Instance.t -> cage_type -> string
end
and RbxAnalyticsService : sig
  type t
  val add_global_points_field : string -> int -> unit
  val add_global_points_tag : string -> string -> unit
  val deprecated_track_event : string -> string -> string -> int -> unit
  val deprecated_track_event_with_args : string -> string -> string -> (string * 'a) list -> int -> unit
  val get_client_id : unit -> string
  val get_play_session_id : unit -> string
  val get_session_id : unit -> string
  val release_rbx_event_stream : string -> unit
  val remove_global_points_field : string -> unit
  val remove_global_points_tag : string -> unit
  val report_counter : string -> int -> unit
  val report_influx_series : string -> (string * 'a) list -> int -> unit
  val report_stats : string -> float -> unit
  val report_to_diag_by_country_code : string -> string -> float -> unit
  val send_event_deferred : string -> string -> string -> (string * 'a) list -> unit
  val send_event_immediately : string -> string -> string -> (string * 'a) list -> unit
  val set_rbx_event : string -> string -> string -> (string * 'a) list -> unit
  val set_rbx_event_stream : string -> string -> string -> (string * 'a) list -> unit
  val track_event : string -> string -> string -> int -> unit
  val track_event_with_args : string -> string -> string -> (string * 'a) list -> int -> unit
  val update_heartbeat_object : (string * 'a) list -> unit
end
and ReflectionMetadata : sig
  type t
end
and ReflectionMetadataCallbacks : sig
  type t
end
and ReflectionMetadataClasses : sig
  type t
end
and ReflectionMetadataEnums : sig
  type t
end
and ReflectionMetadataEvents : sig
  type t
end
and ReflectionMetadataFunctions : sig
  type t
end
and ReflectionMetadataItem : sig
  type t = {
    browsable : bool;
    class_category : string;
    client_only : bool;
    constraint : string;
    deprecated : bool;
    editing_disabled : bool;
    editor_type : string;
    f_flag : string;
    is_backend : bool;
    property_order : int;
    script_context : string;
    server_only : bool;
    slider_scaling : string;
    ui_maximum : float;
    ui_minimum : float;
    ui_num_ticks : float;
  }
end
and ReflectionMetadataClass : sig
  type t = {
    explorer_image_index : int;
    explorer_order : int;
    insertable : bool;
    preferred_parent : string;
    service_visibility : service_visibility;
  }
end
and ReflectionMetadataEnum : sig
  type t
end
and ReflectionMetadataEnumItem : sig
  type t
end
and ReflectionMetadataMember : sig
  type t
end
and ReflectionMetadataProperties : sig
  type t
end
and ReflectionMetadataYieldFunctions : sig
  type t
end
and ReflectionService : sig
  type t
  val get_property_names : string -> 'a list
end
and RemoteCursorService : sig
  type t
end
and RemoteDebuggerServer : sig
  type t
end
and RemoteFunction : sig
  type t
  val invoke_client : Player.t -> 'a list -> 'a list
  val invoke_server : 'a list -> 'a list
end
and RenderSettings : sig
  type t = {
    auto_frm_level : int;
    eager_bulk_execution : bool;
    edit_quality_level : quality_level;
    enable_vr_mode : bool;
    enable_frm : bool;
    export_merge_by_material : bool;
    frame_rate_manager : framerate_manager_mode;
    graphics_mode : graphics_mode;
    mesh_cache_size : int;
    mesh_part_detail_level : mesh_part_detail_level;
    quality_level : quality_level;
    reload_assets : bool;
    render_csg_triangles_debug : bool;
    show_bounding_boxes : bool;
    view_mode : view_mode;
  }
  val get_max_quality_level : unit -> int
end
and RenderingTest : sig
  type t = {
    c_frame : cframe;
    comparison_diff_threshold : int;
    comparison_method : rendering_test_comparison_method;
    comparison_psnr_threshold : float;
    description : string;
    field_of_view : float;
    orientation : vector3;
    perf_test : bool;
    position : vector3;
    quality_level : int;
    should_skip : bool;
    ticket : string;
    timeout : int;
  }
  val renderdoc_trigger_capture : unit -> unit
end
and ReplicatedFirst : sig
  type t
  val is_default_loading_gui_removed : unit -> bool
  val is_finished_replicating : unit -> bool
  val remove_default_loading_screen : unit -> unit
  val set_default_loading_gui_removed : unit -> unit
end
and ReplicatedStorage : sig
  type t
end
and RibbonNotificationService : sig
  type t
  val on_notification_update_from_plugin : string -> string -> unit
end
and RobloxPluginGuiService : sig
  type t
end
and RobloxReplicatedStorage : sig
  type t
end
and RobloxServerStorage : sig
  type t
end
and RomarkService : sig
  type t
  val end_remote_romark_test : unit -> unit
end
and RotationCurve : sig
  type t = {
    length : int;
  }
  val get_key_at_index : int -> rotation_curve_key
  val get_key_indices_at_time : float -> 'a list
  val get_keys : unit -> 'a list
  val get_value_at_time : float -> coordinate_frame option
  val insert_key : rotation_curve_key -> 'a list
  val remove_key_at_index : int -> int -> int
  val set_keys : 'a list -> int
end
and RtMessagingService : sig
  type t
end
and RunService : sig
  type t = {
    client_git_hash : string;
  }
  val bind_to_render_step : string -> int -> (unit -> unit) -> unit
  val get_core_script_version : unit -> string
  val get_roblox_client_channel : unit -> string
  val get_roblox_version : unit -> string
  val is_client : unit -> bool
  val is_edit : unit -> bool
  val is_run_mode : unit -> bool
  val is_running : unit -> bool
  val is_server : unit -> bool
  val is_studio : unit -> bool
  val pause : unit -> unit
  val run : unit -> unit
  val set_3_d_rendering_enabled : bool -> unit
  val set_roblox_gui_focused : bool -> unit
  val stop : unit -> unit
  val unbind_from_render_step : string -> unit
  val set_throttle_framerate_enabled : bool -> unit
end
and RuntimeScriptService : sig
  type t
end
and SafetyService : sig
  type t
  val take_screenshot : (string * 'a) list -> int
end
and ScreenshotHud : sig
  type t = {
    camera_button_icon : string;
    camera_button_position : u_dim_2;
    close_button_position : u_dim_2;
    close_when_screenshot_taken : bool;
    experience_name_overlay_enabled : bool;
    hide_core_gui_for_captures : bool;
    hide_player_gui_for_captures : bool;
    overlay_font : font;
    username_overlay_enabled : bool;
    visible : bool;
  }
end
and ScriptBuilder : sig
  type t
end
and SyncScriptBuilder : sig
  type t = {
    compile_target : compile_target;
    coverage_info : bool;
    debug_info : bool;
    pack_as_source : bool;
  }
end
and ScriptChangeService : sig
  type t
end
and ScriptCloneWatcher : sig
  type t
end
and ScriptCloneWatcherHelper : sig
  type t
end
and ScriptCommitService : sig
  type t
end
and ScriptContext : sig
  type t = {
    scripts_disabled : bool;
  }
  val add_core_script_local : string -> Instance.t -> unit
  val clear_script_profiling_data : unit -> unit
  val deserialize_script_profiler_string : string -> (string * 'a) list
  val get_coverage_stats : unit -> 'a list
  val get_script_profiling_data : unit -> string
  val save_script_profiling_data : string -> unit
  val set_timeout : float -> unit
  val start_script_profiling : int option -> unit
  val stop_script_profiling : unit -> string
end
and ScriptDebugger : sig
  type t = {
    current_line : int;
    is_debugging : bool;
    is_paused : bool;
    script : Instance.t;
  }
  val add_watch : string -> Instance.t
  val get_breakpoints : unit -> Instance.t list
  val get_globals : int -> (string * 'a) list
  val get_locals : int -> (string * 'a) list
  val get_stack : unit -> 'a list
  val get_upvalues : int -> (string * 'a) list
  val get_watch_value : Instance.t -> 'a
  val get_watches : unit -> Instance.t list
  val set_breakpoint : int -> bool -> Instance.t
  val set_global : string -> 'a -> int -> unit
  val set_local : string -> 'a -> int -> unit
  val set_upvalue : string -> 'a -> int -> unit
end
and ScriptDocument : sig
  type t
  val get_internal_uri : unit -> string
  val get_line : int option -> string
  val get_line_count : unit -> int
  val get_script : unit -> LuaSourceContainer.t
  val get_selected_text : unit -> string
  val get_selection : unit -> 'a list
  val get_selection_end : unit -> 'a list
  val get_selection_start : unit -> 'a list
  val get_text : int option -> int option -> int option -> int option -> string
  val get_viewport : unit -> 'a list
  val has_selected_text : unit -> bool
  val is_command_bar : unit -> bool
  val close_async : unit -> 'a list
  val edit_text_async : string -> int -> int -> int -> int -> 'a list
  val force_set_selection_async : int -> int -> int option -> int option -> 'a list
  val request_set_selection_async : int -> int -> int option -> int option -> 'a list
end
and ScriptEditorService : sig
  type t
  val deregister_autocomplete_callback : string -> unit
  val deregister_script_analysis_callback : string -> unit
  val find_script_document : LuaSourceContainer.t -> ScriptDocument.t
  val force_reload_source : string -> string -> unit
  val get_editor_source : LuaSourceContainer.t -> string
  val get_script_documents : unit -> Instance.t list
  val register_autocomplete_callback : string -> int -> (unit -> unit) -> unit
  val register_script_analysis_callback : string -> int -> (unit -> unit) -> unit
  val edit_source_async_with_ranges : LuaSourceContainer.t -> string -> int -> int -> int -> int -> 'a list
  val open_script_document_async : LuaSourceContainer.t -> 'a list
  val update_source_async : LuaSourceContainer.t -> (unit -> unit) -> unit
end
and ScriptRegistrationService : sig
  type t
  val get_source_container_by_script_guid : string -> LuaSourceContainer.t
end
and ScriptRuntime : sig
  type t
end
and ScriptService : sig
  type t
end
and Selection : sig
  type t = {
    active_instance : Instance.t;
    render_mode : selection_render_mode;
    selection_box_thickness : float;
    selection_line_thickness : int;
    selection_thickness : float;
    show_active_instance_highlight : bool;
  }
  val add : Instance.t list -> unit
  val clear_terrain_selection_hack : unit -> unit
  val get : unit -> Instance.t list
  val remove : Instance.t list -> unit
  val set : Instance.t list -> unit
  val set_terrain_selection_hack : vector3 -> vector3 -> unit
end
and SelectionHighlightManager : sig
  type t
end
and SensorBase : sig
  type t = {
    update_type : sensor_update_type;
  }
end
and BuoyancySensor : sig
  type t = {
    fully_submerged : bool;
    touching_surface : bool;
  }
end
and ControllerSensor : sig
  type t
end
and ControllerPartSensor : sig
  type t = {
    hit_frame : cframe;
    hit_normal : vector3;
    search_distance : float;
    sensed_part : BasePart.t;
    sensor_mode : sensor_mode;
  }
end
and ServerScriptService : sig
  type t = {
    load_string_enabled : bool;
  }
end
and ServerStorage : sig
  type t
end
and ServiceProvider : sig
  type t
  val find_service : string -> Instance.t
  val get_service : string -> Instance.t
end
and DataModel : sig
  type t = {
    creator_id : int;
    creator_type : creator_type;
    game_id : int;
    genre : genre;
    is_sf_flags_loaded : bool;
    job_id : string;
    place_id : int;
    place_version : int;
    private_server_id : string;
    private_server_owner_id : int;
    workspace : Workspace.t;
  }
  val bind_to_close : (unit -> unit) -> unit
  val define_fast_flag : string -> bool -> bool
  val define_fast_int : string -> int -> int
  val define_fast_string : string -> string -> string
  val get_engine_feature : string -> bool
  val get_fast_flag : string -> bool
  val get_fast_int : string -> int
  val get_fast_string : string -> string
  val get_jobs_info : unit -> 'a list
  val get_objects : string -> Instance.t list
  val get_objects_all_or_none : string -> bool -> Instance.t list
  val get_objects_list : 'a list -> 'a list
  val get_play_session_id : unit -> string
  val is_content_loaded : unit -> bool
  val is_loaded : unit -> bool
  val is_universe_metadata_loaded : unit -> bool
  val load : string -> unit
  val open_screenshots_folder : unit -> unit
  val open_videos_folder : unit -> unit
  val report_in_google_analytics : string -> string -> string -> int -> unit
  val set_fast_flag_for_testing : string -> bool -> bool
  val set_fast_int_for_testing : string -> int -> int
  val set_fast_string_for_testing : string -> string -> string
  val set_flag_version : string -> int -> unit
  val set_is_loaded : bool -> int option -> unit
  val set_place_id : int -> unit
  val set_universe_id : int -> unit
  val shutdown : unit -> unit
  val get_objects_async : string -> Instance.t list
  val http_get_async : string -> http_request_type -> string
  val http_post_async : string -> string -> string -> http_request_type -> string
  val insert_objects_and_join_if_legacy_async : string -> Instance.t list
end
and GenericSettings : sig
  type t
end
and AnalysticsSettings : sig
  type t
end
and GlobalSettings : sig
  type t
  val get_f_flag : string -> bool
  val get_f_variable : string -> string
end
and UserSettings : sig
  type t
  val is_user_feature_enabled : string -> bool
  val reset : unit -> unit
  val save_state : unit -> unit
end
and ServiceVisibilityService : sig
  type t = {
    hidden_services : binary_string;
    visible_services : binary_string;
  }
end
and SessionService : sig
  type t
  val acquire_context_focus : string -> unit
  val generate_session_info_string : bool -> bool -> bool -> bool -> string
  val get_created_timestamp_utc_ms : string -> int
  val get_metadata : string -> string -> 'a
  val get_root_sid : unit -> string
  val get_session_tag : string -> string
  val is_context_focused : string -> bool
  val release_context_focus : string -> unit
  val remove_metadata : string -> string -> string -> unit
  val remove_session : string -> string -> unit
  val remove_sessions_with_metadata_key : string -> unit
  val replace_session : string -> string -> unit
  val session_exists : string -> bool
  val set_metadata : string -> string -> 'a -> string -> unit
  val set_session : string -> string -> string -> string -> unit
end
and SharedTableRegistry : sig
  type t
  val get_shared_table : string -> shared_table
  val set_shared_table : string -> shared_table option -> unit
end
and ShorelineUpgraderService : sig
  type t
  val cancel : unit -> unit
  val start : unit -> unit
end
and Sky : sig
  type t = {
    celestial_bodies_shown : bool;
    moon_angular_size : float;
    moon_texture_id : string;
    skybox_bk : string;
    skybox_dn : string;
    skybox_ft : string;
    skybox_lf : string;
    skybox_rt : string;
    skybox_up : string;
    star_count : int;
    sun_angular_size : float;
    sun_texture_id : string;
  }
end
and Smoke : sig
  type t = {
    color : color3;
    enabled : bool;
    opacity : float;
    rise_velocity : float;
    size : float;
    time_scale : float;
  }
  val fast_forward : int -> unit
end
and SmoothVoxelsUpgraderService : sig
  type t
  val cancel : unit -> unit
  val start : unit -> unit
end
and SnippetService : sig
  type t
end
and SocialService : sig
  type t
  val hide_self_view : unit -> unit
  val invoke_game_invite_prompt_closed : Instance.t -> 'a list -> unit
  val invoke_iris_invite : Instance.t -> string -> 'a list -> unit
  val invoke_iris_invite_prompt_closed : Instance.t -> unit
  val prompt_game_invite : Instance.t -> Instance.t -> unit
  val prompt_phone_book : Instance.t -> string -> unit
  val show_self_view : self_view_position -> unit
  val can_send_call_invite_async : Instance.t -> bool
  val can_send_game_invite_async : Instance.t -> int -> bool
end
and Sound : sig
  type t = {
    channel_count : int;
    is_loaded : bool;
    is_paused : bool;
    is_playing : bool;
    is_spatial : bool;
    loop_region : number_range;
    looped : bool;
    play_on_remove : bool;
    playback_loudness : float;
    playback_region : number_range;
    playback_regions_enabled : bool;
    playback_speed : float;
    playing : bool;
    roll_off_gain : float;
    roll_off_max_distance : float;
    roll_off_min_distance : float;
    roll_off_mode : roll_off_mode;
    sound_group : SoundGroup.t;
    sound_id : string;
    time_length : float;
    time_position : float;
    usage_context_permission : usage_context;
    volume : float;
  }
  val pause : unit -> unit
  val play : unit -> unit
  val resume : unit -> unit
  val stop : unit -> unit
end
and SoundEffect : sig
  type t = {
    enabled : bool;
    priority : int;
  }
end
and ChorusSoundEffect : sig
  type t = {
    depth : float;
    mix : float;
    rate : float;
  }
end
and CompressorSoundEffect : sig
  type t = {
    attack : float;
    gain_makeup : float;
    ratio : float;
    release : float;
    side_chain : Instance.t;
    threshold : float;
  }
end
and CustomSoundEffect : sig
  type t
end
and AssetSoundEffect : sig
  type t
end
and ChannelSelectorSoundEffect : sig
  type t = {
    channel : int;
  }
end
and DistortionSoundEffect : sig
  type t = {
    level : float;
  }
end
and EchoSoundEffect : sig
  type t = {
    delay : float;
    dry_level : float;
    feedback : float;
    wet_level : float;
  }
end
and EqualizerSoundEffect : sig
  type t = {
    high_gain : float;
    low_gain : float;
    mid_gain : float;
  }
end
and FlangeSoundEffect : sig
  type t = {
    depth : float;
    mix : float;
    rate : float;
  }
end
and PitchShiftSoundEffect : sig
  type t = {
    octave : float;
  }
end
and ReverbSoundEffect : sig
  type t = {
    decay_time : float;
    density : float;
    diffusion : float;
    dry_level : float;
    wet_level : float;
  }
end
and TremoloSoundEffect : sig
  type t = {
    depth : float;
    duty : float;
    frequency : float;
  }
end
and SoundGroup : sig
  type t = {
    volume : float;
  }
end
and SoundService : sig
  type t = {
    ambient_reverb : reverb_type;
    distance_factor : float;
    doppler_scale : float;
    respect_filtering_enabled : bool;
    rolloff_scale : float;
    volumetric_audio : volumetric_audio;
  }
  val begin_recording : unit -> bool
  val get_input_device : unit -> 'a list
  val get_input_devices : unit -> 'a list
  val get_listener : unit -> 'a list
  val get_output_device : unit -> 'a list
  val get_output_devices : unit -> 'a list
  val get_sound_memory_data : unit -> (string * 'a) list
  val play_local_sound : Instance.t -> unit
  val set_input_device : string -> string -> unit
  val set_listener : listener_type -> 'a list -> unit
  val set_output_device : string -> string -> unit
  val set_recording_device : int -> bool
  val end_recording : unit -> (string * 'a) list
  val get_recording_devices : unit -> (string * 'a) list
end
and Sparkles : sig
  type t = {
    color : color3;
    enabled : bool;
    sparkle_color : color3;
    time_scale : float;
  }
  val fast_forward : int -> unit
end
and SpawnerService : sig
  type t
end
and StackFrame : sig
  type t = {
    frame_id : int;
    frame_name : string;
    frame_type : debugger_frame_type;
    globals : DebuggerVariable.t;
    line : int;
    locals : DebuggerVariable.t;
    populated : bool;
    script : string;
    upvalues : DebuggerVariable.t;
  }
end
and StandalonePluginScripts : sig
  type t
end
and StarterGear : sig
  type t
end
and StarterPack : sig
  type t
end
and StarterPlayer : sig
  type t = {
    allow_custom_animations : bool;
    animation_compositor_mode : animation_compositor_mode;
    auto_jump_enabled : bool;
    avatar_joint_upgrade : avatar_joint_upgrade;
    camera_max_zoom_distance : float;
    camera_min_zoom_distance : float;
    camera_mode : camera_mode;
    character_jump_height : float;
    character_jump_power : float;
    character_max_slope_angle : float;
    character_use_jump_power : bool;
    character_walk_speed : float;
    death_style : death_style;
    dev_camera_occlusion_mode : dev_camera_occlusion_mode;
    dev_computer_camera_movement_mode : dev_computer_camera_movement_mode;
    dev_computer_movement_mode : dev_computer_movement_mode;
    dev_touch_camera_movement_mode : dev_touch_camera_movement_mode;
    dev_touch_movement_mode : dev_touch_movement_mode;
    enable_dynamic_heads : load_dynamic_heads;
    enable_mouse_lock_option : bool;
    game_settings_asset_id_face : int;
    game_settings_asset_id_head : int;
    game_settings_asset_id_left_arm : int;
    game_settings_asset_id_left_leg : int;
    game_settings_asset_id_pants : int;
    game_settings_asset_id_right_arm : int;
    game_settings_asset_id_right_leg : int;
    game_settings_asset_id_shirt : int;
    game_settings_asset_id_tee_shirt : int;
    game_settings_asset_id_torso : int;
    game_settings_avatar : game_avatar_type;
    game_settings_r_15_collision : r_15_collision_type;
    game_settings_scale_range_body_type : number_range;
    game_settings_scale_range_head : number_range;
    game_settings_scale_range_height : number_range;
    game_settings_scale_range_proportion : number_range;
    game_settings_scale_range_width : number_range;
    health_display_distance : float;
    humanoid_state_machine_mode : humanoid_state_machine_mode;
    load_character_appearance : bool;
    load_character_layered_clothing : load_character_layered_clothing;
    lua_character_controller : character_control_mode;
    name_display_distance : float;
    user_emotes_enabled : bool;
  }
  val clear_defaults : unit -> unit
end
and StarterPlayerScripts : sig
  type t
end
and StarterCharacterScripts : sig
  type t
end
and Stats : sig
  type t = {
    contacts_count : int;
    data_receive_kbps : float;
    data_send_kbps : float;
    heartbeat_time_ms : float;
    instance_count : int;
    moving_primitives_count : int;
    physics_receive_kbps : float;
    physics_send_kbps : float;
    physics_step_time_ms : float;
    primitives_count : int;
  }
  val get_browser_tracker_id : unit -> string
  val get_memory_usage_mb_for_tag : developer_memory_tag -> float
  val get_total_memory_usage_mb : unit -> float
  val get_paginated_memory_by_texture : texture_query_type -> int -> int -> (string * 'a) list
end
and StatsItem : sig
  type t = {
    display_name : string;
  }
  val get_value : unit -> float
  val get_value_string : unit -> string
end
and RunningAverageItemDouble : sig
  type t
end
and RunningAverageItemInt : sig
  type t
end
and RunningAverageTimeIntervalItem : sig
  type t
end
and TotalCountTimeIntervalItem : sig
  type t
end
and StopWatchReporter : sig
  type t
  val finish_task : int -> unit
  val send_report : string -> unit
  val start_task : string -> string -> int
end
and StreamingService : sig
  type t
  val get_ephemeral_variable : string -> 'a
  val get_instance : string -> string -> Instance.t
  val invoke_command : string -> string -> 'a -> unit
  val register_command : string -> (unit -> unit) -> unit
  val register_context_collector : string -> (unit -> unit) -> unit
  val register_sequential_command : string -> (unit -> unit) -> unit
  val set_ephemeral_variable : string -> 'a -> int -> unit
  val set_plugin_info_callback : (unit -> unit) -> unit
  val unregister_command : string -> unit
  val unregister_context_collector : string -> unit
  val execute_command_async : string -> string -> 'a -> unit
end
and Studio : sig
  type t = {
    "todo"_color : color3;
    "function"_color : color3;
    "local"_color : color3;
    "nil"_color : color3;
    "self"_color : color3;
    active_color : color3;
    active_hover_over_color : color3;
    always_save_script_changes : bool;
    animate_hover_over : bool;
    auto_clean_empty_line : bool;
    auto_closing_brackets : bool;
    auto_closing_quotes : bool;
    auto_delete_closing_brackets_and_quotes : bool;
    auto_indent_rule : auto_indent_rule;
    auto_recovery_enabled : bool;
    auto_recovery_interval_(minutes) : int;
    auto_recovery_path : q_dir;
    automatically_commit_locked_scripts_when_you_save_or_publish_to_roblox : bool;
    automatically_trigger_ai_code_completion : bool;
    background_color : color3;
    basic_objects_display_mode : list_display_mode;
    bool_color : color3;
    bracket_color : color3;
    built_in_function_color : color3;
    camera_mouse_wheel_speed : float;
    camera_pan_speed : float;
    camera_shift_speed : float;
    camera_speed : float;
    camera_speed_adjust_binding : camera_speed_adjust_binding;
    camera_zoom_to_mouse_position : bool;
    camera_adaptive_speed : bool;
    camera_tween_focus : bool;
    clear_output_on_start : bool;
    command_bar_local_state : bool;
    comment_color : color3;
    current_line_highlight_color : color3;
    debugger_current_line_color : color3;
    debugger_error_line_color : color3;
    default_script_file_dir : q_dir;
    deprecated_objects_shown : bool;
    display_language : string;
    doc_view_code_background_color : color3;
    enable_autocomplete : bool;
    enable_autocomplete_doc_view : bool;
    enable_core_script_debugger : bool;
    enable_http_sandboxing : bool;
    enable_internal_beta_features : bool;
    enable_internal_features : bool;
    enable_script_analysis : bool;
    enable_scrollbar_markers : bool;
    enable_signature_help : bool;
    enable_signature_help_doc_view : bool;
    enable_temporary_tabs : bool;
    enable_temporary_tabs_in_explorer : bool;
    enable_type_hover : bool;
    enable_indentation_rulers : bool;
    enable_on_type_autocomplete : bool;
    error_color : color3;
    find_selection_background_color : color3;
    font : q_font;
    format_on_paste : bool;
    format_on_type : bool;
    free_camera_speed_scroll : bool;
    function_name_color : color3;
    highlight_current_line : bool;
    highlight_occurances : bool;
    hint_color : color3;
    hover_animate_speed : hover_animate_speed;
    hover_box_thickness : float;
    hover_line_thickness : int;
    hover_over_color : color3;
    icon_override_dir : q_dir;
    indent_using_spaces : bool;
    indentation_ruler_color : color3;
    information_color : color3;
    keyword_color : color3;
    large_file_line_count_threshold : int;
    large_file_threshold : int;
    line_thickness : float;
    local_assets_folder : q_dir;
    lua_debugger_enabled : bool;
    lua_debugger_enabled_at_startup : bool;
    luau_keyword_color : color3;
    main_volume : float;
    matching_word_background_color : color3;
    maximum_output_lines : int;
    menu_item_background_color : color3;
    method_color : color3;
    number_color : color3;
    only_play_audio_from_window_in_focus : bool;
    operator_color : color3;
    output_font : q_font;
    output_layout_mode : output_layout_mode;
    permission_level_shown : permission_level_shown;
    physical_draggers_select_scope_by_default : bool;
    pivot_snap_to_geometry_color : color3;
    plugin_debugging_enabled : bool;
    plugins_dir : q_dir;
    primary_text_color : color3;
    property_color : color3;
    reload_builtin_plugins_on_change : bool;
    reload_local_plugins_on_change : bool;
    respect_studio_shortcuts_when_game_has_focus : bool;
    ruler_color : color3;
    rulers : string;
    runtime_undo_behavior : runtime_undo_behavior;
    script_editor_color_preset : studio_script_editor_color_presets;
    script_editor_scrollbar_background_color : color3;
    script_editor_scrollbar_handle_color : color3;
    script_editor_menu_border_color : color3;
    script_editor_should_show_plugin_methods : bool;
    script_timeout_length : int;
    scroll_past_last_line : bool;
    secondary_text_color : color3;
    select_color : color3;
    select/hover_color : color3;
    selected_menu_item_background_color : color3;
    selected_text_color : color3;
    selection_background_color : color3;
    selection_box_thickness : float;
    selection_color : color3;
    selection_line_thickness : int;
    server_audio_behavior : server_audio_behavior;
    set_pivot_of_imported_parts : bool;
    show_core_gui_in_explorer_while_playing : bool;
    show_diagnostics_bar : bool;
    show_file_sync_service : bool;
    show_hidden_objects_in_explorer : bool;
    show_hover_over : bool;
    show_light_guides : bool;
    show_navigation_labels : bool;
    show_navigation_mesh : bool;
    show_pathfinding_links : bool;
    show_plugin_gui_service_in_explorer : bool;
    show_singly_selected_attachment_parent_frame : bool;
    show_whitespace : bool;
    show_plus_button_on_hover_in_explorer : bool;
    show_core_packages_in_explorer : bool;
    skip_closing_brackets_and_quotes : bool;
    string_color : color3;
    tab_width : int;
    text_color : color3;
    text_wrapping : bool;
    theme : Instance.t;
    use_bounding_box_move_handles : bool;
    warning_color : color3;
    whitespace_color : color3;
  }
  val get_available_themes : unit -> 'a list
end
and StudioAssetService : sig
  type t
  val convert_to_package_upload : string -> Instance.t list -> Instance.t list -> unit
  val fire_on_ugc_submit_completed : bool -> unit
  val publish_package : Instance.t -> (string * 'a) list -> unit
  val show_save_to_roblox : Instance.t list -> 'a -> bool -> unit
  val request_avatar_autosetup_async : string -> string -> (unit -> unit) -> Instance.t
  val serialize_instances : Instance.t list -> string
end
and StudioAttachment : sig
  type t = {
    auto_hide_parent : bool;
    is_arrow_visible : bool;
    offset : vector2;
    source_anchor_point : vector2;
    target_anchor_point : vector2;
  }
end
and StudioCallout : sig
  type t = {
    anchor_point : vector2;
    is_arrow_visible : bool;
    is_next_visible : bool;
    row_name : string;
    text : string;
    title : string;
  }
  val set_on_next_clicked : (unit -> unit) -> unit
end
and StudioData : sig
  type t = {
    enable_script_collab_by_default_on_load : bool;
  }
end
and StudioDeviceEmulatorService : sig
  type t = {
    has_multi_touch_started : bool;
    is_multi_touch_emulation_on : bool;
    is_multi_touch_enabled : bool;
    pivot_position : vector2;
  }
  val get_max_num_touches : unit -> int
  val get_touch_in_bounds : int -> bool
  val get_touch_position : int -> vector2
  val emulate_pc_device_with_resolution : string -> vector2 -> bool
  val get_current_device_id : unit -> string
  val get_current_orientation : unit -> screen_orientation
  val has_device_with_id : string -> bool
  val set_current_device_id : string -> unit
  val set_current_orientation : screen_orientation -> unit
end
and StudioObjectBase : sig
  type t
end
and StudioWidget : sig
  type t
  val set_fixed_size : int -> int -> unit
end
and StudioPublishService : sig
  type t = {
    publish_locked : bool;
  }
  val clear_upload_names : unit -> unit
  val publish_as : int -> int -> int -> bool -> 'a -> unit
  val publish_then_turn_on_team_create : unit -> unit
  val refresh_document_display_name : unit -> unit
  val set_team_create_on_publish_info : bool -> string -> unit
  val set_universe_display_name : string -> unit
  val set_upload_names : string -> string -> unit
  val show_save_or_publish_place_to_roblox : bool -> bool -> studio_close_mode -> unit
end
and StudioScriptDebugEventListener : sig
  type t
end
and StudioSdkService : sig
  type t
  val get_sdk : unit -> Instance.t
  val set_sdk : Instance.t -> unit
end
and StudioService : sig
  type t = {
    active_script : Instance.t;
    align_dragged_objects : bool;
    dragger_solve_constraints : bool;
    grid_size : float;
    hover_instance : Instance.t;
    installed_plugin_data : string;
    pivot_snap_to_geometry : bool;
    rotate_increment : float;
    show_constraint_details : bool;
    studio_locale_id : string;
    use_local_space : bool;
  }
  val animation_id_selected : int -> unit
  val copy_to_clipboard : string -> unit
  val get_badge_configure_url : int -> string
  val get_badge_upload_url : unit -> string
  val get_class_icon : string -> (string * 'a) list
  val get_place_is_persisted_to_cloud : unit -> bool
  val get_resource_by_category : string -> (string * 'a) list
  val get_startup_asset_id : unit -> string
  val get_startup_plugin_id : unit -> string
  val get_terms_of_use_url : unit -> string
  val get_user_id : unit -> int
  val gizmo_raycast : vector3 -> vector3 -> raycast_params -> raycast_result
  val has_internal_permission : unit -> bool
  val is_plugin_installed : int -> bool
  val is_plugin_up_to_date : int -> int -> bool
  val open_in_browser_donotuse : string -> unit
  val request_close : studio_close_mode -> unit
  val set_plugin_enabled : int -> bool -> unit
  val show_place_version_history_dialog : int -> unit
  val show_publish_to_roblox : unit -> unit
  val uninstall_plugin : int -> unit
  val update_plugin_management : unit -> unit
  val prompt_import_file : 'a list -> Instance.t
  val prompt_import_files : 'a list -> Instance.t list
  val try_install_plugin : int -> int -> unit
end
and StudioTheme : sig
  type t
  val get_color : studio_style_guide_color -> studio_style_guide_modifier -> color3
end
and StudioWidgetsService : sig
  type t
  val apply_fill_in_box : StudioWidget.t -> unit
  val apply_highlight : StudioWidget.t -> string option -> unit
  val apply_shadows : unit -> unit
  val apply_spotlight : StudioWidget.t -> string option -> unit
  val attach_plugin_gui : StudioWidget.t -> PluginGui.t -> StudioAttachment.t -> unit
  val get_widget_from_label : string -> StudioWidget.t
  val get_widget_from_plugin_gui : PluginGui.t -> StudioWidget.t
  val hide_spotlight : unit -> unit
end
and StyleBase : sig
  type t
  val get_style_rules : unit -> Instance.t list
  val insert_style_rule : StyleRule.t -> int option -> unit
  val set_style_rules : Instance.t list -> unit
end
and StyleRule : sig
  type t = {
    selector : string;
    selector_error : string;
  }
  val get_properties : unit -> (string * 'a) list
  val get_properties_resolved : unit -> (string * 'a) list
  val get_property : string -> 'a
  val get_property_resolved : string -> 'a
  val set_properties : (string * 'a) list -> unit
  val set_property : string -> 'a -> unit
end
and StyleSheet : sig
  type t
  val get_derives : unit -> Instance.t list
  val set_derives : Instance.t list -> unit
end
and StyleDerive : sig
  type t = {
    style_sheet : StyleSheet.t;
  }
end
and StyleLink : sig
  type t = {
    style_sheet : StyleSheet.t;
  }
end
and StylingService : sig
  type t
  val get_applied_styles : Instance.t -> 'a list
  val get_style_info : StyleRule.t -> (string * 'a) list
  val get_style_sheet_derives_chain : StyleSheet.t -> Instance.t list
  val get_style_sheet_info : StyleSheet.t -> (string * 'a) list
end
and SurfaceAppearance : sig
  type t = {
    alpha_mode : alpha_mode;
    color_map : string;
    metalness_map : string;
    normal_map : string;
    roughness_map : string;
    texture_pack : string;
  }
end
and TaskScheduler : sig
  type t = {
    scheduler_duty_cycle : float;
    scheduler_rate : float;
    thread_pool_config : thread_pool_config;
    thread_pool_size : int;
  }
end
and Team : sig
  type t = {
    auto_assignable : bool;
    child_order : int;
    team_color : brick_color;
  }
  val get_players : unit -> Instance.t list
end
and TeamCreateData : sig
  type t
end
and TeamCreatePublishService : sig
  type t
end
and TeamCreateService : sig
  type t
  val close_game_if_user_doesnt_have_perms : unit -> unit
end
and Teams : sig
  type t
  val get_teams : unit -> Instance.t list
end
and TeleportAsyncResult : sig
  type t = {
    private_server_id : string;
    reserved_server_access_code : string;
  }
end
and TeleportOptions : sig
  type t = {
    reserved_server_access_code : string;
    server_instance_id : string;
    should_reserve_server : bool;
  }
  val get_teleport_data : unit -> 'a
  val set_teleport_data : 'a -> unit
end
and TeleportService : sig
  type t
  val block : unit -> unit
  val get_arriving_teleport_gui : unit -> Instance.t
  val get_local_player_teleport_data : unit -> 'a
  val get_teleport_setting : string -> 'a
  val set_teleport_gui : Instance.t -> unit
  val set_teleport_setting : string -> 'a -> unit
  val teleport : int -> Instance.t -> 'a -> Instance.t -> unit
  val teleport_cancel : unit -> unit
  val teleport_to_place_instance : int -> string -> Instance.t -> string -> 'a -> Instance.t -> unit
  val teleport_to_private_server : int -> string -> Instance.t list -> string -> 'a -> Instance.t -> unit
  val teleport_to_spawn_by_name : int -> string -> Instance.t -> 'a -> Instance.t -> unit
  val get_player_place_instance_async : int -> 'a list
  val reserve_server : int -> 'a list
  val teleport_async : int -> Instance.t list -> Instance.t -> Instance.t
  val teleport_party_async : int -> Instance.t list -> 'a -> Instance.t -> string
  val unblock_async : unit -> 'a list
end
and TemporaryCageMeshProvider : sig
  type t
end
and TemporaryScriptService : sig
  type t
end
and TerrainDetail : sig
  type t = {
    color_map : string;
    face : terrain_face;
    material_pattern : material_pattern;
    metalness_map : string;
    normal_map : string;
    roughness_map : string;
    studs_per_tile : float;
  }
end
and TerrainRegion : sig
  type t = {
    size_in_cells : vector3;
  }
  val apply_transform : cframe -> vector3 -> unit
  val apply_transform_subregion : cframe -> vector3 -> region_3_int_16 -> t
  val get_region_wireframe : unit -> 'a list
end
and TestService : sig
  type t = {
    auto_runs : bool;
    description : string;
    error_count : int;
    execute_with_studio_run : bool;
    is_30_fps_throttle_enabled : bool;
    is_physics_environmental_throttled : bool;
    is_sleep_allowed : bool;
    number_of_players : int;
    simulate_seconds_lag : float;
    test_count : int;
    timeout : float;
    warn_count : int;
  }
  val check : bool -> string -> Instance.t -> int -> unit
  val checkpoint : string -> Instance.t -> int -> unit
  val done : unit -> unit
  val error : string -> Instance.t -> int -> unit
  val fail : string -> Instance.t -> int -> unit
  val message : string -> Instance.t -> int -> unit
  val require : bool -> string -> Instance.t -> int -> unit
  val scope_time : unit -> (string * 'a) list
  val warn : bool -> string -> Instance.t -> int -> unit
  val is_feature_enabled : string -> bool
  val run : unit -> unit
end
and TextBoxService : sig
  type t
end
and TextChannel : sig
  type t
  val display_system_message : string -> string -> TextChatMessage.t
  val add_user_async : int -> 'a list
  val send_async : string -> string -> TextChatMessage.t
end
and TextChatCommand : sig
  type t = {
    autocomplete_visible : bool;
    enabled : bool;
    primary_alias : string;
    secondary_alias : string;
  }
end
and TextChatConfigurations : sig
  type t
end
and BubbleChatConfiguration : sig
  type t = {
    adornee_name : string;
    background_color_3 : color3;
    background_transparency : float;
    bubble_duration : float;
    bubbles_spacing : float;
    enabled : bool;
    font : font;
    font_face : font;
    local_player_studs_offset : vector3;
    max_bubbles : float;
    max_distance : float;
    minimize_distance : float;
    tail_visible : bool;
    text_color_3 : color3;
    text_size : int;
    vertical_studs_offset : float;
  }
end
and ChatInputBarConfiguration : sig
  type t = {
    absolute_position : vector2;
    absolute_position_write : vector2;
    absolute_size : vector2;
    absolute_size_write : vector2;
    autocomplete_enabled : bool;
    background_color_3 : color3;
    background_transparency : float;
    enabled : bool;
    font_face : font;
    is_focused : bool;
    is_focused_write : bool;
    keyboard_key_code : key_code;
    placeholder_color_3 : color3;
    target_text_channel : TextChannel.t;
    text_box : TextBox.t;
    text_color_3 : color3;
    text_size : int;
    text_stroke_color_3 : color3;
    text_stroke_transparency : float;
  }
end
and ChatWindowConfiguration : sig
  type t = {
    absolute_position : vector2;
    absolute_position_write : vector2;
    absolute_size : vector2;
    absolute_size_write : vector2;
    background_color_3 : color3;
    background_transparency : float;
    enabled : bool;
    font_face : font;
    height_scale : float;
    horizontal_alignment : horizontal_alignment;
    text_color_3 : color3;
    text_size : int;
    text_stroke_color_3 : color3;
    text_stroke_transparency : float;
    vertical_alignment : vertical_alignment;
    width_scale : float;
  }
end
and TextChatMessage : sig
  type t = {
    bubble_chat_message_properties : BubbleChatMessageProperties.t;
    message_id : string;
    metadata : string;
    prefix_text : string;
    status : text_chat_message_status;
    text : string;
    text_channel : TextChannel.t;
    text_source : TextSource.t;
    timestamp : date_time;
    translation : string;
  }
end
and TextChatMessageProperties : sig
  type t = {
    prefix_text : string;
    text : string;
    translation : string;
  }
end
and TextChatService : sig
  type t = {
    chat_translation_enabled : bool;
    chat_translation_ftux_shown : bool;
    chat_translation_toggle_enabled : bool;
    chat_version : chat_version;
    create_default_commands : bool;
    create_default_text_channels : bool;
  }
  val display_bubble : Instance.t -> string -> unit
  val can_user_chat_async : int -> bool
  val can_users_chat_async : int -> int -> bool
end
and TextFilterResult : sig
  type t
  val get_chat_for_user_async : int -> string
  val get_non_chat_string_for_broadcast_async : unit -> string
  val get_non_chat_string_for_user_async : int -> string
end
and TextFilterTranslatedResult : sig
  type t = {
    source_language : string;
    source_text : TextFilterResult.t;
  }
  val get_translation_for_locale : string -> TextFilterResult.t
  val get_translations : unit -> (string * 'a) list
end
and TextService : sig
  type t
  val get_font_memory_data : unit -> (string * 'a) list
  val get_text_size : string -> int -> font -> vector2 -> vector2
  val set_resolution_scale : float -> unit
  val filter_and_translate_string_async : string -> int -> 'a list -> text_filter_context -> Instance.t
  val filter_string_async : string -> int -> text_filter_context -> Instance.t
  val get_family_info_async : string -> (string * 'a) list
  val get_text_bounds_async : GetTextBoundsParams.t -> vector2
end
and TextSource : sig
  type t = {
    can_send : bool;
    user_id : int;
  }
end
and TextureGenerationMeshHandler : sig
  type t
  val prepare_instances_for_texturing_async : Instance.t list -> texture_generation_mesh_handler_unwrap_mode -> string
end
and ThirdPartyUserService : sig
  type t
  val get_user_platform_id : unit -> string
  val get_user_platform_name : unit -> string
  val have_active_user : unit -> bool
  val is_over_13 : unit -> bool
  val return_to_engagement : unit -> unit
  val show_account_picker : unit -> unit
  val register_active_user : user_input_type -> int
end
and ThreadState : sig
  type t = {
    frame_count : int;
    populated : bool;
    thread_id : int;
    thread_name : string;
  }
  val get_frame : int -> Instance.t
end
and TimerService : sig
  type t
end
and ToastNotificationService : sig
  type t
  val hide_notification : string -> unit
  val show_notification : string -> string -> unit
end
and TouchInputService : sig
  type t
end
and TouchTransmitter : sig
  type t
end
and TracerService : sig
  type t
  val finish_span : string -> unit
  val start_span : string -> string -> string
end
and TrackerLodController : sig
  type t = {
    audio_mode : tracker_lod_flag_mode;
    video_extrapolation_mode : tracker_extrapolation_flag_mode;
    video_lod_mode : tracker_lod_value_mode;
    video_mode : tracker_lod_flag_mode;
  }
  val get_extrapolation : unit -> int
  val get_video_lod : unit -> int
  val is_audio_enabled : unit -> bool
  val is_video_enabled : unit -> bool
end
and TrackerStreamAnimation : sig
  type t
end
and Trail : sig
  type t = {
    attachment_0 : Attachment.t;
    attachment_1 : Attachment.t;
    brightness : float;
    color : color_sequence;
    enabled : bool;
    face_camera : bool;
    lifetime : float;
    light_emission : float;
    light_influence : float;
    max_length : float;
    min_length : float;
    texture : string;
    texture_length : float;
    texture_mode : texture_mode;
    transparency : number_sequence;
    width_scale : number_sequence;
  }
  val clear : unit -> unit
end
and Translator : sig
  type t = {
    locale_id : string;
  }
  val format_by_key : string -> 'a -> string
  val roblox_only_translate : Instance.t -> string -> string
  val translate : Instance.t -> string -> string
end
and TutorialService : sig
  type t
  val get_main_view_session_id : unit -> string
  val get_studio_widget_from_label : string -> StudioWidget.t
  val get_tutorial_id_to_launch : unit -> string
  val has_user_completed_tutorial : unit -> bool
  val hide_widgets : string -> bool
  val prompt_close_place : unit -> unit
  val set_tutorial_completion_status : bool -> unit
  val should_launch_tutorial : unit -> bool
  val show_widgets : string -> bool
end
and TweenBase : sig
  type t = {
    playback_state : playback_state;
  }
  val cancel : unit -> unit
  val pause : unit -> unit
  val play : unit -> unit
end
and Tween : sig
  type t = {
    instance : Instance.t;
    tween_info : tween_info;
  }
end
and TweenService : sig
  type t
  val create : Instance.t -> tween_info -> (string * 'a) list -> Tween.t
  val get_value : float -> easing_style -> easing_direction -> float
end
and UGCAvatarService : sig
  type t
end
and UGCValidationService : sig
  type t
  val calculate_editable_mesh_unique_uv_count : EditableMesh.t -> int
  val check_editable_mesh_in_camera_frustum : EditableMesh.t -> vector3 -> cframe -> cframe -> bool
  val get_dynamic_head_editable_mesh_inactive_controls : EditableMesh.t -> 'a list -> 'a list
  val get_editable_image_size : EditableImage.t -> vector2
  val get_editable_mesh_tri_count : EditableMesh.t -> int
  val get_editable_mesh_vert_colors : EditableMesh.t -> 'a list
  val get_editable_mesh_verts : EditableMesh.t -> 'a list
  val get_property_value : Instance.t -> string -> 'a
  val register_ugc_validation_function : (unit -> unit) -> unit
  val reset_collision_fidelity : Instance.t -> collision_fidelity -> unit
  val set_mesh_id_blocking : Instance.t -> string -> unit
  val validate_dynamic_head_editable_mesh : EditableMesh.t -> bool
  val validate_editable_image_num_texture_channels : EditableImage.t -> int -> bool
  val validate_editable_image_size : EditableImage.t -> bool
  val validate_editable_mesh_bounds : EditableMesh.t -> vector3 -> vector3 -> cframe -> cframe -> bool
  val validate_editable_mesh_cage_mesh_intersection : EditableMesh.t -> EditableMesh.t -> EditableMesh.t -> 'a list
  val validate_editable_mesh_cage_non_manifold_and_holes : EditableMesh.t -> 'a list
  val validate_editable_mesh_cage_uv_triangle_area : EditableMesh.t -> bool
  val validate_editable_mesh_full_body_cage_deletion : EditableMesh.t -> bool
  val validate_editable_mesh_mis_match_uv : EditableMesh.t -> EditableMesh.t -> bool
  val validate_editable_mesh_overlapping_vertices : EditableMesh.t -> bool
  val validate_editable_mesh_triangle_area : EditableMesh.t -> bool
  val validate_editable_mesh_triangles : EditableMesh.t -> bool
  val validate_editable_mesh_uv_space : EditableMesh.t -> bool
  val validate_editable_mesh_uv_values_in_reference : 'a list -> EditableMesh.t -> bool
  val validate_editable_mesh_unique_uv_count : EditableMesh.t -> int -> bool
  val validate_editable_mesh_vert_colors : EditableMesh.t -> bool -> bool
  val validate_skinned_editable_mesh : EditableMesh.t -> bool
  val calculate_unique_uv_count : string -> int
  val can_load_asset : string -> bool
  val check_mesh_in_camera_frustum : string -> vector3 -> cframe -> cframe -> bool
  val compare_texture_overlap_byte_string : string -> string -> 'a list
  val compare_texture_overlap_texture_id : string -> string -> 'a list
  val fetch_asset_with_format : string -> string -> Instance.t list
  val get_dynamic_head_mesh_inactive_controls : string -> 'a list -> 'a list
  val get_mesh_tri_count : string -> int
  val get_mesh_vert_colors : string -> 'a list
  val get_mesh_verts : string -> 'a list
  val get_texture_size : string -> vector2
  val validate_cage_mesh_intersection : string -> string -> string -> 'a list
  val validate_cage_non_manifold_and_holes : string -> 'a list
  val validate_cage_uv_triangle_area : string -> bool
  val validate_dynamic_head_mesh : string -> bool
  val validate_full_body_cage_deletion : string -> bool
  val validate_image_transparency_threshold_byte_string : string -> float -> bool
  val validate_image_transparency_threshold_texture_id : string -> float -> bool
  val validate_mesh_bounds : string -> vector3 -> vector3 -> cframe -> cframe -> bool
  val validate_mesh_triangle_area : string -> bool
  val validate_mesh_triangles : string -> bool
  val validate_mesh_vert_colors : string -> bool -> bool
  val validate_mis_match_uv : string -> string -> bool
  val validate_num_texture_channels : string -> int -> bool
  val validate_overlapping_vertices : string -> bool
  val validate_skinned_mesh : string -> bool
  val validate_texture_alpha : string -> int -> bool
  val validate_texture_alpha_byte_string : string -> int -> bool
  val validate_texture_size : string -> bool
  val validate_uv_space : string -> bool
  val validate_uv_values_in_reference : 'a list -> string -> bool
  val validate_unique_uv_count : string -> int -> bool
end
and UIBase : sig
  type t
end
and UIComponent : sig
  type t
end
and UIConstraint : sig
  type t
end
and UIAspectRatioConstraint : sig
  type t = {
    aspect_ratio : float;
    aspect_type : aspect_type;
    dominant_axis : dominant_axis;
  }
end
and UISizeConstraint : sig
  type t = {
    max_size : vector2;
    min_size : vector2;
  }
end
and UITextSizeConstraint : sig
  type t = {
    max_text_size : int;
    min_text_size : int;
  }
end
and UICorner : sig
  type t = {
    corner_radius : u_dim;
  }
end
and UIFlexItem : sig
  type t = {
    flex_mode : ui_flex_mode;
    grow_ratio : float;
    item_line_alignment : item_line_alignment;
    shrink_ratio : float;
  }
end
and UIGradient : sig
  type t = {
    color : color_sequence;
    enabled : bool;
    offset : vector2;
    rotation : float;
    transparency : number_sequence;
  }
end
and UILayout : sig
  type t
end
and UIGridStyleLayout : sig
  type t = {
    absolute_content_size : vector2;
    fill_direction : fill_direction;
    horizontal_alignment : horizontal_alignment;
    sort_order : sort_order;
    vertical_alignment : vertical_alignment;
  }
end
and UIGridLayout : sig
  type t = {
    absolute_cell_count : vector2;
    absolute_cell_size : vector2;
    cell_padding : u_dim_2;
    cell_size : u_dim_2;
    fill_direction_max_cells : int;
    start_corner : start_corner;
  }
end
and UIListLayout : sig
  type t = {
    horizontal_flex : ui_flex_alignment;
    item_line_alignment : item_line_alignment;
    padding : u_dim;
    vertical_flex : ui_flex_alignment;
    wraps : bool;
  }
end
and UIPageLayout : sig
  type t = {
    animated : bool;
    circular : bool;
    current_page : GuiObject.t;
    easing_direction : easing_direction;
    easing_style : easing_style;
    gamepad_input_enabled : bool;
    padding : u_dim;
    scroll_wheel_input_enabled : bool;
    touch_input_enabled : bool;
    tween_time : float;
  }
  val jump_to : Instance.t -> unit
  val jump_to_index : int -> unit
  val next : unit -> unit
  val previous : unit -> unit
end
and UITableLayout : sig
  type t = {
    fill_empty_space_columns : bool;
    fill_empty_space_rows : bool;
    major_axis : table_major_axis;
    padding : u_dim_2;
  }
end
and UIPadding : sig
  type t = {
    padding_bottom : u_dim;
    padding_left : u_dim;
    padding_right : u_dim;
    padding_top : u_dim;
  }
end
and UIScale : sig
  type t = {
    scale : float;
  }
end
and UIStroke : sig
  type t = {
    apply_stroke_mode : apply_stroke_mode;
    color : color3;
    enabled : bool;
    line_join_mode : line_join_mode;
    thickness : float;
    transparency : float;
  }
end
and UnvalidatedAssetService : sig
  type t
  val append_temp_asset_id : int -> int -> vector3 -> vector3 -> string -> unit
  val append_vantage_point : int -> int -> vector3 -> vector3 -> bool
  val upgrade_temp_asset_id : int -> int -> int -> bool
end
and UserGameSettings : sig
  type t = {
    all_tutorials_disabled : bool;
    camera_mode : custom_camera_mode;
    camera_y_inverted : bool;
    chat_translation_enabled : bool;
    chat_translation_ftux_shown : bool;
    chat_translation_toggle_enabled : bool;
    chat_visible : bool;
    computer_camera_movement_mode : computer_camera_movement_mode;
    computer_movement_mode : computer_movement_mode;
    control_mode : control_mode;
    default_camera_id : string;
    fullscreen : bool;
    gamepad_camera_sensitivity : float;
    graphics_quality_level : int;
    has_ever_used_vr : bool;
    is_using_camera_y_inverted : bool;
    is_using_gamepad_camera_sensitivity : bool;
    master_volume : float;
    micro_profiler_web_server_enabled : bool;
    micro_profiler_web_server_ip : string;
    micro_profiler_web_server_port : int;
    mouse_sensitivity : float;
    mouse_sensitivity_first_person : vector2;
    mouse_sensitivity_third_person : vector2;
    on_screen_profiler_enabled : bool;
    onboardings_completed : string;
    performance_stats_visible : bool;
    player_height : float;
    preferred_transparency : float;
    rcc_profiler_record_frame_rate : int;
    rcc_profiler_record_time_frame : int;
    reduced_motion : bool;
    rotation_type : rotation_type;
    saved_quality_level : saved_quality_setting;
    start_maximized : bool;
    start_screen_position : vector2;
    start_screen_size : vector2;
    touch_camera_movement_mode : touch_camera_movement_mode;
    touch_movement_mode : touch_movement_mode;
    ui_navigation_key_bind_enabled : bool;
    used_core_gui_is_visible_toggle : bool;
    used_custom_gui_is_visible_toggle : bool;
    used_hide_hud_shortcut : bool;
    vr_comfort_setting : vr_comfort_setting;
    vr_enabled : bool;
    vr_rotation_intensity : int;
    vr_safety_bubble_mode : vr_safety_bubble_mode;
    vr_smooth_rotation_enabled : bool;
    vr_smooth_rotation_enabled_custom_option : bool;
    vr_third_person_follow_cam_enabled : bool;
    vr_third_person_follow_cam_enabled_custom_option : bool;
    vignette_enabled : bool;
    vignette_enabled_custom_option : bool;
  }
  val get_camera_y_invert_value : unit -> int
  val get_onboarding_completed : string -> bool
  val get_tutorial_state : string -> bool
  val in_full_screen : unit -> bool
  val in_studio_mode : unit -> bool
  val reset_onboarding_completed : string -> unit
  val set_camera_y_invert_visible : unit -> unit
  val set_gamepad_camera_sensitivity_visible : unit -> unit
  val set_onboarding_completed : string -> unit
  val set_tutorial_state : string -> bool -> unit
end
and UserInputService : sig
  type t = {
    accelerometer_enabled : bool;
    bottom_bar_size : vector2;
    gamepad_enabled : bool;
    gyroscope_enabled : bool;
    keyboard_enabled : bool;
    legacy_input_events_enabled : bool;
    mouse_behavior : mouse_behavior;
    mouse_delta_sensitivity : float;
    mouse_enabled : bool;
    mouse_icon : string;
    mouse_icon_enabled : bool;
    nav_bar_size : vector2;
    on_screen_keyboard_animation_duration : float;
    on_screen_keyboard_position : vector2;
    on_screen_keyboard_size : vector2;
    on_screen_keyboard_visible : bool;
    override_mouse_icon_behavior : override_mouse_icon_behavior;
    right_bar_size : vector2;
    status_bar_size : vector2;
    touch_enabled : bool;
    vr_enabled : bool;
  }
  val gamepad_supports : user_input_type -> key_code -> bool
  val get_connected_gamepads : unit -> 'a list
  val get_device_acceleration : unit -> InputObject.t
  val get_device_gravity : unit -> InputObject.t
  val get_device_rotation : unit -> 'a list
  val get_device_type : unit -> device_type
  val get_focused_text_box : unit -> TextBox.t
  val get_gamepad_connected : user_input_type -> bool
  val get_gamepad_state : user_input_type -> 'a list
  val get_image_for_key_code : key_code -> string
  val get_keys_pressed : unit -> 'a list
  val get_last_input_type : unit -> user_input_type
  val get_mouse_buttons_pressed : unit -> 'a list
  val get_mouse_delta : unit -> vector2
  val get_mouse_location : unit -> vector2
  val get_navigation_gamepads : unit -> 'a list
  val get_platform : unit -> platform
  val get_string_for_key_code : key_code -> string
  val get_supported_gamepad_key_codes : user_input_type -> 'a list
  val is_gamepad_button_down : user_input_type -> key_code -> bool
  val is_key_down : key_code -> bool
  val is_mouse_button_pressed : user_input_type -> bool
  val is_navigation_gamepad : user_input_type -> bool
  val recenter_user_head_c_frame : unit -> unit
  val send_app_ui_sizes : vector2 -> vector2 -> vector2 -> vector2 -> unit
  val set_navigation_gamepad : user_input_type -> bool -> unit
end
and UserNotification : sig
  type t = {
    id : string;
    payload : UserNotificationPayload.t;
  }
end
and UserNotificationPayload : sig
  type t = {
    analytics_data : UserNotificationPayloadAnalyticsData.t;
    join_experience : UserNotificationPayloadJoinExperience.t;
    message_id : string;
    type : string;
  }
  val get_parameters : unit -> 'a
  val set_parameters : 'a -> unit
end
and UserNotificationPayloadAnalyticsData : sig
  type t = {
    category : string;
  }
end
and UserNotificationPayloadJoinExperience : sig
  type t = {
    launch_data : string;
  }
end
and UserNotificationPayloadParameterValue : sig
  type t = {
    int_64_value : int;
    string_value : string;
  }
end
and UserService : sig
  type t
  val get_user_infos_by_user_ids_async : 'a list -> 'a list
end
and VRService : sig
  type t = {
    automatic_scaling : vr_scaling;
    did_pointer_hit : bool;
    fade_out_view_on_collision : bool;
    gui_input_user_c_frame : user_c_frame;
    laser_distance : float;
    pointer_hit_c_frame : cframe;
    quest_asw_state : bool;
    quest_display_refresh_rate : float;
    third_person_follow_cam_enabled : bool;
    vr_device_available : bool;
    vr_device_name : string;
    vr_enabled : bool;
    vr_session_state : vr_session_state;
  }
  val get_touchpad_mode : vr_touchpad -> vr_touchpad_mode
  val get_user_c_frame : user_c_frame -> cframe
  val get_user_c_frame_enabled : user_c_frame -> bool
  val is_maquettes : unit -> bool
  val is_vr_app_build : unit -> bool
  val recenter_user_head_c_frame : unit -> unit
  val request_navigation : cframe -> user_c_frame -> unit
  val set_touchpad_mode : vr_touchpad -> vr_touchpad_mode -> unit
end
and VRStatusService : sig
  type t
end
and ValueBase : sig
  type t
end
and BinaryStringValue : sig
  type t
end
and BoolValue : sig
  type t = {
    value : bool;
  }
end
and BrickColorValue : sig
  type t = {
    value : brick_color;
  }
end
and CFrameValue : sig
  type t = {
    value : cframe;
  }
end
and Color3Value : sig
  type t = {
    value : color3;
  }
end
and DoubleConstrainedValue : sig
  type t = {
    constrained_value : float;
    max_value : float;
    min_value : float;
    value : float;
  }
end
and IntConstrainedValue : sig
  type t = {
    constrained_value : int;
    max_value : int;
    min_value : int;
    value : int;
  }
end
and IntValue : sig
  type t = {
    value : int;
  }
end
and NumberValue : sig
  type t = {
    value : float;
  }
end
and ObjectValue : sig
  type t = {
    value : Instance.t;
  }
end
and RayValue : sig
  type t = {
    value : ray;
  }
end
and StringValue : sig
  type t = {
    value : string;
  }
end
and Vector3Value : sig
  type t = {
    value : vector3;
  }
end
and Vector3Curve : sig
  type t
  val get_value_at_time : float -> 'a list
  val x : unit -> FloatCurve.t
  val y : unit -> FloatCurve.t
  val z : unit -> FloatCurve.t
end
and VersionControlService : sig
  type t = {
    script_collab_enabled : bool;
  }
end
and VideoCaptureService : sig
  type t = {
    active : bool;
    camera_id : string;
  }
  val get_camera_devices : unit -> (string * 'a) list
end
and VideoService : sig
  type t
end
and VirtualInputManager : sig
  type t = {
    additional_lua_state : string;
  }
  val dump : unit -> unit
  val handle_gamepad_axis_input : int -> key_code -> float -> float -> float -> unit
  val handle_gamepad_button_input : int -> key_code -> int -> unit
  val handle_gamepad_connect : int -> unit
  val handle_gamepad_disconnect : int -> unit
  val send_accelerometer_event : float -> float -> float -> unit
  val send_gravity_event : float -> float -> float -> unit
  val send_gyroscope_event : float -> float -> float -> float -> unit
  val send_key_event : bool -> key_code -> bool -> Instance.t -> unit
  val send_mouse_button_event : int -> int -> int -> bool -> Instance.t -> int -> unit
  val send_mouse_move_event : float -> float -> Instance.t -> unit
  val send_mouse_wheel_event : float -> float -> bool -> Instance.t -> unit
  val send_text_input_character_event : string -> Instance.t -> unit
  val send_touch_event : int -> int -> float -> float -> unit
  val set_input_types_to_ignore : 'a -> unit
  val start_playing : string -> unit
  val start_playing_json : string -> unit
  val start_recording : unit -> unit
  val stop_playing : unit -> unit
  val stop_recording : unit -> unit
  val send_roblox_event : string -> string -> string -> unit
  val send_theme_change_event : string -> unit
  val wait_for_input_events_processed : unit -> unit
end
and VirtualUser : sig
  type t
  val button_1_down : vector2 -> cframe -> unit
  val button_1_up : vector2 -> cframe -> unit
  val button_2_down : vector2 -> cframe -> unit
  val button_2_up : vector2 -> cframe -> unit
  val capture_controller : unit -> unit
  val click_button_1 : vector2 -> cframe -> unit
  val click_button_2 : vector2 -> cframe -> unit
  val move_mouse : vector2 -> cframe -> unit
  val set_key_down : string -> unit
  val set_key_up : string -> unit
  val start_recording : unit -> unit
  val stop_recording : unit -> string
  val type_key : string -> unit
end
and VisibilityCheckDispatcher : sig
  type t
end
and VisibilityService : sig
  type t
end
and Visit : sig
  type t
end
and VoiceChatInternal : sig
  type t
  val get_channel_id : unit -> string
  val get_group_id : unit -> string
  val get_session_id : unit -> string
  val get_voice_experience_id : unit -> string
  val is_context_voice_enabled : unit -> bool
  val log_publisher_web_rtc_stats : unit -> bool
  val log_subscription_web_rtc_stats : unit -> bool
  val subscribe_block : int -> bool
  val subscribe_retry : int -> bool
  val subscribe_unblock : int -> bool
  val is_voice_enabled_for_user_id_async : int -> bool
end
and VoiceChatService : sig
  type t = {
    enable_default_voice : bool;
    use_audio_api : audio_api_rollout;
    use_new_audio_api : bool;
    use_new_control_paths : bool;
    use_new_join_flow : bool;
    voice_chat_enabled_for_place_on_rcc : bool;
    voice_chat_enabled_for_universe_on_rcc : bool;
  }
  val is_voice_enabled_for_user_id_async : int -> bool
end
and WeldConstraint : sig
  type t = {
    active : bool;
    enabled : bool;
    part_0 : BasePart.t;
    part_1 : BasePart.t;
  }
end
and Wire : sig
  type t = {
    connected : bool;
    source_instance : Instance.t;
    source_name : string;
    target_instance : Instance.t;
    target_name : string;
  }
end
