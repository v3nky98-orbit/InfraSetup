variable "project"{
    default=""
    description = "The project for the setup"
}


variable "region"{
default=""
    description = "The region for the network"
}

variable "gke_location"{
    default=""
    description = "The location for the gke"
}

variable "orb-vpc_name"{

default=""
    description = "The name for the vpc network"
}

variable "orb-subnet_name"{
default=""
    description = "The name for the subnetwork"
}

variable "subnet_cidr"{
default=""
    description = "The cidr range for the subnetwork"
}

variable "gke_machine_type"{
default=""
    description = "The machine_type for the nodepool"
}

variable "gke_node_version"{
default=""
    description = "The gke_node_version for the gke cluster"
}

variable "gke_min_master_version"{
default=""
    description = "The gke_min_master_version for the gke cluster"
}

variable "gke_initial_node_count"{
default=0
    description = "The gke_initial_node_count for gke cluster"
}

variable "gke_cluster_name"{
default="abc"
    description = "The gke_cluster_name for gke cluster"
}


variable "container_cidr"{
default=""
    description = "The container_cidr for the containers in  gke cluster"
}

variable "services_cidr"{
default=""
    description = "The services_cidr for the services in  gke cluster"
}


variable "master_cidr"{
    default=""
}

variable "google_compute_firewall_name"{
default=""
    description = "The services_cidr for the services in  gke cluster"
}



