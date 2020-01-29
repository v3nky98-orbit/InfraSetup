provider "google-beta"{
    credentials = ""
    project = "${var.project}"
    region = "${var.region}"
    zone = "${var.zone}"
}

provider "google"{
    credentials = ""
    project = "${var.project}"
    region = "${var.region}"
    zone = "${var.zone}"
}