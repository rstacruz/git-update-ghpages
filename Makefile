test: \
	test-basic \
	test-force \
	test-author \
	test-nameemail

test-basic:
	./git-update-ghpages -n user/repo . > .output
	grep "rm -rf" .output >/dev/null
	grep "git add" .output >/dev/null
	grep "git commit" .output >/dev/null
	grep "git push" .output >/dev/null
	rm .output

test-force:
	./git-update-ghpages -n -f user/repo . > .output
	grep "rm -rf" .output >/dev/null
	grep "git add" .output >/dev/null
	grep "git commit" .output >/dev/null
	grep "git push" .output >/dev/null
	rm .output

test-author:
	./git-update-ghpages -n -a "Xyzxyz" user/repo . > .output
	grep "author Xyzxyz" .output >/dev/null
	rm .output

test-nameemail:
	env GIT_NAME='Xxx' GIT_EMAIL='Yyy' ./git-update-ghpages -n user/repo . > .output
	grep "config user.name Xxx" .output >/dev/null
	grep "config user.email Yyy" .output >/dev/null
	rm .output


