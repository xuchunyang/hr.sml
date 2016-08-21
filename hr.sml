(* hr.sml --- <hr /> for your terminal
 *
 * Copyright (C) 2016  Chunyang Xu
 *
 * Author: Chunyang Xu <xuchunyang.me@gmail.com>
 * URL: https://github.com/xuchunyang/hr.sml
 * Created: Sun Aug 21 08:16:05 UTC 2016
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Commentary:
 *
 * This is Standard ML port of https://github.com/LuRsT/hr
 *)

fun termWidth () =
  let
      val proc : (TextIO.instream, TextIO.outstream) Unix.proc =
          Unix.execute ("/usr/bin/tput", ["cols"])
      val output = TextIO.inputAll (Unix.textInstreamOf proc)
      val _ = Unix.reap proc
  in
      case Int.fromString output of
          NONE => raise Fail "Can't know Terminal width"
        | SOME width => width
  end

fun makeLine width pattern =
  let
      val fullLine = String.concat (List.tabulate (width, (fn _ => pattern)))
      val line = String.extract (fullLine, 0, SOME width)
  in
      line
  end

fun main () =
  let
      val width = termWidth ()
      val patterns = case CommandLine.arguments () of
                         [] => ["#"]
                       | args => args
  in
      List.app (fn pattern => print (makeLine width pattern)) patterns
  end

val _ = main ()
