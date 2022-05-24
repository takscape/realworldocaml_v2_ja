open Core

let%test_unit "List.rev_append is List.append of List.rev" =
  let gen_list =
    List.gen_non_empty (Int.gen_incl Int.min_value Int.max_value)
  in
  Quickcheck.test
    ~sexp_of:[%sexp_of: int list * int list]
    (Quickcheck.Generator.both gen_list gen_list)
    ~f:(fun (l1, l2) ->
      [%test_eq: int list]
        (List.rev_append l1 l2)
        (List.append (List.rev l1) l2))
