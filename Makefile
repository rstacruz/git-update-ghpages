test: \
	test-basic \
	test-force \
	test-author \
	test-nameemail \
	test-repo \
	test-branch \
	test-branch-env \
	test-keep \
	ok

ok:
	@echo "\n\033[32m✓\033[0;1m Tests pass\033[0m"

test-basic:
	env GITHUB_TOKEN='' ./git-update-ghpages -n user/repo . > .output
	grep "rm -rf" .output >/dev/null
	grep ">/dev/null && tar c .) | tar xv" .output >/dev/null
	grep "git add -A ." .output >/dev/null
	grep "git commit" .output >/dev/null
	grep "git push https://github.com/user/repo.git" .output >/dev/null
	rm .output

test-force:
	env GITHUB_TOKEN='' ./git-update-ghpages -n -f user/repo . > .output
	grep "rm -rf" .output >/dev/null
	grep "git add" .output >/dev/null
	grep "git commit" .output >/dev/null
	grep "git push" .output >/dev/null
	rm .output

test-author:
	env GITHUB_TOKEN='' ./git-update-ghpages -n -a "Xyzxyz" user/repo . > .output
	grep "author Xyzxyz" .output >/dev/null
	rm .output

test-nameemail:
	env GIT_NAME='Xxx' GIT_EMAIL='Yyy' ./git-update-ghpages -e -n user/repo . > .output
	grep "config user.name Xxx" .output >/dev/null
	grep "config user.email Yyy" .output >/dev/null
	rm .output

test-repo:
	env GITHUB_TOKEN='' GITHUB_REPO='xyz/abc' GIT_SOURCE='.' ./git-update-ghpages -n -e > .output
	grep "git push https://github.com/xyz/abc.git" .output >/dev/null
	rm .output

test-branch:
	env GITHUB_TOKEN='' ./git-update-ghpages -n -b gh-pages-custom user/repo . > .output
	grep "git clone https://github.com/user/repo.git . -b gh-pages-custom" .output >/dev/null
	grep "git push https://github.com/user/repo.git gh-pages-custom" .output >/dev/null
	rm .output

test-branch-env:
	env GITHUB_TOKEN='' GIT_BRANCH=gh-pages-custom ./git-update-ghpages -e -n user/repo . > .output
	grep "git clone https://github.com/user/repo.git . -b gh-pages-custom" .output >/dev/null
	grep "git push https://github.com/user/repo.git gh-pages-custom" .output >/dev/null
	rm .output

test-keep:
	env GITHUB_TOKEN='' ./git-update-ghpages -k -n user/repo . > .output
	grep -v 'rm -rf' .output >/dev/null
	rm .output
