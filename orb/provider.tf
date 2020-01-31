provider "google-beta"{
    credentials = ""
    project = "${var.project}"
    region = "${var.region}"
    
}

provider "google"{
    credentials = ""
    project = "${var.project}"
    region = "${var.region}"
    
}