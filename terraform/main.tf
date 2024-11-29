provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "nodejs_app" {
  name       = "nodejs-app"
  repository = "./helm/nodejs-app"
  chart      = "."

  values = [
    file("${path.module}/values.yaml")
  ]
}
