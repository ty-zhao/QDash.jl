# Automatically generated using Clang.jl


const IVI_ENGINE_MAJOR_VERSION = 19
const IVI_ENGINE_MINOR_VERSION = 0
const IVI_VIREAL64_MAX = 1.7976931348623157e308
const IVI_VIREAL64_MAX_NEG = -IVI_VIREAL64_MAX
const IVI_VAL_50_HERTZ = 50.0
const IVI_VAL_60_HERTZ = 60.0
const IVI_VAL_400_HERTZ = 400.0
const IVI_VAL_VISA_SESSION_TYPE = "VISA"
const IVI_VAL_NI4882_SESSION_TYPE = "NI-488.2"
const IVI_VAL_NIVXI_SESSION_TYPE = "NI-VXI"
const IVI_VAL_NIDAQ_SESSION_TYPE = "NI-DAQ"
const IVI_VAL_NISERIAL_SESSION_TYPE = "NI-Serial"
const IVI_MAX_MESSAGE_LEN = 255
const IVI_MAX_MESSAGE_BUF_SIZE = IVI_MAX_MESSAGE_LEN + 1
const IVI_VAL_NO_WAIT = 0
const IVI_VAL_WAIT_FOREVER = IVI_VIREAL64_MAX
const IVI_VAL_MAX_TIME_INFINITE = VI_TMO_INFINITE
const IVI_VAL_MAX_TIME_IMMEDIATE = VI_TMO_IMMEDIATE
const IVI_MAX_PATHNAME_LEN = 260
const IVI_MAX_DRIVENAME_LEN = 3
const IVI_MAX_DIRNAME_LEN = 256
const IVI_MAX_FILENAME_LEN = 256
const IVI_VAL_TYPE_NORMAL = 0
const IVI_VAL_TYPE_NAN = 1
const IVI_VAL_TYPE_PINF = 2
const IVI_VAL_TYPE_NINF = 3

# Skipping MacroDefinition: IVI_VAL_NAN ( * Ivi_GetPtrToSpecialViReal64Value ( IVI_VAL_TYPE_NAN ) )
# Skipping MacroDefinition: IVI_VAL_PINF ( * Ivi_GetPtrToSpecialViReal64Value ( IVI_VAL_TYPE_PINF ) )
# Skipping MacroDefinition: IVI_VAL_NINF ( * Ivi_GetPtrToSpecialViReal64Value ( IVI_VAL_TYPE_NINF ) )

const IVI_VAL_NOT_IN_USER_SPECIFIED_STATE = 1
const IVI_VAL_READ_ONLY_ATTR_SET_BY_USER = 2
const IVI_VAL_ATTR_SET_TO_INSTR_SPECIFIC_VALUE = 3
const IVI_VAL_FAILURE_APPLYING_UNUSED_EXTENSION_VALUE = 4
const IVI_VAL_CLASS_DEFINED_INTERCHANGE_WARNING = 5
const IVI_VAL_DISCRETE = 0
const IVI_VAL_RANGED = 1
const IVI_VAL_COERCED = 2

# Skipping MacroDefinition: IVI_RANGE_TABLE_END_STRING ( ( ViString ) ( - 1 ) )
# Skipping MacroDefinition: IVI_RANGE_TABLE_LAST_ENTRY VI_NULL , VI_NULL , VI_NULL , IVI_RANGE_TABLE_END_STRING , VI_NULL

const IVI_VAL_NOT_SUPPORTED = Int32(1) << 0
const IVI_VAL_NOT_READABLE = Int32(1) << 1
const IVI_VAL_NOT_WRITABLE = Int32(1) << 2
const IVI_VAL_NOT_USER_READABLE = Int32(1) << 3
const IVI_VAL_NOT_USER_WRITABLE = Int32(1) << 4
const IVI_VAL_NEVER_CACHE = Int32(1) << 5
const IVI_VAL_ALWAYS_CACHE = Int32(1) << 6
const IVI_VAL_NO_DEFERRED_UPDATE = Int32(1) << 7
const IVI_VAL_DONT_RETURN_DEFERRED_VALUE = Int32(1) << 8
const IVI_VAL_FLUSH_ON_WRITE = Int32(1) << 9
const IVI_VAL_MULTI_CHANNEL = Int32(1) << 10
const IVI_VAL_COERCEABLE_ONLY_BY_INSTR = Int32(1) << 11
const IVI_VAL_WAIT_FOR_OPC_BEFORE_READS = Int32(1) << 12
const IVI_VAL_WAIT_FOR_OPC_AFTER_WRITES = Int32(1) << 13
const IVI_VAL_USE_CALLBACKS_FOR_SIMULATION = Int32(1) << 14
const IVI_VAL_DONT_CHECK_STATUS = Int32(1) << 15
const IVI_VAL_HIDDEN = IVI_VAL_NOT_USER_READABLE | IVI_VAL_NOT_USER_WRITABLE
const IVI_VAL_DIRECT_USER_CALL = 1 << 0
const IVI_VAL_SET_CACHE_ONLY = 1 << 1
const IVI_VAL_DONT_MARK_AS_SET_BY_USER = 1 << 2
const IVI_VAL_ALL_CHANNELS = "IVI_ALL_CHANNELS"
const IVI_VAL_ALL_INSTANCES = IVI_VAL_ALL_CHANNELS
const IVI_VAL_INT32 = Int32(1)
const IVI_VAL_INT64 = Int32(2)
const IVI_VAL_REAL64 = Int32(4)
const IVI_VAL_STRING = Int32(5)
const IVI_VAL_ADDR = Int32(10)
const IVI_VAL_SESSION = Int32(11)
const IVI_VAL_BOOLEAN = Int32(13)
const IVI_VAL_UNKNOWN_TYPE = Int32(14)
const IVI_VAL_READ_CALLBACK = 1
const IVI_VAL_WRITE_CALLBACK = 2
const IVI_VAL_COMPARE_CALLBACK = 3
const IVI_VAL_CHECK_CALLBACK = 4
const IVI_VAL_COERCE_CALLBACK = 5
const IVI_VAL_RANGE_TABLE_CALLBACK = 6
const IVI_VAL_TRUNCATE = 1
const IVI_VAL_APPEND = 2
const IVI_VAL_CLASS_API_DCPWR = 1
const IVI_VAL_CLASS_API_DMM = 2
const IVI_VAL_CLASS_API_FGEN = 3
const IVI_VAL_CLASS_API_SCOPE = 4
const IVI_VAL_CLASS_API_SWTCH = 5
const IVI_STATUS_CODE_BASE = Int32(0x3ffa0000)
const IVI_WARN_BASE = IVI_STATUS_CODE_BASE
const IVI_CROSS_CLASS_WARN_BASE = IVI_WARN_BASE + 0x1000
const IVI_CLASS_WARN_BASE = IVI_WARN_BASE + 0x2000
const IVI_SPECIFIC_WARN_BASE = IVI_WARN_BASE + 0x4000
const IVI_MAX_SPECIFIC_WARN_CODE = IVI_WARN_BASE + Float32(0x07ff)
const IVI_NI_WARN_BASE = IVI_WARN_BASE + 0x6000
const IVI_ERROR_BASE = VI_ERROR + IVI_STATUS_CODE_BASE
const IVI_CROSS_CLASS_ERROR_BASE = IVI_ERROR_BASE + 0x1000
const IVI_CLASS_ERROR_BASE = IVI_ERROR_BASE + 0x2000
const IVI_SPECIFIC_ERROR_BASE = IVI_ERROR_BASE + 0x4000
const IVI_MAX_SPECIFIC_ERROR_CODE = IVI_ERROR_BASE + Float32(0x07ff)
const IVI_NI_ERROR_BASE = IVI_ERROR_BASE + 0x6000
const IVI_SHARED_COMPONENT_ERROR_BASE = IVI_ERROR_BASE + 0x1000
const IVI_WARN_NSUP_ID_QUERY = IVI_WARN_BASE + 0x65
const IVI_WARN_NSUP_RESET = IVI_WARN_BASE + 0x66
const IVI_WARN_NSUP_SELF_TEST = IVI_WARN_BASE + 0x67
const IVI_WARN_NSUP_ERROR_QUERY = IVI_WARN_BASE + 0x68
const IVI_WARN_NSUP_REV_QUERY = IVI_WARN_BASE + 0x69
const IVI_ERROR_CANNOT_RECOVER = IVI_ERROR_BASE + 0x00
const IVI_ERROR_INSTRUMENT_STATUS = IVI_ERROR_BASE + 0x01
const IVI_ERROR_CANNOT_OPEN_FILE = IVI_ERROR_BASE + 0x02
const IVI_ERROR_READING_FILE = IVI_ERROR_BASE + 0x03
const IVI_ERROR_WRITING_FILE = IVI_ERROR_BASE + 0x04
const IVI_ERROR_INVALID_PATHNAME = IVI_ERROR_BASE + 0x0b
const IVI_ERROR_INVALID_ATTRIBUTE = IVI_ERROR_BASE + 0x0c
const IVI_ERROR_IVI_ATTR_NOT_WRITABLE = IVI_ERROR_BASE + 0x0d
const IVI_ERROR_IVI_ATTR_NOT_READABLE = IVI_ERROR_BASE + 0x0e
const IVI_ERROR_INVALID_VALUE = IVI_ERROR_BASE + 0x10
const IVI_ERROR_FUNCTION_NOT_SUPPORTED = IVI_ERROR_BASE + 0x11
const IVI_ERROR_ATTRIBUTE_NOT_SUPPORTED = IVI_ERROR_BASE + 0x12
const IVI_ERROR_VALUE_NOT_SUPPORTED = IVI_ERROR_BASE + 0x13
const IVI_ERROR_TYPES_DO_NOT_MATCH = IVI_ERROR_BASE + 0x15
const IVI_ERROR_NOT_INITIALIZED = IVI_ERROR_BASE + 0x1d
const IVI_ERROR_UNKNOWN_CHANNEL_NAME = IVI_ERROR_BASE + 0x20
const IVI_ERROR_TOO_MANY_OPEN_FILES = IVI_ERROR_BASE + 0x23
const IVI_ERROR_CHANNEL_NAME_REQUIRED = IVI_ERROR_BASE + 0x44
const IVI_ERROR_CHANNEL_NAME_NOT_ALLOWED = IVI_ERROR_BASE + 0x45
const IVI_ERROR_MISSING_OPTION_NAME = IVI_ERROR_BASE + 0x49
const IVI_ERROR_MISSING_OPTION_VALUE = IVI_ERROR_BASE + 0x4a
const IVI_ERROR_BAD_OPTION_NAME = IVI_ERROR_BASE + 0x4b
const IVI_ERROR_BAD_OPTION_VALUE = IVI_ERROR_BASE + 0x4c
const IVI_ERROR_OUT_OF_MEMORY = IVI_ERROR_BASE + 0x56
const IVI_ERROR_OPERATION_PENDING = IVI_ERROR_BASE + 0x57
const IVI_ERROR_NULL_POINTER = IVI_ERROR_BASE + 0x58
const IVI_ERROR_UNEXPECTED_RESPONSE = IVI_ERROR_BASE + 0x59
const IVI_ERROR_FILE_NOT_FOUND = IVI_ERROR_BASE + 0x5b
const IVI_ERROR_INVALID_FILE_FORMAT = IVI_ERROR_BASE + 0x5c
const IVI_ERROR_STATUS_NOT_AVAILABLE = IVI_ERROR_BASE + 0x5d
const IVI_ERROR_ID_QUERY_FAILED = IVI_ERROR_BASE + 0x5e
const IVI_ERROR_RESET_FAILED = IVI_ERROR_BASE + Float32(0x05)
const IVI_ERROR_RESOURCE_UNKNOWN = IVI_ERROR_BASE + 0x60
const IVI_ERROR_CANNOT_CHANGE_SIMULATION_STATE = IVI_ERROR_BASE + 0x62
const IVI_ERROR_INVALID_NUMBER_OF_LEVELS_IN_SELECTOR = IVI_ERROR_BASE + 0x63
const IVI_ERROR_INVALID_RANGE_IN_SELECTOR = IVI_ERROR_BASE + 0x64
const IVI_ERROR_UNKOWN_NAME_IN_SELECTOR = IVI_ERROR_BASE + 0x65
const IVI_ERROR_BADLY_FORMED_SELECTOR = IVI_ERROR_BASE + 0x66
const IVI_ERROR_UNKNOWN_PHYSICAL_IDENTIFIER = IVI_ERROR_BASE + 0x67
const IVI_ERROR_DRIVER_MODULE_NOT_FOUND = IVI_ERROR_BASE + 0x05
const IVI_ERROR_CANNOT_OPEN_DRIVER_MODULE = IVI_ERROR_BASE + 0x06
const IVI_ERROR_INVALID_DRIVER_MODULE = IVI_ERROR_BASE + 0x07
const IVI_ERROR_UNDEFINED_REFERENCES = IVI_ERROR_BASE + 0x08
const IVI_ERROR_FUNCTION_NOT_FOUND = IVI_ERROR_BASE + 0x09
const IVI_ERROR_LOADING_DRIVER_MODULE = IVI_ERROR_BASE + 0x0a
const IVI_ERROR_INVALID_PARAMETER = IVI_ERROR_BASE + Float32(0x00)
const IVI_ERROR_INVALID_TYPE = IVI_ERROR_BASE + 0x14
const IVI_ERROR_MULTIPLE_DEFERRED_SETTING = IVI_ERROR_BASE + 0x16
const IVI_ERROR_ITEM_ALREADY_EXISTS = IVI_ERROR_BASE + 0x17
const IVI_ERROR_INVALID_CONFIGURATION = IVI_ERROR_BASE + 0x18
const IVI_ERROR_VALUE_NOT_AVAILABLE = IVI_ERROR_BASE + 0x19
const IVI_ERROR_ATTRIBUTE_VALUE_NOT_KNOWN = IVI_ERROR_BASE + 0x1a
const IVI_ERROR_NO_RANGE_TABLE = IVI_ERROR_BASE + 0x1b
const IVI_ERROR_INVALID_RANGE_TABLE = IVI_ERROR_BASE + 0x1c
const IVI_ERROR_NON_INTERCHANGEABLE_BEHAVIOR = IVI_ERROR_BASE + 0x1e
const IVI_ERROR_NO_CHANNEL_TABLE = IVI_ERROR_BASE + Float32(0x01)
const IVI_ERROR_SYS_RSRC_ALLOC = IVI_ERROR_BASE + 0x21
const IVI_ERROR_ACCESS_DENIED = IVI_ERROR_BASE + 0x22
const IVI_ERROR_UNABLE_TO_CREATE_TEMP_FILE = IVI_ERROR_BASE + 0x24
const IVI_ERROR_NO_UNUSED_TEMP_FILENAMES = IVI_ERROR_BASE + 0x25
const IVI_ERROR_DISK_FULL = IVI_ERROR_BASE + 0x26
const IVI_ERROR_CONFIG_FILE_NOT_FOUND = IVI_ERROR_BASE + 0x27
const IVI_ERROR_CANNOT_OPEN_CONFIG_FILE = IVI_ERROR_BASE + 0x28
const IVI_ERROR_ERROR_READING_CONFIG_FILE = IVI_ERROR_BASE + 0x29
const IVI_ERROR_BAD_INTEGER_IN_CONFIG_FILE = IVI_ERROR_BASE + 0x2a
const IVI_ERROR_BAD_DOUBLE_IN_CONFIG_FILE = IVI_ERROR_BASE + 0x2b
const IVI_ERROR_BAD_BOOLEAN_IN_CONFIG_FILE = IVI_ERROR_BASE + 0x2c
const IVI_ERROR_CONFIG_ENTRY_NOT_FOUND = IVI_ERROR_BASE + 0x2d
const IVI_ERROR_DRIVER_DLL_INIT_FAILED = IVI_ERROR_BASE + 0x2e
const IVI_ERROR_DRIVER_UNRESOLVED_SYMBOL = IVI_ERROR_BASE + Float32(0x02)
const IVI_ERROR_CANNOT_FIND_CVI_RTE = IVI_ERROR_BASE + 0x30
const IVI_ERROR_CANNOT_OPEN_CVI_RTE = IVI_ERROR_BASE + 0x31
const IVI_ERROR_CVI_RTE_INVALID_FORMAT = IVI_ERROR_BASE + 0x32
const IVI_ERROR_CVI_RTE_MISSING_FUNCTION = IVI_ERROR_BASE + 0x33
const IVI_ERROR_CVI_RTE_INIT_FAILED = IVI_ERROR_BASE + 0x34
const IVI_ERROR_CVI_RTE_UNRESOLVED_SYMBOL = IVI_ERROR_BASE + 0x35
const IVI_ERROR_LOADING_CVI_RTE = IVI_ERROR_BASE + 0x36
const IVI_ERROR_CANNOT_OPEN_DLL_FOR_EXPORTS = IVI_ERROR_BASE + 0x37
const IVI_ERROR_DLL_CORRUPTED = IVI_ERROR_BASE + 0x38
const IVI_ERROR_NO_DLL_EXPORT_TABLE = IVI_ERROR_BASE + 0x39
const IVI_ERROR_UNKNOWN_DEFAULT_SETUP_ATTR = IVI_ERROR_BASE + 0x3a
const IVI_ERROR_INVALID_DEFAULT_SETUP_VAL = IVI_ERROR_BASE + 0x3b
const IVI_ERROR_UNKNOWN_MEMORY_PTR = IVI_ERROR_BASE + 0x3c
const IVI_ERROR_EMPTY_CHANNEL_LIST = IVI_ERROR_BASE + 0x3d
const IVI_ERROR_DUPLICATE_CHANNEL_STRING = IVI_ERROR_BASE + 0x3e
const IVI_ERROR_DUPLICATE_VIRT_CHAN_NAME = IVI_ERROR_BASE + Float32(0x03)
const IVI_ERROR_MISSING_VIRT_CHAN_NAME = IVI_ERROR_BASE + 0x40
const IVI_ERROR_BAD_VIRT_CHAN_NAME = IVI_ERROR_BASE + 0x41
const IVI_ERROR_UNASSIGNED_VIRT_CHAN_NAME = IVI_ERROR_BASE + 0x42
const IVI_ERROR_BAD_VIRT_CHAN_ASSIGNMENT = IVI_ERROR_BASE + 0x43
const IVI_ERROR_ATTR_NOT_VALID_FOR_CHANNEL = IVI_ERROR_BASE + 0x46
const IVI_ERROR_ATTR_MUST_BE_CHANNEL_BASED = IVI_ERROR_BASE + 0x47
const IVI_ERROR_CHANNEL_ALREADY_EXCLUDED = IVI_ERROR_BASE + 0x48
const IVI_ERROR_NOT_CREATED_BY_CLASS = IVI_ERROR_BASE + 0x4d
const IVI_ERROR_IVI_INI_IS_RESERVED = IVI_ERROR_BASE + 0x4e
const IVI_ERROR_DUP_RUNTIME_CONFIG_ENTRY = IVI_ERROR_BASE + Float32(0x04)
const IVI_ERROR_INDEX_IS_ONE_BASED = IVI_ERROR_BASE + 0x50
const IVI_ERROR_INDEX_IS_TOO_HIGH = IVI_ERROR_BASE + 0x51
const IVI_ERROR_ATTR_NOT_CACHEABLE = IVI_ERROR_BASE + 0x52
const IVI_ERROR_ADDR_ATTRS_MUST_BE_HIDDEN = IVI_ERROR_BASE + 0x53
const IVI_ERROR_BAD_CHANNEL_NAME = IVI_ERROR_BASE + 0x54
const IVI_ERROR_BAD_PREFIX_IN_CONFIG_FILE = IVI_ERROR_BASE + 0x55
const IVI_ERROR_CANNOT_MODIFY_REPEATED_CAPABILITY_TABLE = IVI_NI_ERROR_BASE + 0
const IVI_ERROR_CANNOT_RESTRICT_ATTRIBUTE_TWICE = IVI_NI_ERROR_BASE + 1
const IVI_ERROR_REPEATED_CAPABILITY_ALREADY_EXISTS = IVI_NI_ERROR_BASE + 2
const IVI_ERROR_REPEATED_CAPABILITY_NOT_DEFINED = IVI_NI_ERROR_BASE + 3
const IVI_ERROR_INVALID_REPEATED_CAPABILITY_NAME = IVI_NI_ERROR_BASE + 4
const IVI_ERROR_CONFIG_SERVER_NOT_PRESENT = IVI_NI_ERROR_BASE + 0x0d
const IVI_ERROR_REPEATED_CAPABILITY_NAME_REQUIRED = IVI_ERROR_CHANNEL_NAME_REQUIRED
const IVI_ERROR_UNKNOWN_REPEATED_CAPABILITY_NAME = IVI_ERROR_UNKNOWN_CHANNEL_NAME
const IVI_ERROR_EMPTY_REPEATED_CAPABILITY_LIST = IVI_ERROR_EMPTY_CHANNEL_LIST
const IVI_ERROR_DUPLICATE_REPEATED_CAPABILITY_IDENTIFIER = IVI_ERROR_DUPLICATE_CHANNEL_STRING
const IVI_ERROR_REPEATED_CAPABILITY_NAME_NOT_ALLOWED = IVI_ERROR_CHANNEL_NAME_NOT_ALLOWED
const IVI_ERROR_ATTR_NOT_VALID_FOR_REPEATED_CAPABILITY = IVI_ERROR_ATTR_NOT_VALID_FOR_CHANNEL
const IVI_ERROR_ATTR_MUST_BE_REPEATED_CAPABILITY_BASED = IVI_ERROR_ATTR_MUST_BE_CHANNEL_BASED
const IVI_ERROR_BAD_REPEATED_CAPABILITY_NAME = IVI_ERROR_BAD_CHANNEL_NAME
const IVI_ERROR_CANNOT_LOAD_IVI_ENGINE = IVI_ERROR_BASE + 0x00
const IVI_ERROR_INSTR_SPECIFIC = IVI_ERROR_BASE + 0x01
const IVI_ERROR_TOO_MANY_FILES_OPEN = IVI_ERROR_BASE + 0x23
const IVI_ERROR_ALREADY_INITIALIZED = IVI_ERROR_BASE + 0x61

# Skipping MacroDefinition: checkAlloc ( fCall ) if ( ( fCall ) == 0 ) { error = VI_ERROR_ALLOC ; goto Error ; } else error = error
# Skipping MacroDefinition: checkErr ( fCall ) if ( VI_SUCCESS != ( error = ( fCall ) , ( error = ( error < 0 ) ? error : VI_SUCCESS ) ) ) { goto Error ; } else error = error
# Skipping MacroDefinition: checkWarn ( fCall ) if ( ( void ) 1 , 1 ) { ViStatus _code_ ; if ( _code_ = ( fCall ) , _code_ < 0 ) { error = _code_ ; goto Error ; } else error = ( error == 0 ) ? _code_ : error ; } else error = error
# Skipping MacroDefinition: viCheckAlloc ( fCall ) if ( ( fCall ) == 0 ) { error = VI_ERROR_ALLOC ; Ivi_SetErrorInfo ( vi , VI_FALSE , error , 0 , VI_NULL ) ; goto Error ; } else error = error
# Skipping MacroDefinition: viCheckErr ( fCall ) if ( VI_SUCCESS != ( error = ( fCall ) , ( error = ( error < 0 ) ? error : VI_SUCCESS ) ) ) { Ivi_SetErrorInfo ( vi , VI_FALSE , error , 0 , VI_NULL ) ; goto Error ; } else error = error
# Skipping MacroDefinition: viCheckErrElab ( fCall , elab ) if ( VI_SUCCESS != ( error = ( fCall ) , ( error = ( error < 0 ) ? error : VI_SUCCESS ) ) ) { Ivi_SetErrorInfo ( vi , VI_FALSE , error , 0 , elab ) ; goto Error ; } else error = error
# Skipping MacroDefinition: viCheckParm ( fCall , parameterPosition , parameterName ) if ( VI_SUCCESS != ( error = ( fCall ) , ( error = ( error < 0 ) ? ( error ) : VI_SUCCESS ) ) ) { Ivi_SetErrorInfo ( vi , VI_FALSE , error , Ivi_ParamPositionError ( parameterPosition ) , parameterName ) ; goto Error ; } else error = error
# Skipping MacroDefinition: viCheckWarn ( fCall ) if ( ( void ) 1 , 1 ) { ViStatus _code_ ; if ( _code_ = ( fCall ) , _code_ ? Ivi_SetErrorInfo ( vi , VI_FALSE , _code_ , 0 , VI_NULL ) : 0 , _code_ < 0 ) { error = _code_ ; goto Error ; } else error = ( error == 0 ) ? _code_ : error ; } else error = error

const IVI_ATTR_BASE = 1000000
const IVI_ENGINE_PRIVATE_ATTR_BASE = IVI_ATTR_BASE + 0
const IVI_ENGINE_PUBLIC_ATTR_BASE = IVI_ATTR_BASE + 50000
const IVI_SPECIFIC_PUBLIC_ATTR_BASE = IVI_ATTR_BASE + 150000
const IVI_SPECIFIC_PRIVATE_ATTR_BASE = IVI_ATTR_BASE + 200000
const IVI_CLASS_PUBLIC_ATTR_BASE = IVI_ATTR_BASE + 250000
const IVI_CLASS_PRIVATE_ATTR_BASE = IVI_ATTR_BASE + 300000
const IVI_ATTR_NONE = Float32(0x0fffffff)
const IVI_ATTR_RANGE_CHECK = IVI_ENGINE_PUBLIC_ATTR_BASE + 2
const IVI_ATTR_QUERY_INSTRUMENT_STATUS = IVI_ENGINE_PUBLIC_ATTR_BASE + 3
const IVI_ATTR_CACHE = IVI_ENGINE_PUBLIC_ATTR_BASE + 4
const IVI_ATTR_SIMULATE = IVI_ENGINE_PUBLIC_ATTR_BASE + 5
const IVI_ATTR_RECORD_COERCIONS = IVI_ENGINE_PUBLIC_ATTR_BASE + 6
const IVI_ATTR_DRIVER_SETUP = IVI_ENGINE_PUBLIC_ATTR_BASE + 7
const IVI_ATTR_INTERCHANGE_CHECK = IVI_ENGINE_PUBLIC_ATTR_BASE + 21
const IVI_ATTR_SPY = IVI_ENGINE_PUBLIC_ATTR_BASE + 22
const IVI_ATTR_USE_SPECIFIC_SIMULATION = IVI_ENGINE_PUBLIC_ATTR_BASE + 23
const IVI_ATTR_PRIMARY_ERROR = IVI_ENGINE_PUBLIC_ATTR_BASE + 101
const IVI_ATTR_SECONDARY_ERROR = IVI_ENGINE_PUBLIC_ATTR_BASE + 102
const IVI_ATTR_ERROR_ELABORATION = IVI_ENGINE_PUBLIC_ATTR_BASE + 103
const IVI_ATTR_CHANNEL_COUNT = IVI_ENGINE_PUBLIC_ATTR_BASE + 203
const IVI_ATTR_CLASS_DRIVER_PREFIX = IVI_ENGINE_PUBLIC_ATTR_BASE + 301
const IVI_ATTR_SPECIFIC_DRIVER_PREFIX = IVI_ENGINE_PUBLIC_ATTR_BASE + 302
const IVI_ATTR_SPECIFIC_DRIVER_LOCATOR = IVI_ENGINE_PUBLIC_ATTR_BASE + 303
const IVI_ATTR_IO_RESOURCE_DESCRIPTOR = IVI_ENGINE_PUBLIC_ATTR_BASE + 304
const IVI_ATTR_LOGICAL_NAME = IVI_ENGINE_PUBLIC_ATTR_BASE + 305
const IVI_ATTR_VISA_RM_SESSION = IVI_ENGINE_PUBLIC_ATTR_BASE + 321
const IVI_ATTR_SYSTEM_IO_SESSION = IVI_ENGINE_PUBLIC_ATTR_BASE + 322
const IVI_ATTR_IO_SESSION_TYPE = IVI_ENGINE_PUBLIC_ATTR_BASE + 324
const IVI_ATTR_SYSTEM_IO_TIMEOUT = IVI_ENGINE_PUBLIC_ATTR_BASE + 325
const IVI_ATTR_SUPPORTED_INSTRUMENT_MODELS = IVI_ENGINE_PUBLIC_ATTR_BASE + 327
const IVI_ATTR_GROUP_CAPABILITIES = IVI_ENGINE_PUBLIC_ATTR_BASE + 401
const IVI_ATTR_FUNCTION_CAPABILITIES = IVI_ENGINE_PUBLIC_ATTR_BASE + 402
const IVI_ATTR_ENGINE_MAJOR_VERSION = IVI_ENGINE_PUBLIC_ATTR_BASE + 501
const IVI_ATTR_ENGINE_MINOR_VERSION = IVI_ENGINE_PUBLIC_ATTR_BASE + 502
const IVI_ATTR_SPECIFIC_DRIVER_MAJOR_VERSION = IVI_ENGINE_PUBLIC_ATTR_BASE + 503
const IVI_ATTR_SPECIFIC_DRIVER_MINOR_VERSION = IVI_ENGINE_PUBLIC_ATTR_BASE + 504
const IVI_ATTR_CLASS_DRIVER_MAJOR_VERSION = IVI_ENGINE_PUBLIC_ATTR_BASE + 505
const IVI_ATTR_CLASS_DRIVER_MINOR_VERSION = IVI_ENGINE_PUBLIC_ATTR_BASE + 506
const IVI_ATTR_INSTRUMENT_FIRMWARE_REVISION = IVI_ENGINE_PUBLIC_ATTR_BASE + 510
const IVI_ATTR_INSTRUMENT_MANUFACTURER = IVI_ENGINE_PUBLIC_ATTR_BASE + 511
const IVI_ATTR_INSTRUMENT_MODEL = IVI_ENGINE_PUBLIC_ATTR_BASE + 512
const IVI_ATTR_SPECIFIC_DRIVER_VENDOR = IVI_ENGINE_PUBLIC_ATTR_BASE + 513
const IVI_ATTR_SPECIFIC_DRIVER_DESCRIPTION = IVI_ENGINE_PUBLIC_ATTR_BASE + 514
const IVI_ATTR_SPECIFIC_DRIVER_CLASS_SPEC_MAJOR_VERSION = IVI_ENGINE_PUBLIC_ATTR_BASE + 515
const IVI_ATTR_SPECIFIC_DRIVER_CLASS_SPEC_MINOR_VERSION = IVI_ENGINE_PUBLIC_ATTR_BASE + 516
const IVI_ATTR_CLASS_DRIVER_VENDOR = IVI_ENGINE_PUBLIC_ATTR_BASE + 517
const IVI_ATTR_CLASS_DRIVER_DESCRIPTION = IVI_ENGINE_PUBLIC_ATTR_BASE + 518
const IVI_ATTR_CLASS_DRIVER_CLASS_SPEC_MAJOR_VERSION = IVI_ENGINE_PUBLIC_ATTR_BASE + 519
const IVI_ATTR_CLASS_DRIVER_CLASS_SPEC_MINOR_VERSION = IVI_ENGINE_PUBLIC_ATTR_BASE + 520
const IVI_ATTR_SPECIFIC_DRIVER_REVISION = IVI_ENGINE_PUBLIC_ATTR_BASE + 551
const IVI_ATTR_CLASS_DRIVER_REVISION = IVI_ENGINE_PUBLIC_ATTR_BASE + 552
const IVI_ATTR_ENGINE_REVISION = IVI_ENGINE_PUBLIC_ATTR_BASE + 553
const IVI_ATTR_OPC_CALLBACK = IVI_ENGINE_PUBLIC_ATTR_BASE + 602
const IVI_ATTR_CHECK_STATUS_CALLBACK = IVI_ENGINE_PUBLIC_ATTR_BASE + 603
const IVI_ATTR_USER_INTERCHANGE_CHECK_CALLBACK = IVI_ENGINE_PUBLIC_ATTR_BASE + 801
const IVI_VAL_LANG_ENGLISH = Int32(1)
const IVI_VAL_LANG_FRENCH = Int32(2)
const IVI_VAL_LANG_GERMAN = Int32(3)
const IVI_VAL_LANG_JAPANESE = Int32(4)
const IVI_VAL_LANG_KOREAN = Int32(5)
const IVI_VAL_LANG_CHINESE_SIMPLIFIED = Int32(6)
const IVI_ATTR_DEFER_UPDATE = IVI_ENGINE_PUBLIC_ATTR_BASE + 51
const IVI_ATTR_RETURN_DEFERRED_VALUES = IVI_ENGINE_PUBLIC_ATTR_BASE + 52
const IVI_ATTR_BUFFERED_IO_CALLBACK = IVI_ENGINE_PUBLIC_ATTR_BASE + 601
const IVI_ATTR_SUPPORTS_WR_BUF_OPER_MODE = IVI_ENGINE_PUBLIC_ATTR_BASE + 704
const IVI_ATTR_UPDATING_VALUES = IVI_ENGINE_PUBLIC_ATTR_BASE + 708
const IVI_MSG_START_UPDATE = 1
const IVI_MSG_END_UPDATE = 2
const IVI_MSG_SUSPEND = 3
const IVI_MSG_RESUME = 4
const IVI_MSG_FLUSH = 5
#const viBufWrite = Ivi_BufWrite
const IVI_VAL_CHECK_IN_USER_SPECIFIED_STATE = 1
const IVI_VAL_CHECK_READ_ONLY_ATTR_NEVER_SET = 2
const IVI_VAL_CHECK_CALL_CLASS_CALLBACK = 3
const IVI_VAL_CHECK_EXEMPT = 4

# Skipping MacroDefinition: Ivi_Decimalize ( x ) ( ( ( x >> 8 ) * 100 ) + ( ( ( x >> 4 ) & 0xF ) * 10 ) + ( x & 0xF ) )
# Skipping MacroDefinition: Ivi_ConvertVISAVer ( x ) ( ( ( ( x >> 20 ) * 100 ) + ( ( ( x >> 8 ) & 0xFFF ) * 10 ) + ( x & 0xFF ) ) / 100.0 )

const IVI_COMPILER_NAME = "Unknown"
const IVI_COMPILER_VER_NUM = 1.0

# Skipping MacroDefinition: IVI_ATTR_CLASS_PREFIX /* ViString, not writable*/ ( IVI_ENGINE_PUBLIC_ATTR_BASE + 301 )
# Skipping MacroDefinition: IVI_ATTR_SPECIFIC_PREFIX /* ViString, not writable*/ ( IVI_ENGINE_PUBLIC_ATTR_BASE + 302 )
# Skipping MacroDefinition: IVI_ATTR_MODULE_PATHNAME /* ViString, not writable*/ ( IVI_ENGINE_PUBLIC_ATTR_BASE + 303 )
# Skipping MacroDefinition: IVI_ATTR_DRIVER_MAJOR_VERSION /* ViInt32,  not user-writable*/ ( IVI_ENGINE_PUBLIC_ATTR_BASE + 503 )
# Skipping MacroDefinition: IVI_ATTR_DRIVER_MINOR_VERSION /* ViInt32,  not user-writable*/ ( IVI_ENGINE_PUBLIC_ATTR_BASE + 504 )
# Skipping MacroDefinition: IVI_ATTR_CLASS_MAJOR_VERSION /* ViInt32,  not user-writable*/ ( IVI_ENGINE_PUBLIC_ATTR_BASE + 505 )
# Skipping MacroDefinition: IVI_ATTR_CLASS_MINOR_VERSION /* ViInt32,  not user-writable*/ ( IVI_ENGINE_PUBLIC_ATTR_BASE + 506 )
# Skipping MacroDefinition: IVI_ATTR_DRIVER_REVISION /* ViString, not user-writable*/ ( IVI_ENGINE_PUBLIC_ATTR_BASE + 551 )
# Skipping MacroDefinition: IVI_ATTR_CLASS_REVISION /* ViString, not user-writable*/ ( IVI_ENGINE_PUBLIC_ATTR_BASE + 552 )
# Skipping MacroDefinition: IVI_ATTR_FIRMWARE_REVISION /* ViString, not user-writable*/ ( IVI_ENGINE_PUBLIC_ATTR_BASE + 510 )
# Skipping MacroDefinition: IVI_ATTR_SUPPORTED_CLASSES /* ViString, not user-writable*/ ( IVI_ENGINE_PUBLIC_ATTR_BASE + 323 )
# Skipping MacroDefinition: IVI_ATTR_NUM_CHANNELS /* ViInt32,  not writable*/ ( IVI_ENGINE_PUBLIC_ATTR_BASE + 203 )

const IVI_ATTR_QUERY_INSTR_STATUS = IVI_ATTR_QUERY_INSTRUMENT_STATUS
const IVI_ATTR_RESOURCE_DESCRIPTOR = IVI_ATTR_IO_RESOURCE_DESCRIPTOR
const IVI_ATTR_IO_SESSION = IVI_ATTR_SYSTEM_IO_SESSION

# Skipping MacroDefinition: IVI_ATTR_ATTRIBUTE_CAPABILITIES /* ViString, not user-writable*/ ( IVI_ENGINE_PUBLIC_ATTR_BASE + 403 )

#const ViConstString = Ptr{Cint} # moved to visa_common.jl

struct IviRangeTableEntry
    discreteOrMinValue::Cint
    maxValue::Cint
    coercedValue::Cint
    cmdString::Cint
    cmdValue::Cint
end

struct IviRangeTable
    type::Cint
    hasMin::Cint
    hasMax::Cint
    customInfo::Cint
    rangeValues::Ptr{Cvoid}
end

const IviRangeTablePtr = Ptr{IviRangeTable}
const IviConfigStoreHandle = Ptr{Cvoid}

struct IviStringValueEntry
    value::Cint
    string::Cint
end

const IviStringValueTable = Ptr{IviStringValueEntry}
const IviAttrFlags = Cint

struct IviInvalEntry
    attribute::Cint
    allChannels::Cint
end

struct IviLogicalNameEntry
    logicalName::Cint
    fromFile::Cint
end

const IviValueType = Cint
const IviCallbackType = Cint

# Skipping Typedef: CXType_FunctionProto ViStatus
# Skipping Typedef: CXType_FunctionProto _VI_FUNC

const IviMessage = Cint
