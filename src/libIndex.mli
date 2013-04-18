(**************************************************************************)
(*                                                                        *)
(*  Copyright 2013 OCamlPro                                               *)
(*                                                                        *)
(*  All rights reserved.  This file is distributed under the terms of     *)
(*  the GNU Public License version 3.0.                                   *)
(*                                                                        *)
(*  This software is distributed in the hope that it will be useful,      *)
(*  but WITHOUT ANY WARRANTY; without even the implied warranty of        *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *)
(*  GNU General Public License for more details.                          *)
(*                                                                        *)
(**************************************************************************)

type t

type info

(** Helper function, useful to lookup all subdirs of a given path before calling
    [load] *)
val unique_subdirs: string list -> string list

(** load from include dirs *)
val load: string list -> t

val open_module: ?cleanup_path:bool -> t -> string list -> t

val all: t -> info list

val get: t -> string -> info

val complete: t -> string -> info list

val complete_module: t -> string -> info list

val complete_value: t -> ?modul:string -> string -> info list

val complete_type: t -> ?modul:string -> string -> info list

val complete_class: t -> ?modul:string -> string -> info list

val name: info -> string
val ty: info -> string
val doc: info -> string
val loc: info -> string

val format_info: ?color:bool -> Format.formatter -> info -> unit
