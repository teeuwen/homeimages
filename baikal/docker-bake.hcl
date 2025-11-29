variable "BAIKAL_VERSION" {
  // renovate: datasource=github-releases depName=sabre-io/Baikal
  default = "0.11.0"
}

target "default" {
  args = {
    BAIKAL_VERSION = "${BAIKAL_VERSION}"
  }
  platforms = ["linux/amd64"]
  tags = ["ghcr.io/teeuwen/baikal:${BAIKAL_VERSION}"]
}
