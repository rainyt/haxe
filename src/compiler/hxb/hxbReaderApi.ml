open Globals
open Type

class virtual hxb_reader_api = object(self)
	method virtual make_module : path -> string -> module_def
	method virtual add_module : module_def -> unit
	method virtual resolve_type : string list -> string -> string -> module_type
	method virtual basic_types : basic_types
	method virtual get_var_id : int -> int
end
