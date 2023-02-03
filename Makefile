# open vite dev server
.PHONY: dev
dev:
	npx astro dev

# build vite app with production setting
.PHONY: build
build:
	npx astro build

# preview build result locally
.PHONY: preview
preview:
	npx astro preview

# view astro commands
.PHONY: astro
astro:
	npx astro

# deploy build result to gitHub repo as branch "gh-pages"
.PHONY: deploy
deploy: build
	cd dist && \
	git init && \
	git remote -v | grep -w origin || git remote add origin git@github.com:tzynwang/astro-blog-v2.git && \
	git branch -m gh-pages && \
	git add -A && \
	git commit -m "[feat] deploy as gh-pages `date +'%Y-%m-%d %H:%M:%S'`" && \
	git push -u origin gh-pages -f

