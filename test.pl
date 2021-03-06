%% gprolog --consult-file test.pl --entry-goal test

:- include(json).

test(A):- print('Running '), print(A), A, print(' passed'),nl, !; print(A), print(' failed'),nl,fail.

test_json_file(JF, JS):- json_decode_file(JF, JO), json_encode(JO, S), atom_codes(JS, S).

test:-
	test(test_json_file('t1.json', _)),
	test(test_json_file('t2.json', _)),
	test(test_json_file('e1.json', _)),
	test(test_json_file('e2.json', _)),
	test(test_json_file('e3.json', _)),
	test(test_json_file('e4.json', _)),
	test(test_json_file('e5.json', _)),
	true.
