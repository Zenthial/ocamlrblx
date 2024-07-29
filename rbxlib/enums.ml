type access_modifier_type =
  | Allow
  | Deny

type accessory_type =
  | Unknown
  | Hat
  | Hair
  | Face
  | Neck
  | Shoulder
  | Front
  | Back
  | Waist
  | TShirt
  | Shirt
  | Pants
  | Jacket
  | Sweater
  | Shorts
  | LeftShoe
  | RightShoe
  | DressSkirt
  | Eyebrow
  | Eyelash

type action_type =
  | Nothing
  | Pause
  | Lose
  | Draw
  | Win

type actuator_relative_to =
  | Attachment0
  | Attachment1
  | World

type actuator_type =
  | None
  | Motor
  | Servo

type ad_event_type =
  | VideoLoaded
  | VideoRemoved
  | UserCompletedVideo

type ad_shape =
  | HorizontalRectangle

type ad_teleport_method =
  | Undefined
  | PortalForward
  | InGameMenuBackButton
  | UiBackButton

type ad_unit_status =
  | Inactive
  | Active

type adorn_culling_mode =
  | Automatic
  | Never

type align_type =
  | PrimaryAxisParallel
  | PrimaryAxisPerpendicular
  | PrimaryAxisLookAt
  | AllAxes
  | Parallel
  | Perpendicular

type alpha_mode =
  | Overlay
  | Transparency

type analytics_economy_action =
  | Default
  | Acquire
  | Spend

type analytics_log_level =
  | Trace
  | Debug
  | Information
  | Warning
  | Error
  | Fatal

type analytics_progression_status =
  | Default
  | Begin
  | Complete
  | Abandon
  | Fail

type animation_clip_from_video_status =
  | Initializing
  | Pending
  | Processing
  | ErrorGeneric
  | Success
  | ErrorVideoTooLong
  | ErrorNoPersonDetected
  | ErrorVideoUnstable
  | Timeout
  | Cancelled
  | ErrorMultiplePeople
  | ErrorUploadingVideo

type animation_compositor_mode =
  | Default
  | Enabled
  | Disabled

type animation_priority =
  | Core
  | Idle
  | Movement
  | Action
  | Action2
  | Action3
  | Action4

type animator_retargeting_mode =
  | Default
  | Disabled
  | Enabled

type app_shell_action_type =
  | None
  | OpenApp
  | TapChatTab
  | TapConversationEntry
  | TapAvatarTab
  | ReadConversation
  | TapGamePageTab
  | TapHomePageTab
  | GamePageLoaded
  | HomePageLoaded
  | AvatarEditorPageLoaded

type app_shell_feature =
  | None
  | Chat
  | AvatarEditor
  | GamePage
  | HomePage
  | More
  | Landing

type app_update_status =
  | Unknown
  | NotSupported
  | Failed
  | NotAvailable
  | Available

type apply_stroke_mode =
  | Contextual
  | Border

type aspect_type =
  | FitWithinMaxSize
  | ScaleWithParentSize

type asset_creator_type =
  | User
  | Group

type asset_fetch_status =
  | Success
  | Failure
  | None
  | Loading
  | TimedOut

type asset_type =
  | Image
  | TShirt
  | Audio
  | Mesh
  | Lua
  | Hat
  | Place
  | Model
  | Shirt
  | Pants
  | Decal
  | Head
  | Face
  | Gear
  | Badge
  | Animation
  | Torso
  | RightArm
  | LeftArm
  | LeftLeg
  | RightLeg
  | Package
  | GamePass
  | Plugin
  | MeshPart
  | HairAccessory
  | FaceAccessory
  | NeckAccessory
  | ShoulderAccessory
  | FrontAccessory
  | BackAccessory
  | WaistAccessory
  | ClimbAnimation
  | DeathAnimation
  | FallAnimation
  | IdleAnimation
  | JumpAnimation
  | RunAnimation
  | SwimAnimation
  | WalkAnimation
  | PoseAnimation
  | EarAccessory
  | EyeAccessory
  | EmoteAnimation
  | Video
  | TShirtAccessory
  | ShirtAccessory
  | PantsAccessory
  | JacketAccessory
  | SweaterAccessory
  | ShortsAccessory
  | LeftShoeAccessory
  | RightShoeAccessory
  | DressSkirtAccessory
  | FontFamily
  | EyebrowAccessory
  | EyelashAccessory
  | MoodAnimation
  | DynamicHead

type asset_type_verification =
  | Default
  | ClientOnly
  | Always

type audio_api_rollout =
  | Disabled
  | Automatic
  | Enabled

type audio_sub_type =
  | Music
  | SoundEffect

type audio_window_size =
  | Small
  | Medium
  | Large

type auto_indent_rule =
  | Off
  | Absolute
  | Relative

type automatic_size =
  | None
  | X
  | Y
  | Xy

type avatar_asset_type =
  | TShirt
  | Hat
  | Shirt
  | Pants
  | Head
  | Face
  | Gear
  | Torso
  | RightArm
  | LeftArm
  | LeftLeg
  | RightLeg
  | HairAccessory
  | FaceAccessory
  | NeckAccessory
  | ShoulderAccessory
  | FrontAccessory
  | BackAccessory
  | WaistAccessory
  | ClimbAnimation
  | FallAnimation
  | IdleAnimation
  | JumpAnimation
  | RunAnimation
  | SwimAnimation
  | WalkAnimation
  | MoodAnimation
  | EmoteAnimation
  | TShirtAccessory
  | ShirtAccessory
  | PantsAccessory
  | JacketAccessory
  | SweaterAccessory
  | ShortsAccessory
  | LeftShoeAccessory
  | RightShoeAccessory
  | DressSkirtAccessory
  | EyebrowAccessory
  | EyelashAccessory
  | DynamicHead

type avatar_chat_service_feature =
  | None
  | UniverseAudio
  | UniverseVideo
  | PlaceAudio
  | PlaceVideo
  | UserAudioEligible
  | UserAudio
  | UserVideoEligible
  | UserVideo
  | UserBanned

type avatar_context_menu_option =
  | Friend
  | Chat
  | Emote
  | InspectMenu

type avatar_item_type =
  | Asset
  | Bundle

type avatar_joint_upgrade =
  | Default
  | Enabled
  | Disabled

type avatar_prompt_result =
  | Success
  | PermissionDenied
  | Failed

type avatar_thumbnail_customization_type =
  | Closeup
  | FullBody

type avatar_unification_mode =
  | Default
  | Disabled
  | Enabled

type axis =
  | X
  | Y
  | Z

type bin_type =
  | Script
  | GameTool
  | Grab
  | Clone
  | Hammer

type body_part =
  | Head
  | Torso
  | LeftArm
  | RightArm
  | LeftLeg
  | RightLeg

type body_part_r_15 =
  | Head
  | UpperTorso
  | LowerTorso
  | LeftFoot
  | LeftLowerLeg
  | LeftUpperLeg
  | RightFoot
  | RightLowerLeg
  | RightUpperLeg
  | LeftHand
  | LeftLowerArm
  | LeftUpperArm
  | RightHand
  | RightLowerArm
  | RightUpperArm
  | RootPart
  | Unknown

type border_mode =
  | Outline
  | Middle
  | Inset

type break_reason =
  | Other
  | Error
  | SpecialBreakpoint
  | UserBreakpoint

type breakpoint_remove_reason =
  | Requested
  | ScriptChanged
  | ScriptRemoved

type bulk_move_mode =
  | FireAllEvents
  | FireCFrameChanged

type bundle_type =
  | BodyParts
  | Animations
  | Shoes
  | DynamicHead
  | DynamicHeadAvatar

type button =
  | Jump
  | Dismount

type button_style =
  | Custom
  | RobloxButtonDefault
  | RobloxButton
  | RobloxRoundButton
  | RobloxRoundDefaultButton
  | RobloxRoundDropdownButton

type cage_type =
  | Inner
  | Outer

type camera_mode =
  | Classic
  | LockFirstPerson

type camera_pan_mode =
  | Classic
  | EdgeBump

type camera_speed_adjust_binding =
  | None
  | RmbScroll
  | AltScroll

type camera_type =
  | Fixed
  | Attach
  | Watch
  | Track
  | Follow
  | Custom
  | Scriptable
  | Orbital

type catalog_category_filter =
  | None
  | Featured
  | Collectibles
  | CommunityCreations
  | Premium
  | Recommended

type catalog_sort_aggregation =
  | Past12Hours
  | PastDay
  | Past3Days
  | PastWeek
  | PastMonth
  | AllTime

type catalog_sort_type =
  | Relevance
  | PriceHighToLow
  | PriceLowToHigh
  | MostFavorited
  | RecentlyCreated
  | Bestselling

type cell_block =
  | Solid
  | VerticalWedge
  | CornerWedge
  | InverseCornerWedge
  | HorizontalWedge

type cell_material =
  | Empty
  | Grass
  | Sand
  | Brick
  | Granite
  | Asphalt
  | Iron
  | Aluminum
  | Gold
  | WoodPlank
  | WoodLog
  | Gravel
  | CinderBlock
  | MossyStone
  | Cement
  | RedPlastic
  | BluePlastic
  | Water

type cell_orientation =
  | NegZ
  | X
  | Z
  | NegX

type center_dialog_type =
  | UnsolicitedDialog
  | PlayerInitiatedDialog
  | ModalDialog
  | QuitDialog

type character_control_mode =
  | Default
  | Legacy
  | NoCharacterController
  | LuaCharacterController

type chat_callback_type =
  | OnCreatingChatWindow
  | OnClientSendingMessage
  | OnClientFormattingMessage
  | OnServerReceivingMessage

type chat_color =
  | Blue
  | Green
  | Red
  | White

type chat_mode =
  | Menu
  | TextAndMenu

type chat_privacy_mode =
  | AllUsers
  | NoOne
  | Friends

type chat_style =
  | Classic
  | Bubble
  | ClassicAndBubble

type chat_version =
  | LegacyChatService
  | TextChatService

type client_animator_throttling_mode =
  | Default
  | Disabled
  | Enabled

type collaborator_status =
  | Editing3D
  | Scripting
  | PrivateScripting
  | None

type collision_fidelity =
  | Default
  | Hull
  | Box
  | PreciseConvexDecomposition

type command_permission =
  | Plugin
  | LocalUser

type compile_target =
  | Client
  | CoreScript
  | Studio
  | CoreScriptRaw

type completion_item_kind =
  | Text
  | Method
  | Function
  | Constructor
  | Field
  | Variable
  | Class
  | Interface
  | Module
  | Property
  | Unit
  | Value
  | Enum
  | Keyword
  | Snippet
  | Color
  | File
  | Reference
  | Folder
  | EnumMember
  | Constant
  | Struct
  | Event
  | Operator
  | TypeParameter

type completion_item_tag =
  | Deprecated
  | IncorrectIndexType
  | PluginPermissions
  | CommandLinePermissions
  | RobloxPermissions
  | AddParens
  | PutCursorInParens
  | TypeCorrect
  | ClientServerBoundaryViolation
  | Invalidated
  | PutCursorBeforeEnd

type completion_trigger_kind =
  | Invoked
  | TriggerCharacter
  | TriggerForIncompleteCompletions

type computer_camera_movement_mode =
  | Default
  | Classic
  | Follow
  | Orbital
  | CameraToggle

type computer_movement_mode =
  | Default
  | KeyboardMouse
  | ClickToMove

type connection_error =
  | Ok
  | Unknown
  | DisconnectErrors
  | DisconnectBadhash
  | DisconnectSecurityKeyMismatch
  | DisconnectProtocolMismatch
  | DisconnectReceivePacketError
  | DisconnectReceivePacketStreamError
  | DisconnectSendPacketError
  | DisconnectIllegalTeleport
  | DisconnectDuplicatePlayer
  | DisconnectDuplicateTicket
  | DisconnectTimeout
  | DisconnectLuaKick
  | DisconnectOnRemoteSysStats
  | DisconnectHashTimeout
  | DisconnectCloudEditKick
  | DisconnectPlayerless
  | DisconnectNewSecurityKeyMismatch
  | DisconnectEvicted
  | DisconnectDevMaintenance
  | DisconnectRobloxMaintenance
  | DisconnectRejoin
  | DisconnectConnectionLost
  | DisconnectIdle
  | DisconnectRaknetErrors
  | DisconnectWrongVersion
  | DisconnectBySecurityPolicy
  | DisconnectBlockedIp
  | DisconnectClientFailure
  | DisconnectClientRequest
  | DisconnectPrivateServerKickout
  | DisconnectModeratedGame
  | ServerShutdown
  | ReplicatorTimeout
  | PlayerRemoved
  | DisconnectOutOfMemoryKeepPlayingLeave
  | DisconnectRomarkEndOfTest
  | DisconnectCollaboratorPermissionRevoked
  | DisconnectCollaboratorUnderage
  | NetworkInternal
  | NetworkSend
  | NetworkTimeout
  | NetworkMisbehavior
  | NetworkSecurity
  | ReplacementReady
  | PlacelaunchErrors
  | PlacelaunchDisabled
  | PlacelaunchError
  | PlacelaunchGameEnded
  | PlacelaunchGameFull
  | PlacelaunchUserLeft
  | PlacelaunchRestricted
  | PlacelaunchUnauthorized
  | PlacelaunchFlooded
  | PlacelaunchHashExpired
  | PlacelaunchHashException
  | PlacelaunchPartyCannotFit
  | PlacelaunchHttpError
  | PlacelaunchUserPrivacyUnauthorized
  | PlacelaunchCustomMessage
  | PlacelaunchOtherError
  | TeleportErrors
  | TeleportFailure
  | TeleportGameNotFound
  | TeleportGameEnded
  | TeleportGameFull
  | TeleportUnauthorized
  | TeleportFlooded
  | TeleportIsTeleporting

type connection_state =
  | Connected
  | Disconnected

type context_action_priority =
  | Low
  | Medium
  | High

type context_action_result =
  | Sink
  | Pass

type control_mode =
  | Classic
  | MouseLockSwitch

type core_gui_type =
  | PlayerList
  | Health
  | Backpack
  | Chat
  | All
  | EmotesMenu
  | SelfView
  | Captures

type create_outfit_failure =
  | InvalidName
  | OutfitLimitReached
  | Other

type creator_type =
  | User
  | Group

type creator_type_filter =
  | User
  | Group
  | All

type currency_type =
  | Default
  | Robux
  | Tix

type custom_camera_mode =
  | Default
  | Classic
  | Follow

type data_store_request_type =
  | GetAsync
  | SetIncrementAsync
  | UpdateAsync
  | GetSortedAsync
  | SetIncrementSortedAsync
  | OnUpdate
  | ListAsync
  | GetVersionAsync
  | RemoveVersionAsync

type death_style =
  | Default
  | ClassicBreakApart
  | NonGraphic
  | Scriptable

type debugger_end_reason =
  | ClientRequest
  | Timeout
  | InvalidHost
  | Disconnected
  | ServerShutdown
  | ServerProtocolMismatch
  | ConfigurationFailed
  | RpcError

type debugger_exception_break_mode =
  | Never
  | Always
  | Unhandled

type debugger_frame_type =
  | C
  | Lua

type debugger_pause_reason =
  | Unknown
  | Requested
  | Breakpoint
  | Exception
  | SingleStep
  | Entrypoint

type debugger_status =
  | Success
  | Timeout
  | ConnectionLost
  | InvalidResponse
  | InternalError
  | InvalidState
  | RpcError
  | InvalidArgument
  | ConnectionClosed

type dev_camera_occlusion_mode =
  | Zoom
  | Invisicam

type dev_computer_camera_movement_mode =
  | UserChoice
  | Classic
  | Follow
  | Orbital
  | CameraToggle

type dev_computer_movement_mode =
  | UserChoice
  | KeyboardMouse
  | ClickToMove
  | Scriptable

type dev_touch_camera_movement_mode =
  | UserChoice
  | Classic
  | Follow
  | Orbital

type dev_touch_movement_mode =
  | UserChoice
  | Thumbstick
  | DPad
  | Thumbpad
  | ClickToMove
  | Scriptable
  | DynamicThumbstick

type developer_memory_tag =
  | Internal
  | HttpCache
  | Instances
  | Signals
  | LuaHeap
  | Script
  | PhysicsCollision
  | PhysicsParts
  | GraphicsSolidModels
  | GraphicsMeshParts
  | GraphicsParticles
  | GraphicsParts
  | GraphicsSpatialHash
  | GraphicsTerrain
  | GraphicsTexture
  | GraphicsTextureCharacter
  | Sounds
  | StreamingSounds
  | TerrainVoxels
  | Gui
  | Animation
  | Navigation
  | GeometryCsg

type device_type =
  | Unknown
  | Desktop
  | Tablet
  | Phone

type dialog_behavior_type =
  | SinglePlayer
  | MultiplePlayers

type dialog_purpose =
  | Quest
  | Help
  | Shop

type dialog_tone =
  | Neutral
  | Friendly
  | Enemy

type dominant_axis =
  | Width
  | Height

type draft_status_code =
  | Ok
  | DraftOutdated
  | ScriptRemoved
  | DraftCommitted

type drag_detector_drag_style =
  | TranslateLine
  | TranslatePlane
  | TranslatePlaneOrLine
  | TranslateLineOrPlane
  | TranslateViewPlane
  | RotateAxis
  | RotateTrackball
  | Scriptable
  | BestForDevice

type drag_detector_response_style =
  | Geometric
  | Physical
  | Custom

type dragger_coordinate_space =
  | Object
  | World

type dragger_movement_mode =
  | Geometric
  | Physical

type easing_direction =
  | In
  | Out
  | InOut

type easing_style =
  | Linear
  | Sine
  | Back
  | Quad
  | Quart
  | Quint
  | Bounce
  | Elastic
  | Exponential
  | Circular
  | Cubic

type editor_live_scripting =
  | Default
  | Disabled
  | Enabled

type elastic_behavior =
  | WhenScrollable
  | Always
  | Never

type enviromental_physics_throttle =
  | DefaultAuto
  | Disabled
  | Always
  | Skip2
  | Skip4
  | Skip8
  | Skip16

type experience_auth_scope =
  | DefaultScope
  | CreatorAssetsCreate

type explosion_type =
  | NoCraters
  | Craters

type facial_animation_streaming_state =
  | None
  | Audio
  | Video
  | Place
  | Server

type field_of_view_mode =
  | Vertical
  | Diagonal
  | MaxAxis

type fill_direction =
  | Horizontal
  | Vertical

type filter_result =
  | Accepted
  | Rejected

type finish_recording_operation =
  | Cancel
  | Commit
  | Append

type fluid_fidelity =
  | Automatic
  | UseCollisionGeometry
  | UsePreciseGeometry

type fluid_forces =
  | Default
  | Experimental

type font =
  | Legacy
  | Arial
  | ArialBold
  | SourceSans
  | SourceSansBold
  | SourceSansLight
  | SourceSansItalic
  | Bodoni
  | Garamond
  | Cartoon
  | Code
  | Highway
  | SciFi
  | Arcade
  | Fantasy
  | Antique
  | SourceSansSemibold
  | Gotham
  | GothamMedium
  | GothamBold
  | GothamBlack
  | AmaticSc
  | Bangers
  | Creepster
  | DenkOne
  | Fondamento
  | FredokaOne
  | GrenzeGotisch
  | IndieFlower
  | JosefinSans
  | Jura
  | Kalam
  | LuckiestGuy
  | Merriweather
  | Michroma
  | Nunito
  | Oswald
  | PatrickHand
  | PermanentMarker
  | Roboto
  | RobotoCondensed
  | RobotoMono
  | Sarpanch
  | SpecialElite
  | TitilliumWeb
  | Ubuntu
  | Unknown

type font_size =
  | Size8
  | Size9
  | Size10
  | Size11
  | Size12
  | Size14
  | Size18
  | Size24
  | Size36
  | Size48
  | Size28
  | Size32
  | Size42
  | Size60
  | Size96

type font_style =
  | Normal
  | Italic

type font_weight =
  | Thin
  | ExtraLight
  | Light
  | Regular
  | Medium
  | SemiBold
  | Bold
  | ExtraBold
  | Heavy

type force_limit_mode =
  | Magnitude
  | PerAxis

type form_factor =
  | Symmetric
  | Brick
  | Plate
  | Custom

type frame_style =
  | Custom
  | ChatBlue
  | RobloxSquare
  | RobloxRound
  | ChatGreen
  | ChatRed
  | DropShadow

type framerate_manager_mode =
  | Automatic
  | On
  | Off

type friend_request_event =
  | Issue
  | Revoke
  | Accept
  | Deny

type friend_status =
  | Unknown
  | NotFriend
  | Friend
  | FriendRequestSent
  | FriendRequestReceived

type functional_test_result =
  | Passed
  | Warning
  | Error

type game_avatar_type =
  | R6
  | R15
  | PlayerChoice

type gear_genre_setting =
  | AllGenres
  | MatchingGenreOnly

type gear_type =
  | MeleeWeapons
  | RangedWeapons
  | Explosives
  | PowerUps
  | NavigationEnhancers
  | MusicalInstruments
  | SocialItems
  | BuildingTools
  | Transport

type genre =
  | All
  | TownAndCity
  | Fantasy
  | SciFi
  | Ninja
  | Scary
  | Pirate
  | Adventure
  | Sports
  | Funny
  | WildWest
  | War
  | SkatePark
  | Tutorial

type graphics_mode =
  | Automatic
  | Direct3D11
  | OpenGl
  | Metal
  | Vulkan
  | NoGraphics

type gui_state =
  | Idle
  | Hover
  | Press
  | NonInteractable

type gui_type =
  | Core
  | Custom
  | PlayerNameplates
  | CustomBillboards

type handles_style =
  | Resize
  | Movement

type highlight_depth_mode =
  | AlwaysOnTop
  | Occluded

type horizontal_alignment =
  | Center
  | Left
  | Right

type hover_animate_speed =
  | VerySlow
  | Slow
  | Medium
  | Fast
  | VeryFast

type http_cache_policy =
  | None
  | Full
  | DataOnly
  | Default
  | InternalRedirectRefresh

type http_compression =
  | None
  | Gzip

type http_content_type =
  | ApplicationJson
  | ApplicationXml
  | ApplicationUrlEncoded
  | TextPlain
  | TextXml

type http_error =
  | Ok
  | InvalidUrl
  | DnsResolve
  | ConnectFail
  | OutOfMemory
  | TimedOut
  | TooManyRedirects
  | InvalidRedirect
  | NetFail
  | Aborted
  | SslConnectFail
  | SslVerificationFail
  | Unknown

type http_request_type =
  | Default
  | MarketplaceService
  | Players
  | Chat
  | Avatar
  | Analytics
  | Localization

type humanoid_collision_type =
  | OuterBox
  | InnerBox

type humanoid_display_distance_type =
  | Viewer
  | Subject
  | None

type humanoid_health_display_type =
  | DisplayWhenDamaged
  | AlwaysOn
  | AlwaysOff

type humanoid_rig_type =
  | R6
  | R15

type humanoid_state_machine_mode =
  | Default
  | Legacy
  | NoStateMachine
  | LuaStateMachine

type humanoid_state_type =
  | FallingDown
  | Ragdoll
  | GettingUp
  | Jumping
  | Swimming
  | Freefall
  | Flying
  | Landed
  | Running
  | RunningNoPhysics
  | StrafingNoPhysics
  | Climbing
  | Seated
  | PlatformStanding
  | Dead
  | Physics
  | None

type ik_collisions_mode =
  | NoCollisions
  | OtherMechanismsAnchored
  | IncludeContactedMechanisms

type ik_control_constraint_support =
  | Default
  | Disabled
  | Enabled

type ik_control_type =
  | Transform
  | Position
  | Rotation
  | LookAt

type ixp_loading_status =
  | None
  | Pending
  | Initialized
  | ErrorInvalidUser
  | ErrorConnection
  | ErrorJsonParse
  | ErrorTimedOut

type image_combine_type =
  | BlendSourceOver
  | Overwrite

type in_out =
  | Edge
  | Inset
  | Center

type info_type =
  | Asset
  | Product
  | GamePass
  | Subscription
  | Bundle

type initial_dock_state =
  | Top
  | Bottom
  | Left
  | Right
  | Float

type input_type =
  | NoInput
  | Constant
  | Sin

type interpolation_throttling_mode =
  | Default
  | Disabled
  | Enabled

type invite_state =
  | Placed
  | Accepted
  | Declined
  | Missed

type item_line_alignment =
  | Automatic
  | Start
  | Center
  | End
  | Stretch

type joint_creation_mode =
  | All
  | Surface
  | None

type key_code =
  | Unknown
  | Backspace
  | Tab
  | Clear
  | Return
  | Pause
  | Escape
  | Space
  | QuotedDouble
  | Hash
  | Dollar
  | Percent
  | Ampersand
  | Quote
  | LeftParenthesis
  | RightParenthesis
  | Asterisk
  | Plus
  | Comma
  | Minus
  | Period
  | Slash
  | Zero
  | One
  | Two
  | Three
  | Four
  | Five
  | Six
  | Seven
  | Eight
  | Nine
  | Colon
  | Semicolon
  | LessThan
  | Equals
  | GreaterThan
  | Question
  | At
  | LeftBracket
  | BackSlash
  | RightBracket
  | Caret
  | Underscore
  | Backquote
  | A
  | B
  | C
  | D
  | E
  | F
  | G
  | H
  | I
  | J
  | K
  | L
  | M
  | N
  | O
  | P
  | Q
  | R
  | S
  | T
  | U
  | V
  | W
  | X
  | Y
  | Z
  | LeftCurly
  | Pipe
  | RightCurly
  | Tilde
  | Delete
  | World0
  | World1
  | World2
  | World3
  | World4
  | World5
  | World6
  | World7
  | World8
  | World9
  | World10
  | World11
  | World12
  | World13
  | World14
  | World15
  | World16
  | World17
  | World18
  | World19
  | World20
  | World21
  | World22
  | World23
  | World24
  | World25
  | World26
  | World27
  | World28
  | World29
  | World30
  | World31
  | World32
  | World33
  | World34
  | World35
  | World36
  | World37
  | World38
  | World39
  | World40
  | World41
  | World42
  | World43
  | World44
  | World45
  | World46
  | World47
  | World48
  | World49
  | World50
  | World51
  | World52
  | World53
  | World54
  | World55
  | World56
  | World57
  | World58
  | World59
  | World60
  | World61
  | World62
  | World63
  | World64
  | World65
  | World66
  | World67
  | World68
  | World69
  | World70
  | World71
  | World72
  | World73
  | World74
  | World75
  | World76
  | World77
  | World78
  | World79
  | World80
  | World81
  | World82
  | World83
  | World84
  | World85
  | World86
  | World87
  | World88
  | World89
  | World90
  | World91
  | World92
  | World93
  | World94
  | World95
  | KeypadZero
  | KeypadOne
  | KeypadTwo
  | KeypadThree
  | KeypadFour
  | KeypadFive
  | KeypadSix
  | KeypadSeven
  | KeypadEight
  | KeypadNine
  | KeypadPeriod
  | KeypadDivide
  | KeypadMultiply
  | KeypadMinus
  | KeypadPlus
  | KeypadEnter
  | KeypadEquals
  | Up
  | Down
  | Right
  | Left
  | Insert
  | Home
  | End
  | PageUp
  | PageDown
  | F1
  | F2
  | F3
  | F4
  | F5
  | F6
  | F7
  | F8
  | F9
  | F10
  | F11
  | F12
  | F13
  | F14
  | F15
  | NumLock
  | CapsLock
  | ScrollLock
  | RightShift
  | LeftShift
  | RightControl
  | LeftControl
  | RightAlt
  | LeftAlt
  | RightMeta
  | LeftMeta
  | LeftSuper
  | RightSuper
  | Mode
  | Compose
  | Help
  | Print
  | SysReq
  | Break
  | Menu
  | Power
  | Euro
  | Undo
  | ButtonX
  | ButtonY
  | ButtonA
  | ButtonB
  | ButtonR1
  | ButtonL1
  | ButtonR2
  | ButtonL2
  | ButtonR3
  | ButtonL3
  | ButtonStart
  | ButtonSelect
  | DPadLeft
  | DPadRight
  | DPadUp
  | DPadDown
  | Thumbstick1
  | Thumbstick2

type key_interpolation_mode =
  | Constant
  | Linear
  | Cubic

type keyword_filter_type =
  | Include
  | Exclude

type language =
  | Default

type left_right =
  | Left
  | Center
  | Right

type limb =
  | Head
  | Torso
  | LeftArm
  | RightArm
  | LeftLeg
  | RightLeg
  | Unknown

type line_join_mode =
  | Round
  | Bevel
  | Miter

type list_display_mode =
  | Horizontal
  | Vertical

type listener_type =
  | Camera
  | CFrame
  | ObjectPosition
  | ObjectCFrame

type live_editing_atomic_update_response =
  | Success
  | FailureGuidNotFound
  | FailureHashMismatch
  | FailureOperationIllegal

type live_editing_broadcast_message_type =
  | Normal
  | Warning
  | Error

type load_character_layered_clothing =
  | Default
  | Disabled
  | Enabled

type load_dynamic_heads =
  | Default
  | Disabled
  | Enabled

type markup_kind =
  | PlainText
  | Markdown

type material =
  | Plastic
  | SmoothPlastic
  | Neon
  | Wood
  | WoodPlanks
  | Marble
  | Slate
  | Concrete
  | Granite
  | Brick
  | Pebble
  | Cobblestone
  | Rock
  | Sandstone
  | Basalt
  | CrackedLava
  | Limestone
  | Pavement
  | CorrodedMetal
  | DiamondPlate
  | Foil
  | Metal
  | Grass
  | LeafyGrass
  | Sand
  | Fabric
  | Snow
  | Mud
  | Ground
  | Asphalt
  | Salt
  | Ice
  | Glacier
  | Glass
  | ForceField
  | Air
  | Water
  | Cardboard
  | Carpet
  | CeramicTiles
  | ClayRoofTiles
  | RoofShingles
  | Leather
  | Plaster
  | Rubber

type material_pattern =
  | Regular
  | Organic

type membership_type =
  | None
  | BuildersClub
  | TurboBuildersClub
  | OutrageousBuildersClub
  | Premium

type mesh_part_detail_level =
  | DistanceBased
  | Level00
  | Level01
  | Level02
  | Level03
  | Level04

type mesh_part_heads_and_accessories =
  | Default
  | Disabled
  | Enabled

type mesh_scale_unit =
  | Stud
  | Meter
  | Cm
  | Mm
  | Foot
  | Inch

type mesh_type =
  | Head
  | Torso
  | Wedge
  | Sphere
  | Cylinder
  | FileMesh
  | Brick
  | Prism
  | Pyramid
  | ParallelRamp
  | RightAngleRamp
  | CornerWedge

type message_type =
  | MessageOutput
  | MessageInfo
  | MessageWarning
  | MessageError

type model_level_of_detail =
  | Automatic
  | StreamingMesh
  | Disabled

type model_streaming_behavior =
  | Default
  | Legacy
  | Improved

type model_streaming_mode =
  | Default
  | Atomic
  | Persistent
  | PersistentPerPlayer
  | Nonatomic

type modifier_key =
  | Shift
  | Ctrl
  | Alt
  | Meta

type mouse_behavior =
  | Default
  | LockCenter
  | LockCurrentPosition

type move_state =
  | Stopped
  | Coasting
  | Pushing
  | Stopping
  | AirFree

type mute_state =
  | Unmuted
  | Muted

type name_occlusion =
  | NoOcclusion
  | EnemyOcclusion
  | OccludeAll

type network_ownership =
  | Automatic
  | Manual
  | OnContact

type normal_id =
  | Right
  | Top
  | Back
  | Left
  | Bottom
  | Front

type operation_type =
  | Null
  | Union
  | Subtraction
  | Intersection
  | Primitive

type orientation_alignment_mode =
  | OneAttachment
  | TwoAttachment

type outfit_source =
  | All
  | Created
  | Purchased

type outfit_type =
  | All
  | Avatar
  | DynamicHead

type output_layout_mode =
  | Horizontal
  | Vertical

type override_mouse_icon_behavior =
  | None
  | ForceShow
  | ForceHide

type package_permission =
  | None
  | NoAccess
  | Revoked
  | UseView
  | Edit
  | Own

type part_type =
  | Ball
  | Block
  | Cylinder
  | Wedge
  | CornerWedge

type particle_emitter_shape =
  | Box
  | Sphere
  | Cylinder
  | Disc

type particle_emitter_shape_in_out =
  | Outward
  | Inward
  | InAndOut

type particle_emitter_shape_style =
  | Volume
  | Surface

type particle_flipbook_layout =
  | None
  | Grid2X2
  | Grid4X4
  | Grid8X8

type particle_flipbook_mode =
  | Loop
  | OneShot
  | PingPong
  | Random

type particle_flipbook_texture_compatible =
  | NotCompatible
  | Compatible
  | Unknown

type particle_orientation =
  | FacingCamera
  | FacingCameraWorldUp
  | VelocityParallel
  | VelocityPerpendicular

type path_status =
  | Success
  | NoPath
  | ClosestNoPath
  | ClosestOutOfRange
  | FailStartNotEmpty
  | FailFinishNotEmpty

type path_waypoint_action =
  | Walk
  | Jump
  | Custom

type permission_level_shown =
  | Game
  | RobloxGame
  | RobloxScript
  | Studio
  | Roblox

type physics_simulation_rate =
  | Fixed240Hz
  | Fixed120Hz
  | Fixed60Hz

type physics_stepping_method =
  | Default
  | Fixed
  | Adaptive

type platform =
  | Windows
  | Osx
  | Ios
  | Android
  | XBoxOne
  | Ps4
  | Ps3
  | XBox360
  | WiiU
  | Nx
  | Ouya
  | AndroidTv
  | Chromecast
  | Linux
  | SteamOs
  | WebOs
  | Dos
  | BeOs
  | Uwp
  | Ps5
  | None

type playback_state =
  | Begin
  | Delayed
  | Playing
  | Paused
  | Completed
  | Cancelled

type player_actions =
  | CharacterForward
  | CharacterBackward
  | CharacterLeft
  | CharacterRight
  | CharacterJump

type player_character_destroy_behavior =
  | Default
  | Disabled
  | Enabled

type player_chat_type =
  | All
  | Team
  | Whisper

type pose_easing_direction =
  | In
  | Out
  | InOut

type pose_easing_style =
  | Linear
  | Constant
  | Elastic
  | Cubic
  | Bounce

type position_alignment_mode =
  | OneAttachment
  | TwoAttachment

type primal_physics_solver =
  | Default
  | Experimental
  | Disabled

type primitive_type =
  | Null
  | Ball
  | Cylinder
  | Block
  | Wedge
  | CornerWedge

type privilege_type =
  | Owner
  | Admin
  | Member
  | Visitor
  | Banned

type product_location_restriction =
  | AvatarShop
  | AllowedGames
  | AllGames

type product_purchase_decision =
  | NotProcessedYet
  | PurchaseGranted

type prompt_create_asset_result =
  | Success
  | PermissionDenied
  | Timeout
  | UploadFailed
  | NoUserInput
  | UnknownFailure

type prompt_create_avatar_result =
  | Success
  | PermissionDenied
  | Timeout
  | UploadFailed
  | NoUserInput
  | InvalidHumanoidDescription
  | UgcValidationFailed
  | ModeratedName
  | MaxOutfits
  | UnknownFailure

type prompt_publish_asset_result =
  | Success
  | PermissionDenied
  | Timeout
  | UploadFailed
  | NoUserInput
  | UnknownFailure

type property_status =
  | Ok
  | Warning
  | Error

type proximity_prompt_exclusivity =
  | OnePerButton
  | OneGlobally
  | AlwaysShow

type proximity_prompt_input_type =
  | Keyboard
  | Gamepad
  | Touch

type proximity_prompt_style =
  | Default
  | Custom

type quality_level =
  | Automatic
  | Level01
  | Level02
  | Level03
  | Level04
  | Level05
  | Level06
  | Level07
  | Level08
  | Level09
  | Level10
  | Level11
  | Level12
  | Level13
  | Level14
  | Level15
  | Level16
  | Level17
  | Level18
  | Level19
  | Level20
  | Level21

type r_15_collision_type =
  | OuterBox
  | InnerBox

type raycast_filter_type =
  | Exclude
  | Include

type reject_character_deletions =
  | Default
  | Disabled
  | Enabled

type render_fidelity =
  | Automatic
  | Precise
  | Performance

type render_priority =
  | First
  | Input
  | Camera
  | Character
  | Last

type rendering_test_comparison_method =
  | Psnr
  | Diff

type replicate_instance_destroy_setting =
  | Default
  | Disabled
  | Enabled

type resampler_mode =
  | Default
  | Pixelated

type reserved_highlight_id =
  | Standard
  | Selection
  | Hover
  | Active

type rest_pose =
  | Default
  | RotationsReset
  | Custom

type return_key_type =
  | Default
  | Done
  | Go
  | Next
  | Search
  | Send

type reverb_type =
  | NoReverb
  | GenericReverb
  | PaddedCell
  | Room
  | Bathroom
  | LivingRoom
  | StoneRoom
  | Auditorium
  | ConcertHall
  | Cave
  | Arena
  | Hangar
  | CarpettedHallway
  | Hallway
  | StoneCorridor
  | Alley
  | Forest
  | City
  | Mountains
  | Quarry
  | Plain
  | ParkingLot
  | SewerPipe
  | UnderWater

type ribbon_tool =
  | Select
  | Scale
  | Rotate
  | Move
  | Transform
  | ColorPicker
  | MaterialPicker
  | Group
  | Ungroup
  | None
  | PivotEditor

type rig_scale =
  | Default
  | Rthro
  | RthroNarrow

type rig_type =
  | R15
  | Custom
  | None

type roll_off_mode =
  | Inverse
  | Linear
  | LinearSquare
  | InverseTapered

type rotation_order =
  | Xyz
  | Xzy
  | Yzx
  | Yxz
  | Zxy
  | Zyx

type rotation_type =
  | MovementRelative
  | CameraRelative

type rtl_text_support =
  | Default
  | Disabled
  | Enabled

type run_context =
  | Legacy
  | Server
  | Client
  | Plugin

type runtime_undo_behavior =
  | Aggregate
  | Snapshot
  | Hybrid

type safe_area_compatibility =
  | None
  | FullscreenExtension

type sales_type_filter =
  | All
  | Collectibles
  | Premium

type save_avatar_thumbnail_customization_failure =
  | BadThumbnailType
  | BadYRotDeg
  | BadFieldOfViewDeg
  | BadDistanceScale
  | Other
  | Throttled

type save_filter =
  | SaveWorld
  | SaveGame
  | SaveAll

type saved_quality_setting =
  | Automatic
  | QualityLevel1
  | QualityLevel2
  | QualityLevel3
  | QualityLevel4
  | QualityLevel5
  | QualityLevel6
  | QualityLevel7
  | QualityLevel8
  | QualityLevel9
  | QualityLevel10

type scale_type =
  | Stretch
  | Slice
  | Tile
  | Fit
  | Crop

type scope_check_result =
  | ConsentAccepted
  | InvalidScopes
  | Timeout
  | NoUserInput
  | BackendError
  | UnexpectedError
  | InvalidArgument
  | ConsentDenied

type screen_insets =
  | None
  | DeviceSafeInsets
  | CoreUiSafeInsets
  | TopbarSafeInsets

type screen_orientation =
  | LandscapeLeft
  | LandscapeRight
  | LandscapeSensor
  | Portrait
  | Sensor

type scroll_bar_inset =
  | None
  | ScrollBar
  | Always

type scrolling_direction =
  | X
  | Y
  | Xy

type selection_behavior =
  | Escape
  | Stop

type selection_render_mode =
  | Outlines
  | BoundingBoxes
  | Both

type self_view_position =
  | LastPosition
  | TopLeft
  | TopRight
  | BottomLeft
  | BottomRight

type sensor_mode =
  | Floor
  | Ladder

type sensor_update_type =
  | OnRead
  | Manual

type server_audio_behavior =
  | Enabled
  | Muted
  | OnlineGame

type server_live_editing_mode =
  | Uninitialized
  | Enabled
  | Disabled

type service_visibility =
  | Always
  | Off
  | WithChildren

type severity =
  | Error
  | Warning
  | Information
  | Hint

type signal_behavior =
  | Default
  | Immediate
  | Deferred
  | AncestryDeferred

type size_constraint =
  | RelativeXy
  | RelativeXx
  | RelativeYy

type solver_convergence_metric_type =
  | IterationBased
  | AlgorithmAgnostic

type solver_convergence_visualization_mode =
  | Disabled
  | PerIsland
  | PerEdge

type sort_direction =
  | Ascending
  | Descending

type sort_order =
  | Name
  | Custom
  | LayoutOrder

type special_key =
  | Insert
  | Home
  | End
  | PageUp
  | PageDown
  | ChatHotkey

type start_corner =
  | TopLeft
  | TopRight
  | BottomLeft
  | BottomRight

type status =
  | Poison
  | Confusion

type stream_out_behavior =
  | Default
  | LowMemory
  | Opportunistic

type streaming_integrity_mode =
  | Default
  | Disabled
  | MinimumRadiusPause
  | PauseOutsideLoadedArea

type streaming_pause_mode =
  | Default
  | Disabled
  | ClientPhysicsPause

type studio_close_mode =
  | None
  | CloseStudio
  | CloseDoc

type studio_data_model_type =
  | Edit
  | PlayClient
  | PlayServer
  | Standalone
  | None

type studio_place_update_failure_reason =
  | Other
  | TeamCreateConflict

type studio_script_editor_color_categories =
  | Default
  | Operator
  | Number
  | String
  | Comment
  | Keyword
  | Builtin
  | Method
  | Property
  | Nil
  | Bool
  | Function
  | Local
  | Self
  | LuauKeyword
  | FunctionName
  | Todo
  | Background
  | SelectionText
  | SelectionBackground
  | FindSelectionBackground
  | MatchingWordBackground
  | Warning
  | Error
  | Info
  | Hint
  | Whitespace
  | ActiveLine
  | DebuggerCurrentLine
  | DebuggerErrorLine
  | Ruler
  | Bracket
  | MenuPrimaryText
  | MenuSecondaryText
  | MenuSelectedText
  | MenuBackground
  | MenuSelectedBackground
  | MenuScrollbarBackground
  | MenuScrollbarHandle
  | MenuBorder
  | DocViewCodeBackground
  | AicoOverlayText
  | AicoOverlayButtonBackground
  | AicoOverlayButtonBackgroundHover
  | AicoOverlayButtonBackgroundPressed
  | IndentationRuler

type studio_script_editor_color_presets =
  | RobloxDefault
  | Extra1
  | Extra2
  | Custom

type studio_style_guide_color =
  | MainBackground
  | Titlebar
  | Dropdown
  | Tooltip
  | Notification
  | ScrollBar
  | ScrollBarBackground
  | TabBar
  | Tab
  | FilterButtonDefault
  | FilterButtonHover
  | FilterButtonChecked
  | FilterButtonAccent
  | FilterButtonBorder
  | FilterButtonBorderAlt
  | RibbonTab
  | RibbonTabTopBar
  | Button
  | MainButton
  | RibbonButton
  | ViewPortBackground
  | InputFieldBackground
  | Item
  | TableItem
  | CategoryItem
  | GameSettingsTableItem
  | GameSettingsTooltip
  | EmulatorBar
  | EmulatorDropDown
  | ColorPickerFrame
  | CurrentMarker
  | Border
  | DropShadow
  | Shadow
  | Light
  | Dark
  | Mid
  | MainText
  | SubText
  | TitlebarText
  | BrightText
  | DimmedText
  | LinkText
  | WarningText
  | ErrorText
  | InfoText
  | SensitiveText
  | ScriptSideWidget
  | ScriptBackground
  | ScriptText
  | ScriptSelectionText
  | ScriptSelectionBackground
  | ScriptFindSelectionBackground
  | ScriptMatchingWordSelectionBackground
  | ScriptOperator
  | ScriptNumber
  | ScriptString
  | ScriptComment
  | ScriptKeyword
  | ScriptBuiltInFunction
  | ScriptWarning
  | ScriptError
  | ScriptInformation
  | ScriptHint
  | ScriptWhitespace
  | ScriptRuler
  | DocViewCodeBackground
  | DebuggerCurrentLine
  | DebuggerErrorLine
  | DiffFilePathText
  | DiffTextHunkInfo
  | DiffTextNoChange
  | DiffTextAddition
  | DiffTextDeletion
  | DiffTextSeparatorBackground
  | DiffTextNoChangeBackground
  | DiffTextAdditionBackground
  | DiffTextDeletionBackground
  | DiffLineNum
  | DiffLineNumSeparatorBackground
  | DiffLineNumNoChangeBackground
  | DiffLineNumAdditionBackground
  | DiffLineNumDeletionBackground
  | DiffFilePathBackground
  | DiffFilePathBorder
  | ChatIncomingBgColor
  | ChatIncomingTextColor
  | ChatOutgoingBgColor
  | ChatOutgoingTextColor
  | ChatModeratedMessageColor
  | Separator
  | ButtonBorder
  | ButtonText
  | InputFieldBorder
  | CheckedFieldBackground
  | CheckedFieldBorder
  | CheckedFieldIndicator
  | HeaderSection
  | Midlight
  | StatusBar
  | DialogButton
  | DialogButtonText
  | DialogButtonBorder
  | DialogMainButton
  | DialogMainButtonText
  | InfoBarWarningBackground
  | InfoBarWarningText
  | ScriptEditorCurrentLine
  | ScriptMethod
  | ScriptProperty
  | ScriptNil
  | ScriptBool
  | ScriptFunction
  | ScriptLocal
  | ScriptSelf
  | ScriptLuauKeyword
  | ScriptFunctionName
  | ScriptTodo
  | ScriptBracket
  | AttributeCog
  | AicoOverlayText
  | AicoOverlayButtonBackground
  | AicoOverlayButtonBackgroundHover
  | AicoOverlayButtonBackgroundPressed
  | OnboardingCover
  | OnboardingHighlight
  | OnboardingShadow

type studio_style_guide_modifier =
  | Default
  | Selected
  | Pressed
  | Disabled
  | Hover

type style =
  | AlternatingSupports
  | BridgeStyleSupports
  | NoSupports

type subscription_payment_status =
  | Paid
  | Refunded

type subscription_period =
  | Month

type surface_constraint =
  | None
  | Hinge
  | SteppingMotor
  | Motor

type surface_gui_shape =
  | Flat
  | CurvedHorizontally

type surface_gui_sizing_mode =
  | FixedSize
  | PixelsPerStud

type surface_type =
  | Smooth
  | Glue
  | Weld
  | Studs
  | Inlet
  | Universal
  | Hinge
  | Motor
  | SteppingMotor
  | SmoothNoOutlines

type swipe_direction =
  | Right
  | Left
  | Up
  | Down
  | None

type table_major_axis =
  | RowMajor
  | ColumnMajor

type technology =
  | Voxel
  | Compatibility
  | ShadowMap
  | Future
  | Legacy

type teleport_method =
  | TeleportToSpawnByName
  | TeleportToPlaceInstance
  | TeleportToPrivateServer
  | TeleportPartyAsync
  | TeleportToVipServer
  | TeleportUnknown

type teleport_result =
  | Success
  | Failure
  | GameNotFound
  | GameEnded
  | GameFull
  | Unauthorized
  | Flooded
  | IsTeleporting

type teleport_state =
  | RequestedFromServer
  | Started
  | WaitingForServer
  | Failed
  | InProgress

type teleport_type =
  | ToPlace
  | ToInstance
  | ToReservedServer
  | ToVipServer

type terrain_acquisition_method =
  | None
  | Legacy
  | Template
  | Generate
  | Import
  | Convert
  | EditAddTool
  | EditSeaLevelTool
  | EditReplaceTool
  | RegionFillTool
  | RegionPasteTool
  | Other

type terrain_face =
  | Top
  | Side
  | Bottom

type text_chat_message_status =
  | Unknown
  | Success
  | Sending
  | TextFilterFailed
  | Floodchecked
  | InvalidPrivacySettings
  | InvalidTextChannelPermissions
  | MessageTooLong

type text_direction =
  | Auto
  | LeftToRight
  | RightToLeft

type text_filter_context =
  | PublicChat
  | PrivateChat

type text_input_type =
  | Default
  | NoSuggestions
  | Number
  | Email
  | Phone
  | Password
  | PasswordShown
  | Username
  | OneTimePassword

type text_truncate =
  | None
  | AtEnd

type text_x_alignment =
  | Left
  | Right
  | Center

type text_y_alignment =
  | Top
  | Center
  | Bottom

type texture_generation_mesh_handler_unwrap_mode =
  | Never
  | Always
  | WhenInvalidUVsDetected

type texture_mode =
  | Stretch
  | Wrap
  | Static

type texture_query_type =
  | NonHumanoid
  | NonHumanoidOrphaned
  | Humanoid
  | HumanoidOrphaned

type thread_pool_config =
  | PerCore4
  | PerCore3
  | PerCore2
  | PerCore1
  | Auto
  | Threads1
  | Threads2
  | Threads3
  | Threads4
  | Threads8
  | Threads16

type throttling_priority =
  | Extreme
  | ElevatedOnServer
  | Default

type thumbnail_size =
  | Size48X48
  | Size180X180
  | Size420X420
  | Size60X60
  | Size100X100
  | Size150X150
  | Size352X352

type thumbnail_type =
  | HeadShot
  | AvatarBust
  | AvatarThumbnail

type tick_count_sample_method =
  | Fast
  | Benchmark
  | Precise

type top_bottom =
  | Top
  | Center
  | Bottom

type touch_camera_movement_mode =
  | Default
  | Classic
  | Follow
  | Orbital

type touch_movement_mode =
  | Default
  | Thumbstick
  | DPad
  | Thumbpad
  | ClickToMove
  | DynamicThumbstick

type tracker_error =
  | Ok
  | NoService
  | InitFailed
  | NoVideo
  | VideoError
  | VideoNoPermission
  | VideoUnsupported
  | NoAudio
  | AudioError
  | AudioNoPermission
  | UnsupportedDevice

type tracker_extrapolation_flag_mode =
  | Auto
  | ForceDisabled
  | ExtrapolateFacsAndPose
  | ExtrapolateFacsOnly

type tracker_face_tracking_status =
  | FaceTrackingSuccess
  | FaceTrackingNoFaceFound
  | FaceTrackingUnknown
  | FaceTrackingLost
  | FaceTrackingHasTrackingError
  | FaceTrackingIsOccluded
  | FaceTrackingUninitialized

type tracker_lod_flag_mode =
  | Auto
  | ForceFalse
  | ForceTrue

type tracker_lod_value_mode =
  | Auto
  | Force0
  | Force1

type tracker_mode =
  | None
  | Audio
  | Video
  | AudioVideo

type tracker_prompt_event =
  | LodCameraRecommendDisable

type tri_state_boolean =
  | False
  | True
  | Unknown

type tween_status =
  | Canceled
  | Completed

type ui_flex_alignment =
  | None
  | Fill
  | SpaceAround
  | SpaceBetween
  | SpaceEvenly

type ui_flex_mode =
  | None
  | Grow
  | Shrink
  | Fill
  | Custom

type ui_theme =
  | Light
  | Dark

type ui_message_type =
  | UiMessageError
  | UiMessageInfo

type usage_context =
  | Default
  | Preview

type user_c_frame =
  | Head
  | LeftHand
  | RightHand
  | Floor

type user_input_state =
  | Begin
  | Change
  | End
  | Cancel
  | None

type user_input_type =
  | MouseButton1
  | MouseButton2
  | MouseButton3
  | MouseWheel
  | MouseMovement
  | Touch
  | Keyboard
  | Focus
  | Accelerometer
  | Gyro
  | Gamepad1
  | Gamepad2
  | Gamepad3
  | Gamepad4
  | Gamepad5
  | Gamepad6
  | Gamepad7
  | Gamepad8
  | TextInput
  | InputMethod
  | None

type vr_comfort_setting =
  | Comfort
  | Normal
  | Expert
  | Custom

type vr_safety_bubble_mode =
  | NoOne
  | OnlyFriends
  | Anyone

type vr_scaling =
  | World
  | Off

type vr_session_state =
  | Undefined
  | Idle
  | Visible
  | Focused
  | Stopping

type vr_touchpad =
  | Left
  | Right

type vr_touchpad_mode =
  | Touch
  | VirtualThumbstick
  | Abxy

type velocity_constraint_mode =
  | Line
  | Plane
  | Vector

type vertical_alignment =
  | Center
  | Top
  | Bottom

type vertical_scroll_bar_position =
  | Right
  | Left

type vibration_motor =
  | Large
  | Small
  | LeftTrigger
  | RightTrigger
  | LeftHand
  | RightHand

type view_mode =
  | None
  | GeometryComplexity
  | Transparent
  | Decal

type virtual_cursor_mode =
  | Default
  | Disabled
  | Enabled

type virtual_input_mode =
  | None
  | Recording
  | Playing

type voice_chat_state =
  | Idle
  | Joining
  | JoiningRetry
  | Joined
  | Leaving
  | Ended
  | Failed

type voice_control_path =
  | Publish
  | Subscribe
  | Join

type volumetric_audio =
  | Disabled
  | Automatic
  | Enabled

type water_direction =
  | NegX
  | X
  | NegY
  | Y
  | NegZ
  | Z

type water_force =
  | None
  | Small
  | Medium
  | Strong
  | Max

type weld_constraint_preserve =
  | All
  | None
  | Touching

type wrap_layer_auto_skin =
  | Disabled
  | EnabledPreserve
  | EnabledOverride

type wrap_layer_debug_mode =
  | None
  | BoundCage
  | LayerCage
  | BoundCageAndLinks
  | Reference
  | Rbf
  | OuterCage
  | ReferenceMeshAfterMorph
  | HsrOuterDetail
  | HsrOuter
  | HsrInner
  | HsrInnerReverse
  | LayerCageFittedToBase
  | LayerCageFittedToPrev

type wrap_target_debug_mode =
  | None
  | TargetCageOriginal
  | TargetCageCompressed
  | TargetCageInterface
  | TargetLayerCageOriginal
  | TargetLayerCageCompressed
  | TargetLayerInterface
  | Rbf
  | OuterCageDetail

type z_index_behavior =
  | Global
  | Sibling

