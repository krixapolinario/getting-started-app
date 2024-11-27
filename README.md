# Getting started

- [Getting started](#getting-started)
  - [1. GitHub](#1-github)
  - [2. SBOM](#2-sbom)
    - [2.1 Deploy](#21-deploy)
    - [2.2 Edit .env](#22-edit-env)
    - [2.3 Upload SBOM](#23-upload-sbom)
    - [2.4 Cleanup](#24-cleanup)



## 1. GitHub

This repository is a sample application for users following the getting started guide at https://docs.docker.com/get-started/.

The application is based on the application from the getting started tutorial at https://github.com/docker/getting-started



## 2. SBOM

### 2.1 Deploy

```shell
make run
```
Then, you should be able to access the application and dependency track:

```shell
http://localhost:3000/
http://localhost:8080/login
```

### 2.2 Edit .env

Use the `template.env` file to create a `.env` file with secrets. These secretes should be created by logging into dependency track, creating a project and obtaining an API token and the project ID. The default username and password are `admin/admin`.

```shell
http://localhost:8080/login
```

### 2.3 Upload SBOM

Run the following command and go to the project in dependency track. You should now view SBOM report.

```shell
make all
```

### 2.4 Cleanup

```shell
make clean
```



