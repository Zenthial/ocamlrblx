module AccessModifierType = struct
  type t =
    | Allow
    | Deny
end

module AccessoryType = struct
  type t =
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
end

module ActionType = struct
  type t =
    | Nothing
    | Pause
    | Lose
    | Draw
    | Win
end

module ActuatorRelativeTo = struct
  type t =
    | Attachment0
    | Attachment1
    | World
end

module ActuatorType = struct
  type t =
    | None
    | Motor
    | Servo
end

module AdEventType = struct
  type t =
    | VideoLoaded
    | VideoRemoved
    | UserCompletedVideo
end

module AdShape = struct
  type t =
    | HorizontalRectangle
end

module AdTeleportMethod = struct
  type t =
    | Undefined
    | PortalForward
    | InGameMenuBackButton
    | UiBackButton
end

module AdUnitStatus = struct
  type t =
    | Inactive
    | Active
end

module AdornCullingMode = struct
  type t =
    | Automatic
    | Never
end

module AlignType = struct
  type t =
    | PrimaryAxisParallel
    | PrimaryAxisPerpendicular
    | PrimaryAxisLookAt
    | AllAxes
    | Parallel
    | Perpendicular
end

module AlphaMode = struct
  type t =
    | Overlay
    | Transparency
end

module AnalyticsEconomyAction = struct
  type t =
    | Default
    | Acquire
    | Spend
end

module AnalyticsLogLevel = struct
  type t =
    | Trace
    | Debug
    | Information
    | Warning
    | Error
    | Fatal
end

module AnalyticsProgressionStatus = struct
  type t =
    | Default
    | Begin
    | Complete
    | Abandon
    | Fail
end

module AnimationClipFromVideoStatus = struct
  type t =
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
end

module AnimationCompositorMode = struct
  type t =
    | Default
    | Enabled
    | Disabled
end

module AnimationPriority = struct
  type t =
    | Core
    | Idle
    | Movement
    | Action
    | Action2
    | Action3
    | Action4
end

module AnimatorRetargetingMode = struct
  type t =
    | Default
    | Disabled
    | Enabled
end

module AppShellActionType = struct
  type t =
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
end

module AppShellFeature = struct
  type t =
    | None
    | Chat
    | AvatarEditor
    | GamePage
    | HomePage
    | More
    | Landing
end

module AppUpdateStatus = struct
  type t =
    | Unknown
    | NotSupported
    | Failed
    | NotAvailable
    | Available
end

module ApplyStrokeMode = struct
  type t =
    | Contextual
    | Border
end

module AspectType = struct
  type t =
    | FitWithinMaxSize
    | ScaleWithParentSize
end

module AssetCreatorType = struct
  type t =
    | User
    | Group
end

module AssetFetchStatus = struct
  type t =
    | Success
    | Failure
    | None
    | Loading
    | TimedOut
end

module AssetType = struct
  type t =
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
end

module AssetTypeVerification = struct
  type t =
    | Default
    | ClientOnly
    | Always
end

module AudioApiRollout = struct
  type t =
    | Disabled
    | Automatic
    | Enabled
end

module AudioSubType = struct
  type t =
    | Music
    | SoundEffect
end

module AudioWindowSize = struct
  type t =
    | Small
    | Medium
    | Large
end

module AutoIndentRule = struct
  type t =
    | Off
    | Absolute
    | Relative
end

module AutomaticSize = struct
  type t =
    | None
    | X
    | Y
    | Xy
end

module AvatarAssetType = struct
  type t =
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
end

module AvatarChatServiceFeature = struct
  type t =
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
end

module AvatarContextMenuOption = struct
  type t =
    | Friend
    | Chat
    | Emote
    | InspectMenu
end

module AvatarItemType = struct
  type t =
    | Asset
    | Bundle
end

module AvatarJointUpgrade = struct
  type t =
    | Default
    | Enabled
    | Disabled
end

module AvatarPromptResult = struct
  type t =
    | Success
    | PermissionDenied
    | Failed
end

module AvatarThumbnailCustomizationType = struct
  type t =
    | Closeup
    | FullBody
end

module AvatarUnificationMode = struct
  type t =
    | Default
    | Disabled
    | Enabled
end

module Axis = struct
  type t =
    | X
    | Y
    | Z
end

module BinType = struct
  type t =
    | Script
    | GameTool
    | Grab
    | Clone
    | Hammer
end

module BodyPart = struct
  type t =
    | Head
    | Torso
    | LeftArm
    | RightArm
    | LeftLeg
    | RightLeg
end

module BodyPartR15 = struct
  type t =
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
end

module BorderMode = struct
  type t =
    | Outline
    | Middle
    | Inset
end

module BreakReason = struct
  type t =
    | Other
    | Error
    | SpecialBreakpoint
    | UserBreakpoint
end

module BreakpointRemoveReason = struct
  type t =
    | Requested
    | ScriptChanged
    | ScriptRemoved
end

module BulkMoveMode = struct
  type t =
    | FireAllEvents
    | FireCFrameChanged
end

module BundleType = struct
  type t =
    | BodyParts
    | Animations
    | Shoes
    | DynamicHead
    | DynamicHeadAvatar
end

module Button = struct
  type t =
    | Jump
    | Dismount
end

module ButtonStyle = struct
  type t =
    | Custom
    | RobloxButtonDefault
    | RobloxButton
    | RobloxRoundButton
    | RobloxRoundDefaultButton
    | RobloxRoundDropdownButton
end

module CageType = struct
  type t =
    | Inner
    | Outer
end

module CameraMode = struct
  type t =
    | Classic
    | LockFirstPerson
end

module CameraPanMode = struct
  type t =
    | Classic
    | EdgeBump
end

module CameraSpeedAdjustBinding = struct
  type t =
    | None
    | RmbScroll
    | AltScroll
end

module CameraType = struct
  type t =
    | Fixed
    | Attach
    | Watch
    | Track
    | Follow
    | Custom
    | Scriptable
    | Orbital
end

module CatalogCategoryFilter = struct
  type t =
    | None
    | Featured
    | Collectibles
    | CommunityCreations
    | Premium
    | Recommended
end

module CatalogSortAggregation = struct
  type t =
    | Past12Hours
    | PastDay
    | Past3Days
    | PastWeek
    | PastMonth
    | AllTime
end

module CatalogSortType = struct
  type t =
    | Relevance
    | PriceHighToLow
    | PriceLowToHigh
    | MostFavorited
    | RecentlyCreated
    | Bestselling
end

module CellBlock = struct
  type t =
    | Solid
    | VerticalWedge
    | CornerWedge
    | InverseCornerWedge
    | HorizontalWedge
end

module CellMaterial = struct
  type t =
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
end

module CellOrientation = struct
  type t =
    | NegZ
    | X
    | Z
    | NegX
end

module CenterDialogType = struct
  type t =
    | UnsolicitedDialog
    | PlayerInitiatedDialog
    | ModalDialog
    | QuitDialog
end

module CharacterControlMode = struct
  type t =
    | Default
    | Legacy
    | NoCharacterController
    | LuaCharacterController
end

module ChatCallbackType = struct
  type t =
    | OnCreatingChatWindow
    | OnClientSendingMessage
    | OnClientFormattingMessage
    | OnServerReceivingMessage
end

module ChatColor = struct
  type t =
    | Blue
    | Green
    | Red
    | White
end

module ChatMode = struct
  type t =
    | Menu
    | TextAndMenu
end

module ChatPrivacyMode = struct
  type t =
    | AllUsers
    | NoOne
    | Friends
end

module ChatStyle = struct
  type t =
    | Classic
    | Bubble
    | ClassicAndBubble
end

module ChatVersion = struct
  type t =
    | LegacyChatService
    | TextChatService
end

module ClientAnimatorThrottlingMode = struct
  type t =
    | Default
    | Disabled
    | Enabled
end

module CollaboratorStatus = struct
  type t =
    | Editing3D
    | Scripting
    | PrivateScripting
    | None
end

module CollisionFidelity = struct
  type t =
    | Default
    | Hull
    | Box
    | PreciseConvexDecomposition
end

module CommandPermission = struct
  type t =
    | Plugin
    | LocalUser
end

module CompileTarget = struct
  type t =
    | Client
    | CoreScript
    | Studio
    | CoreScriptRaw
end

module CompletionItemKind = struct
  type t =
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
end

module CompletionItemTag = struct
  type t =
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
end

module CompletionTriggerKind = struct
  type t =
    | Invoked
    | TriggerCharacter
    | TriggerForIncompleteCompletions
end

module ComputerCameraMovementMode = struct
  type t =
    | Default
    | Classic
    | Follow
    | Orbital
    | CameraToggle
end

module ComputerMovementMode = struct
  type t =
    | Default
    | KeyboardMouse
    | ClickToMove
end

module ConnectionError = struct
  type t =
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
end

module ConnectionState = struct
  type t =
    | Connected
    | Disconnected
end

module ContextActionPriority = struct
  type t =
    | Low
    | Medium
    | High
end

module ContextActionResult = struct
  type t =
    | Sink
    | Pass
end

module ControlMode = struct
  type t =
    | Classic
    | MouseLockSwitch
end

module CoreGuiType = struct
  type t =
    | PlayerList
    | Health
    | Backpack
    | Chat
    | All
    | EmotesMenu
    | SelfView
    | Captures
end

module CreateOutfitFailure = struct
  type t =
    | InvalidName
    | OutfitLimitReached
    | Other
end

module CreatorType = struct
  type t =
    | User
    | Group
end

module CreatorTypeFilter = struct
  type t =
    | User
    | Group
    | All
end

module CurrencyType = struct
  type t =
    | Default
    | Robux
    | Tix
end

module CustomCameraMode = struct
  type t =
    | Default
    | Classic
    | Follow
end

module DataStoreRequestType = struct
  type t =
    | GetAsync
    | SetIncrementAsync
    | UpdateAsync
    | GetSortedAsync
    | SetIncrementSortedAsync
    | OnUpdate
    | ListAsync
    | GetVersionAsync
    | RemoveVersionAsync
end

module DeathStyle = struct
  type t =
    | Default
    | ClassicBreakApart
    | NonGraphic
    | Scriptable
end

module DebuggerEndReason = struct
  type t =
    | ClientRequest
    | Timeout
    | InvalidHost
    | Disconnected
    | ServerShutdown
    | ServerProtocolMismatch
    | ConfigurationFailed
    | RpcError
end

module DebuggerExceptionBreakMode = struct
  type t =
    | Never
    | Always
    | Unhandled
end

module DebuggerFrameType = struct
  type t =
    | C
    | Lua
end

module DebuggerPauseReason = struct
  type t =
    | Unknown
    | Requested
    | Breakpoint
    | Exception
    | SingleStep
    | Entrypoint
end

module DebuggerStatus = struct
  type t =
    | Success
    | Timeout
    | ConnectionLost
    | InvalidResponse
    | InternalError
    | InvalidState
    | RpcError
    | InvalidArgument
    | ConnectionClosed
end

module DevCameraOcclusionMode = struct
  type t =
    | Zoom
    | Invisicam
end

module DevComputerCameraMovementMode = struct
  type t =
    | UserChoice
    | Classic
    | Follow
    | Orbital
    | CameraToggle
end

module DevComputerMovementMode = struct
  type t =
    | UserChoice
    | KeyboardMouse
    | ClickToMove
    | Scriptable
end

module DevTouchCameraMovementMode = struct
  type t =
    | UserChoice
    | Classic
    | Follow
    | Orbital
end

module DevTouchMovementMode = struct
  type t =
    | UserChoice
    | Thumbstick
    | DPad
    | Thumbpad
    | ClickToMove
    | Scriptable
    | DynamicThumbstick
end

module DeveloperMemoryTag = struct
  type t =
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
end

module DeviceType = struct
  type t =
    | Unknown
    | Desktop
    | Tablet
    | Phone
end

module DialogBehaviorType = struct
  type t =
    | SinglePlayer
    | MultiplePlayers
end

module DialogPurpose = struct
  type t =
    | Quest
    | Help
    | Shop
end

module DialogTone = struct
  type t =
    | Neutral
    | Friendly
    | Enemy
end

module DominantAxis = struct
  type t =
    | Width
    | Height
end

module DraftStatusCode = struct
  type t =
    | Ok
    | DraftOutdated
    | ScriptRemoved
    | DraftCommitted
end

module DragDetectorDragStyle = struct
  type t =
    | TranslateLine
    | TranslatePlane
    | TranslatePlaneOrLine
    | TranslateLineOrPlane
    | TranslateViewPlane
    | RotateAxis
    | RotateTrackball
    | Scriptable
    | BestForDevice
end

module DragDetectorResponseStyle = struct
  type t =
    | Geometric
    | Physical
    | Custom
end

module DraggerCoordinateSpace = struct
  type t =
    | Object
    | World
end

module DraggerMovementMode = struct
  type t =
    | Geometric
    | Physical
end

module EasingDirection = struct
  type t =
    | In
    | Out
    | InOut
end

module EasingStyle = struct
  type t =
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
end

module EditorLiveScripting = struct
  type t =
    | Default
    | Disabled
    | Enabled
end

module ElasticBehavior = struct
  type t =
    | WhenScrollable
    | Always
    | Never
end

module EnviromentalPhysicsThrottle = struct
  type t =
    | DefaultAuto
    | Disabled
    | Always
    | Skip2
    | Skip4
    | Skip8
    | Skip16
end

module ExperienceAuthScope = struct
  type t =
    | DefaultScope
    | CreatorAssetsCreate
end

module ExplosionType = struct
  type t =
    | NoCraters
    | Craters
end

module FacialAnimationStreamingState = struct
  type t =
    | None
    | Audio
    | Video
    | Place
    | Server
end

module FieldOfViewMode = struct
  type t =
    | Vertical
    | Diagonal
    | MaxAxis
end

module FillDirection = struct
  type t =
    | Horizontal
    | Vertical
end

module FilterResult = struct
  type t =
    | Accepted
    | Rejected
end

module FinishRecordingOperation = struct
  type t =
    | Cancel
    | Commit
    | Append
end

module FluidFidelity = struct
  type t =
    | Automatic
    | UseCollisionGeometry
    | UsePreciseGeometry
end

module FluidForces = struct
  type t =
    | Default
    | Experimental
end

module Font = struct
  type t =
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
end

module FontSize = struct
  type t =
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
end

module FontStyle = struct
  type t =
    | Normal
    | Italic
end

module FontWeight = struct
  type t =
    | Thin
    | ExtraLight
    | Light
    | Regular
    | Medium
    | SemiBold
    | Bold
    | ExtraBold
    | Heavy
end

module ForceLimitMode = struct
  type t =
    | Magnitude
    | PerAxis
end

module FormFactor = struct
  type t =
    | Symmetric
    | Brick
    | Plate
    | Custom
end

module FrameStyle = struct
  type t =
    | Custom
    | ChatBlue
    | RobloxSquare
    | RobloxRound
    | ChatGreen
    | ChatRed
    | DropShadow
end

module FramerateManagerMode = struct
  type t =
    | Automatic
    | On
    | Off
end

module FriendRequestEvent = struct
  type t =
    | Issue
    | Revoke
    | Accept
    | Deny
end

module FriendStatus = struct
  type t =
    | Unknown
    | NotFriend
    | Friend
    | FriendRequestSent
    | FriendRequestReceived
end

module FunctionalTestResult = struct
  type t =
    | Passed
    | Warning
    | Error
end

module GameAvatarType = struct
  type t =
    | R6
    | R15
    | PlayerChoice
end

module GearGenreSetting = struct
  type t =
    | AllGenres
    | MatchingGenreOnly
end

module GearType = struct
  type t =
    | MeleeWeapons
    | RangedWeapons
    | Explosives
    | PowerUps
    | NavigationEnhancers
    | MusicalInstruments
    | SocialItems
    | BuildingTools
    | Transport
end

module Genre = struct
  type t =
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
end

module GraphicsMode = struct
  type t =
    | Automatic
    | Direct3D11
    | OpenGl
    | Metal
    | Vulkan
    | NoGraphics
end

module GuiState = struct
  type t =
    | Idle
    | Hover
    | Press
    | NonInteractable
end

module GuiType = struct
  type t =
    | Core
    | Custom
    | PlayerNameplates
    | CustomBillboards
end

module HandlesStyle = struct
  type t =
    | Resize
    | Movement
end

module HighlightDepthMode = struct
  type t =
    | AlwaysOnTop
    | Occluded
end

module HorizontalAlignment = struct
  type t =
    | Center
    | Left
    | Right
end

module HoverAnimateSpeed = struct
  type t =
    | VerySlow
    | Slow
    | Medium
    | Fast
    | VeryFast
end

module HttpCachePolicy = struct
  type t =
    | None
    | Full
    | DataOnly
    | Default
    | InternalRedirectRefresh
end

module HttpCompression = struct
  type t =
    | None
    | Gzip
end

module HttpContentType = struct
  type t =
    | ApplicationJson
    | ApplicationXml
    | ApplicationUrlEncoded
    | TextPlain
    | TextXml
end

module HttpError = struct
  type t =
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
end

module HttpRequestType = struct
  type t =
    | Default
    | MarketplaceService
    | Players
    | Chat
    | Avatar
    | Analytics
    | Localization
end

module HumanoidCollisionType = struct
  type t =
    | OuterBox
    | InnerBox
end

module HumanoidDisplayDistanceType = struct
  type t =
    | Viewer
    | Subject
    | None
end

module HumanoidHealthDisplayType = struct
  type t =
    | DisplayWhenDamaged
    | AlwaysOn
    | AlwaysOff
end

module HumanoidRigType = struct
  type t =
    | R6
    | R15
end

module HumanoidStateMachineMode = struct
  type t =
    | Default
    | Legacy
    | NoStateMachine
    | LuaStateMachine
end

module HumanoidStateType = struct
  type t =
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
end

module IKCollisionsMode = struct
  type t =
    | NoCollisions
    | OtherMechanismsAnchored
    | IncludeContactedMechanisms
end

module IKControlConstraintSupport = struct
  type t =
    | Default
    | Disabled
    | Enabled
end

module IKControlType = struct
  type t =
    | Transform
    | Position
    | Rotation
    | LookAt
end

module IXPLoadingStatus = struct
  type t =
    | None
    | Pending
    | Initialized
    | ErrorInvalidUser
    | ErrorConnection
    | ErrorJsonParse
    | ErrorTimedOut
end

module ImageCombineType = struct
  type t =
    | BlendSourceOver
    | Overwrite
end

module InOut = struct
  type t =
    | Edge
    | Inset
    | Center
end

module InfoType = struct
  type t =
    | Asset
    | Product
    | GamePass
    | Subscription
    | Bundle
end

module InitialDockState = struct
  type t =
    | Top
    | Bottom
    | Left
    | Right
    | Float
end

module InputType = struct
  type t =
    | NoInput
    | Constant
    | Sin
end

module InterpolationThrottlingMode = struct
  type t =
    | Default
    | Disabled
    | Enabled
end

module InviteState = struct
  type t =
    | Placed
    | Accepted
    | Declined
    | Missed
end

module ItemLineAlignment = struct
  type t =
    | Automatic
    | Start
    | Center
    | End
    | Stretch
end

module JointCreationMode = struct
  type t =
    | All
    | Surface
    | None
end

module KeyCode = struct
  type t =
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
end

module KeyInterpolationMode = struct
  type t =
    | Constant
    | Linear
    | Cubic
end

module KeywordFilterType = struct
  type t =
    | Include
    | Exclude
end

module Language = struct
  type t =
    | Default
end

module LeftRight = struct
  type t =
    | Left
    | Center
    | Right
end

module Limb = struct
  type t =
    | Head
    | Torso
    | LeftArm
    | RightArm
    | LeftLeg
    | RightLeg
    | Unknown
end

module LineJoinMode = struct
  type t =
    | Round
    | Bevel
    | Miter
end

module ListDisplayMode = struct
  type t =
    | Horizontal
    | Vertical
end

module ListenerType = struct
  type t =
    | Camera
    | CFrame
    | ObjectPosition
    | ObjectCFrame
end

module LiveEditingAtomicUpdateResponse = struct
  type t =
    | Success
    | FailureGuidNotFound
    | FailureHashMismatch
    | FailureOperationIllegal
end

module LiveEditingBroadcastMessageType = struct
  type t =
    | Normal
    | Warning
    | Error
end

module LoadCharacterLayeredClothing = struct
  type t =
    | Default
    | Disabled
    | Enabled
end

module LoadDynamicHeads = struct
  type t =
    | Default
    | Disabled
    | Enabled
end

module MarkupKind = struct
  type t =
    | PlainText
    | Markdown
end

module Material = struct
  type t =
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
end

module MaterialPattern = struct
  type t =
    | Regular
    | Organic
end

module MembershipType = struct
  type t =
    | None
    | BuildersClub
    | TurboBuildersClub
    | OutrageousBuildersClub
    | Premium
end

module MeshPartDetailLevel = struct
  type t =
    | DistanceBased
    | Level00
    | Level01
    | Level02
    | Level03
    | Level04
end

module MeshPartHeadsAndAccessories = struct
  type t =
    | Default
    | Disabled
    | Enabled
end

module MeshScaleUnit = struct
  type t =
    | Stud
    | Meter
    | Cm
    | Mm
    | Foot
    | Inch
end

module MeshType = struct
  type t =
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
end

module MessageType = struct
  type t =
    | MessageOutput
    | MessageInfo
    | MessageWarning
    | MessageError
end

module ModelLevelOfDetail = struct
  type t =
    | Automatic
    | StreamingMesh
    | Disabled
end

module ModelStreamingBehavior = struct
  type t =
    | Default
    | Legacy
    | Improved
end

module ModelStreamingMode = struct
  type t =
    | Default
    | Atomic
    | Persistent
    | PersistentPerPlayer
    | Nonatomic
end

module ModifierKey = struct
  type t =
    | Shift
    | Ctrl
    | Alt
    | Meta
end

module MouseBehavior = struct
  type t =
    | Default
    | LockCenter
    | LockCurrentPosition
end

module MoveState = struct
  type t =
    | Stopped
    | Coasting
    | Pushing
    | Stopping
    | AirFree
end

module MuteState = struct
  type t =
    | Unmuted
    | Muted
end

module NameOcclusion = struct
  type t =
    | NoOcclusion
    | EnemyOcclusion
    | OccludeAll
end

module NetworkOwnership = struct
  type t =
    | Automatic
    | Manual
    | OnContact
end

module NormalId = struct
  type t =
    | Right
    | Top
    | Back
    | Left
    | Bottom
    | Front
end

module OperationType = struct
  type t =
    | Null
    | Union
    | Subtraction
    | Intersection
    | Primitive
end

module OrientationAlignmentMode = struct
  type t =
    | OneAttachment
    | TwoAttachment
end

module OutfitSource = struct
  type t =
    | All
    | Created
    | Purchased
end

module OutfitType = struct
  type t =
    | All
    | Avatar
    | DynamicHead
end

module OutputLayoutMode = struct
  type t =
    | Horizontal
    | Vertical
end

module OverrideMouseIconBehavior = struct
  type t =
    | None
    | ForceShow
    | ForceHide
end

module PackagePermission = struct
  type t =
    | None
    | NoAccess
    | Revoked
    | UseView
    | Edit
    | Own
end

module PartType = struct
  type t =
    | Ball
    | Block
    | Cylinder
    | Wedge
    | CornerWedge
end

module ParticleEmitterShape = struct
  type t =
    | Box
    | Sphere
    | Cylinder
    | Disc
end

module ParticleEmitterShapeInOut = struct
  type t =
    | Outward
    | Inward
    | InAndOut
end

module ParticleEmitterShapeStyle = struct
  type t =
    | Volume
    | Surface
end

module ParticleFlipbookLayout = struct
  type t =
    | None
    | Grid2X2
    | Grid4X4
    | Grid8X8
end

module ParticleFlipbookMode = struct
  type t =
    | Loop
    | OneShot
    | PingPong
    | Random
end

module ParticleFlipbookTextureCompatible = struct
  type t =
    | NotCompatible
    | Compatible
    | Unknown
end

module ParticleOrientation = struct
  type t =
    | FacingCamera
    | FacingCameraWorldUp
    | VelocityParallel
    | VelocityPerpendicular
end

module PathStatus = struct
  type t =
    | Success
    | NoPath
    | ClosestNoPath
    | ClosestOutOfRange
    | FailStartNotEmpty
    | FailFinishNotEmpty
end

module PathWaypointAction = struct
  type t =
    | Walk
    | Jump
    | Custom
end

module PermissionLevelShown = struct
  type t =
    | Game
    | RobloxGame
    | RobloxScript
    | Studio
    | Roblox
end

module PhysicsSimulationRate = struct
  type t =
    | Fixed240Hz
    | Fixed120Hz
    | Fixed60Hz
end

module PhysicsSteppingMethod = struct
  type t =
    | Default
    | Fixed
    | Adaptive
end

module Platform = struct
  type t =
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
end

module PlaybackState = struct
  type t =
    | Begin
    | Delayed
    | Playing
    | Paused
    | Completed
    | Cancelled
end

module PlayerActions = struct
  type t =
    | CharacterForward
    | CharacterBackward
    | CharacterLeft
    | CharacterRight
    | CharacterJump
end

module PlayerCharacterDestroyBehavior = struct
  type t =
    | Default
    | Disabled
    | Enabled
end

module PlayerChatType = struct
  type t =
    | All
    | Team
    | Whisper
end

module PoseEasingDirection = struct
  type t =
    | In
    | Out
    | InOut
end

module PoseEasingStyle = struct
  type t =
    | Linear
    | Constant
    | Elastic
    | Cubic
    | Bounce
end

module PositionAlignmentMode = struct
  type t =
    | OneAttachment
    | TwoAttachment
end

module PrimalPhysicsSolver = struct
  type t =
    | Default
    | Experimental
    | Disabled
end

module PrimitiveType = struct
  type t =
    | Null
    | Ball
    | Cylinder
    | Block
    | Wedge
    | CornerWedge
end

module PrivilegeType = struct
  type t =
    | Owner
    | Admin
    | Member
    | Visitor
    | Banned
end

module ProductLocationRestriction = struct
  type t =
    | AvatarShop
    | AllowedGames
    | AllGames
end

module ProductPurchaseDecision = struct
  type t =
    | NotProcessedYet
    | PurchaseGranted
end

module PromptCreateAssetResult = struct
  type t =
    | Success
    | PermissionDenied
    | Timeout
    | UploadFailed
    | NoUserInput
    | UnknownFailure
end

module PromptCreateAvatarResult = struct
  type t =
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
end

module PromptPublishAssetResult = struct
  type t =
    | Success
    | PermissionDenied
    | Timeout
    | UploadFailed
    | NoUserInput
    | UnknownFailure
end

module PropertyStatus = struct
  type t =
    | Ok
    | Warning
    | Error
end

module ProximityPromptExclusivity = struct
  type t =
    | OnePerButton
    | OneGlobally
    | AlwaysShow
end

module ProximityPromptInputType = struct
  type t =
    | Keyboard
    | Gamepad
    | Touch
end

module ProximityPromptStyle = struct
  type t =
    | Default
    | Custom
end

module QualityLevel = struct
  type t =
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
end

module R15CollisionType = struct
  type t =
    | OuterBox
    | InnerBox
end

module RaycastFilterType = struct
  type t =
    | Exclude
    | Include
end

module RejectCharacterDeletions = struct
  type t =
    | Default
    | Disabled
    | Enabled
end

module RenderFidelity = struct
  type t =
    | Automatic
    | Precise
    | Performance
end

module RenderPriority = struct
  type t =
    | First
    | Input
    | Camera
    | Character
    | Last
end

module RenderingTestComparisonMethod = struct
  type t =
    | Psnr
    | Diff
end

module ReplicateInstanceDestroySetting = struct
  type t =
    | Default
    | Disabled
    | Enabled
end

module ResamplerMode = struct
  type t =
    | Default
    | Pixelated
end

module ReservedHighlightId = struct
  type t =
    | Standard
    | Selection
    | Hover
    | Active
end

module RestPose = struct
  type t =
    | Default
    | RotationsReset
    | Custom
end

module ReturnKeyType = struct
  type t =
    | Default
    | Done
    | Go
    | Next
    | Search
    | Send
end

module ReverbType = struct
  type t =
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
end

module RibbonTool = struct
  type t =
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
end

module RigScale = struct
  type t =
    | Default
    | Rthro
    | RthroNarrow
end

module RigType = struct
  type t =
    | R15
    | Custom
    | None
end

module RollOffMode = struct
  type t =
    | Inverse
    | Linear
    | LinearSquare
    | InverseTapered
end

module RotationOrder = struct
  type t =
    | Xyz
    | Xzy
    | Yzx
    | Yxz
    | Zxy
    | Zyx
end

module RotationType = struct
  type t =
    | MovementRelative
    | CameraRelative
end

module RtlTextSupport = struct
  type t =
    | Default
    | Disabled
    | Enabled
end

module RunContext = struct
  type t =
    | Legacy
    | Server
    | Client
    | Plugin
end

module RuntimeUndoBehavior = struct
  type t =
    | Aggregate
    | Snapshot
    | Hybrid
end

module SafeAreaCompatibility = struct
  type t =
    | None
    | FullscreenExtension
end

module SalesTypeFilter = struct
  type t =
    | All
    | Collectibles
    | Premium
end

module SaveAvatarThumbnailCustomizationFailure = struct
  type t =
    | BadThumbnailType
    | BadYRotDeg
    | BadFieldOfViewDeg
    | BadDistanceScale
    | Other
    | Throttled
end

module SaveFilter = struct
  type t =
    | SaveWorld
    | SaveGame
    | SaveAll
end

module SavedQualitySetting = struct
  type t =
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
end

module ScaleType = struct
  type t =
    | Stretch
    | Slice
    | Tile
    | Fit
    | Crop
end

module ScopeCheckResult = struct
  type t =
    | ConsentAccepted
    | InvalidScopes
    | Timeout
    | NoUserInput
    | BackendError
    | UnexpectedError
    | InvalidArgument
    | ConsentDenied
end

module ScreenInsets = struct
  type t =
    | None
    | DeviceSafeInsets
    | CoreUiSafeInsets
    | TopbarSafeInsets
end

module ScreenOrientation = struct
  type t =
    | LandscapeLeft
    | LandscapeRight
    | LandscapeSensor
    | Portrait
    | Sensor
end

module ScrollBarInset = struct
  type t =
    | None
    | ScrollBar
    | Always
end

module ScrollingDirection = struct
  type t =
    | X
    | Y
    | Xy
end

module SelectionBehavior = struct
  type t =
    | Escape
    | Stop
end

module SelectionRenderMode = struct
  type t =
    | Outlines
    | BoundingBoxes
    | Both
end

module SelfViewPosition = struct
  type t =
    | LastPosition
    | TopLeft
    | TopRight
    | BottomLeft
    | BottomRight
end

module SensorMode = struct
  type t =
    | Floor
    | Ladder
end

module SensorUpdateType = struct
  type t =
    | OnRead
    | Manual
end

module ServerAudioBehavior = struct
  type t =
    | Enabled
    | Muted
    | OnlineGame
end

module ServerLiveEditingMode = struct
  type t =
    | Uninitialized
    | Enabled
    | Disabled
end

module ServiceVisibility = struct
  type t =
    | Always
    | Off
    | WithChildren
end

module Severity = struct
  type t =
    | Error
    | Warning
    | Information
    | Hint
end

module SignalBehavior = struct
  type t =
    | Default
    | Immediate
    | Deferred
    | AncestryDeferred
end

module SizeConstraint = struct
  type t =
    | RelativeXy
    | RelativeXx
    | RelativeYy
end

module SolverConvergenceMetricType = struct
  type t =
    | IterationBased
    | AlgorithmAgnostic
end

module SolverConvergenceVisualizationMode = struct
  type t =
    | Disabled
    | PerIsland
    | PerEdge
end

module SortDirection = struct
  type t =
    | Ascending
    | Descending
end

module SortOrder = struct
  type t =
    | Name
    | Custom
    | LayoutOrder
end

module SpecialKey = struct
  type t =
    | Insert
    | Home
    | End
    | PageUp
    | PageDown
    | ChatHotkey
end

module StartCorner = struct
  type t =
    | TopLeft
    | TopRight
    | BottomLeft
    | BottomRight
end

module Status = struct
  type t =
    | Poison
    | Confusion
end

module StreamOutBehavior = struct
  type t =
    | Default
    | LowMemory
    | Opportunistic
end

module StreamingIntegrityMode = struct
  type t =
    | Default
    | Disabled
    | MinimumRadiusPause
    | PauseOutsideLoadedArea
end

module StreamingPauseMode = struct
  type t =
    | Default
    | Disabled
    | ClientPhysicsPause
end

module StudioCloseMode = struct
  type t =
    | None
    | CloseStudio
    | CloseDoc
end

module StudioDataModelType = struct
  type t =
    | Edit
    | PlayClient
    | PlayServer
    | Standalone
    | None
end

module StudioPlaceUpdateFailureReason = struct
  type t =
    | Other
    | TeamCreateConflict
end

module StudioScriptEditorColorCategories = struct
  type t =
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
end

module StudioScriptEditorColorPresets = struct
  type t =
    | RobloxDefault
    | Extra1
    | Extra2
    | Custom
end

module StudioStyleGuideColor = struct
  type t =
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
end

module StudioStyleGuideModifier = struct
  type t =
    | Default
    | Selected
    | Pressed
    | Disabled
    | Hover
end

module Style = struct
  type t =
    | AlternatingSupports
    | BridgeStyleSupports
    | NoSupports
end

module SubscriptionPaymentStatus = struct
  type t =
    | Paid
    | Refunded
end

module SubscriptionPeriod = struct
  type t =
    | Month
end

module SurfaceConstraint = struct
  type t =
    | None
    | Hinge
    | SteppingMotor
    | Motor
end

module SurfaceGuiShape = struct
  type t =
    | Flat
    | CurvedHorizontally
end

module SurfaceGuiSizingMode = struct
  type t =
    | FixedSize
    | PixelsPerStud
end

module SurfaceType = struct
  type t =
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
end

module SwipeDirection = struct
  type t =
    | Right
    | Left
    | Up
    | Down
    | None
end

module TableMajorAxis = struct
  type t =
    | RowMajor
    | ColumnMajor
end

module Technology = struct
  type t =
    | Voxel
    | Compatibility
    | ShadowMap
    | Future
    | Legacy
end

module TeleportMethod = struct
  type t =
    | TeleportToSpawnByName
    | TeleportToPlaceInstance
    | TeleportToPrivateServer
    | TeleportPartyAsync
    | TeleportToVipServer
    | TeleportUnknown
end

module TeleportResult = struct
  type t =
    | Success
    | Failure
    | GameNotFound
    | GameEnded
    | GameFull
    | Unauthorized
    | Flooded
    | IsTeleporting
end

module TeleportState = struct
  type t =
    | RequestedFromServer
    | Started
    | WaitingForServer
    | Failed
    | InProgress
end

module TeleportType = struct
  type t =
    | ToPlace
    | ToInstance
    | ToReservedServer
    | ToVipServer
end

module TerrainAcquisitionMethod = struct
  type t =
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
end

module TerrainFace = struct
  type t =
    | Top
    | Side
    | Bottom
end

module TextChatMessageStatus = struct
  type t =
    | Unknown
    | Success
    | Sending
    | TextFilterFailed
    | Floodchecked
    | InvalidPrivacySettings
    | InvalidTextChannelPermissions
    | MessageTooLong
end

module TextDirection = struct
  type t =
    | Auto
    | LeftToRight
    | RightToLeft
end

module TextFilterContext = struct
  type t =
    | PublicChat
    | PrivateChat
end

module TextInputType = struct
  type t =
    | Default
    | NoSuggestions
    | Number
    | Email
    | Phone
    | Password
    | PasswordShown
    | Username
    | OneTimePassword
end

module TextTruncate = struct
  type t =
    | None
    | AtEnd
end

module TextXAlignment = struct
  type t =
    | Left
    | Right
    | Center
end

module TextYAlignment = struct
  type t =
    | Top
    | Center
    | Bottom
end

module TextureGenerationMeshHandlerUnwrapMode = struct
  type t =
    | Never
    | Always
    | WhenInvalidUVsDetected
end

module TextureMode = struct
  type t =
    | Stretch
    | Wrap
    | Static
end

module TextureQueryType = struct
  type t =
    | NonHumanoid
    | NonHumanoidOrphaned
    | Humanoid
    | HumanoidOrphaned
end

module ThreadPoolConfig = struct
  type t =
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
end

module ThrottlingPriority = struct
  type t =
    | Extreme
    | ElevatedOnServer
    | Default
end

module ThumbnailSize = struct
  type t =
    | Size48X48
    | Size180X180
    | Size420X420
    | Size60X60
    | Size100X100
    | Size150X150
    | Size352X352
end

module ThumbnailType = struct
  type t =
    | HeadShot
    | AvatarBust
    | AvatarThumbnail
end

module TickCountSampleMethod = struct
  type t =
    | Fast
    | Benchmark
    | Precise
end

module TopBottom = struct
  type t =
    | Top
    | Center
    | Bottom
end

module TouchCameraMovementMode = struct
  type t =
    | Default
    | Classic
    | Follow
    | Orbital
end

module TouchMovementMode = struct
  type t =
    | Default
    | Thumbstick
    | DPad
    | Thumbpad
    | ClickToMove
    | DynamicThumbstick
end

module TrackerError = struct
  type t =
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
end

module TrackerExtrapolationFlagMode = struct
  type t =
    | Auto
    | ForceDisabled
    | ExtrapolateFacsAndPose
    | ExtrapolateFacsOnly
end

module TrackerFaceTrackingStatus = struct
  type t =
    | FaceTrackingSuccess
    | FaceTrackingNoFaceFound
    | FaceTrackingUnknown
    | FaceTrackingLost
    | FaceTrackingHasTrackingError
    | FaceTrackingIsOccluded
    | FaceTrackingUninitialized
end

module TrackerLodFlagMode = struct
  type t =
    | Auto
    | ForceFalse
    | ForceTrue
end

module TrackerLodValueMode = struct
  type t =
    | Auto
    | Force0
    | Force1
end

module TrackerMode = struct
  type t =
    | None
    | Audio
    | Video
    | AudioVideo
end

module TrackerPromptEvent = struct
  type t =
    | LodCameraRecommendDisable
end

module TriStateBoolean = struct
  type t =
    | False
    | True
    | Unknown
end

module TweenStatus = struct
  type t =
    | Canceled
    | Completed
end

module UIFlexAlignment = struct
  type t =
    | None
    | Fill
    | SpaceAround
    | SpaceBetween
    | SpaceEvenly
end

module UIFlexMode = struct
  type t =
    | None
    | Grow
    | Shrink
    | Fill
    | Custom
end

module UITheme = struct
  type t =
    | Light
    | Dark
end

module UiMessageType = struct
  type t =
    | UiMessageError
    | UiMessageInfo
end

module UsageContext = struct
  type t =
    | Default
    | Preview
end

module UserCFrame = struct
  type t =
    | Head
    | LeftHand
    | RightHand
    | Floor
end

module UserInputState = struct
  type t =
    | Begin
    | Change
    | End
    | Cancel
    | None
end

module UserInputType = struct
  type t =
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
end

module VRComfortSetting = struct
  type t =
    | Comfort
    | Normal
    | Expert
    | Custom
end

module VRSafetyBubbleMode = struct
  type t =
    | NoOne
    | OnlyFriends
    | Anyone
end

module VRScaling = struct
  type t =
    | World
    | Off
end

module VRSessionState = struct
  type t =
    | Undefined
    | Idle
    | Visible
    | Focused
    | Stopping
end

module VRTouchpad = struct
  type t =
    | Left
    | Right
end

module VRTouchpadMode = struct
  type t =
    | Touch
    | VirtualThumbstick
    | Abxy
end

module VelocityConstraintMode = struct
  type t =
    | Line
    | Plane
    | Vector
end

module VerticalAlignment = struct
  type t =
    | Center
    | Top
    | Bottom
end

module VerticalScrollBarPosition = struct
  type t =
    | Right
    | Left
end

module VibrationMotor = struct
  type t =
    | Large
    | Small
    | LeftTrigger
    | RightTrigger
    | LeftHand
    | RightHand
end

module ViewMode = struct
  type t =
    | None
    | GeometryComplexity
    | Transparent
    | Decal
end

module VirtualCursorMode = struct
  type t =
    | Default
    | Disabled
    | Enabled
end

module VirtualInputMode = struct
  type t =
    | None
    | Recording
    | Playing
end

module VoiceChatState = struct
  type t =
    | Idle
    | Joining
    | JoiningRetry
    | Joined
    | Leaving
    | Ended
    | Failed
end

module VoiceControlPath = struct
  type t =
    | Publish
    | Subscribe
    | Join
end

module VolumetricAudio = struct
  type t =
    | Disabled
    | Automatic
    | Enabled
end

module WaterDirection = struct
  type t =
    | NegX
    | X
    | NegY
    | Y
    | NegZ
    | Z
end

module WaterForce = struct
  type t =
    | None
    | Small
    | Medium
    | Strong
    | Max
end

module WeldConstraintPreserve = struct
  type t =
    | All
    | None
    | Touching
end

module WrapLayerAutoSkin = struct
  type t =
    | Disabled
    | EnabledPreserve
    | EnabledOverride
end

module WrapLayerDebugMode = struct
  type t =
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
end

module WrapTargetDebugMode = struct
  type t =
    | None
    | TargetCageOriginal
    | TargetCageCompressed
    | TargetCageInterface
    | TargetLayerCageOriginal
    | TargetLayerCageCompressed
    | TargetLayerInterface
    | Rbf
    | OuterCageDetail
end

module ZIndexBehavior = struct
  type t =
    | Global
    | Sibling
end

