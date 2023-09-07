open Core
module Diff_of_bool : Diff_intf.S with type derived_on = bool and type t = bool
module Diff_of_char : Diff_intf.S with type derived_on = char and type t = char
module Diff_of_float : Diff_intf.S with type derived_on = float and type t = float
module Diff_of_int : Diff_intf.S with type derived_on = int and type t = int
module Diff_of_string : Diff_intf.S with type derived_on = string and type t = string
module Diff_of_unit : Diff_intf.S with type derived_on = unit and type t = unit

module Diff_of_option : sig
  type 'a derived_on = 'a option [@@deriving sexp, bin_io]

  type ('a, 'a_diff) t =
    | Set_to_none
    | Set_to_some of 'a
    | Diff_some of 'a_diff
  [@@deriving sexp, bin_io]

  include
    Diff_intf.S1
      with type 'a derived_on := 'a derived_on
       and type ('a, 'a_diff) t := ('a, 'a_diff) t
end
