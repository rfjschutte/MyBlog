# The development of this site

## Development

To start developing this blog in good quality,
quite a few things where needed. This project started with
the idea of creating a blog with the following key
requirements:

- Writing on the blog should be fast and easy
- No front-end editing of pages
- Use continuous integration (CI) to to integrate
  code into a shared repository
- Analyze the source code quality automatically
- Automating the creation of this software build
- Use continuous deployment for automated deployments

## The tools used in the pipeline of this blog

### Markdown

The code used for this website is Markdown. Markdown
is a plain-text, lightweight markup language
developed in 2004 by John Gruber and Aaron Swartz.

### Git

When working on code it's always a good idea to use a
version control system. For building this blog Git is
used. Git is a free and open source distributed version
control system. Git was created by Linus Torvalds in
2005 for development of the Linux kernel, with other
kernel developers contributing to its initial development

### Gitlab

The GitLab application offers functionality to automate the
entire DevOps life cycle from planning, to creation, build,
verify,security testing, deploying, and monitoring.

### Lint

To analyze the source code quality of this site a
lint(er) is used. lint, or a linter, is a tool
that analyzes source code to flag programming
errors, bugs, stylistic errors, and suspicious
constructs.

### MkDocs

Automating the creation of this software build is
done with MkDocs. MkDocs is a fast and simple static
site generator that's geared towards building project
documentation. Documentation source files are written
in Markdown.

### Ansible

Ansible is a tool to provide a simple way to deploy
applications. It gives you the power to deploy
applications reliably and consistently from one
framework.

## What happens on a site update

### Automated steps

1. User creates/changes a file
2. User adds changes to Git repo
3. User pushes code to Gitlab
4. Gitlab-CI is doing checks on the code
5. Gitlab-CD builds the application with use of MkDocs
6. Ansible deploys the application to the webserver

## Watch out

!!! danger
Do not use anything on this page. This has not been tested!

## Install MkDocs

```bash tab="Ubuntu packages"
sudo apt install python3-pip
```

```bash tab="Centos 7 packages"
sudo yum install epel-release
sudo yum install python34-pip
```

```bash tab="Centos 8 packages"
sudo yum -y install python3-pip
```

```bash tab="Python packages"
pip3 install wheel
pip3 install mkdocs
pip3 install mkdocs-material
pip3 install pymdown-extensions
pip3 install markdown-blockdiag
pip3 install markdown-include
pip3 install mkdocs-pdf-export-plugin
pip3 install mkdocs-git-revision-date-localized-plugin
```

```yaml tab="Gitlab-ci.yaml"
---
stages:
  - test
  - deploytest

codetest:
  stage: test
  tags:
    - mkdocs
    - pip36
  script:
    - mdlint .

testserver:
  stage: deploytest
  tags:
    - mkdocs
    - pip36
  script:
    - ENABLE_PDF_EXPORT=1 mkdocs build
    - sudo cp -avr site/* /var/www/

  artifacts:
    paths:
      - site
  only:
  - master
```

