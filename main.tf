//create vpc

resource "google_compute_network" "vpc"{
    name = "${var.orb-vpc}"
    auto_create_subnetworks = "false"
}

//create subnet for orb-vpc
resource "google_compute_subnetwork" "subnet"{
    name = "${var.orb-subnet}"
    ip_cidr_range = "${var.subnet_cidr}"
    network = "${var.orb-vpc}"
    depends_on = ["google_compute_network.vpc"]
    region = "${var.region}"
    private_ip_google_access = true
    secondary_ip_range {

        range_name = "orb-containers"
        ip_cidr_range = "${var.container_cidr}"
    }
    secondary_ip_range{
        range_name = "orb-services"
        ip_cidr_range = "${var.services_cidr}"
    }
}


resource "google_container_cluster" "orb-platform-k8s"{
    name = "${var.gke_cluster_name}"
    location = "${var.gke_location}"
    initial_node_count       =  ${var.gke_initial_node_count}
    node_version = "${var.gke_node_version}"
    min_master_version = "${var.gke_min_master_version}"
    depends_on = ["google_compute_subnetwork.subnet"]
    network = "${google_compute_network.vpc.name}"
    subnetwork = "${google_compute_subnetwork.subnet.name}"

    #setting up private cluster 

    master_ip4_cidr_block = "${var.master_cidr}"

    private_cluster = true

    ip_allocation_policy{
        cluster_secondary_name = "orb-containers"
        services_secondary_name = "orb-services"

    }

    master_authorized_networks_config{
        cidr_blocks= [
        {cidr_block = "10.0.0.8/8",display_name = "GCP_PRIVATE_BLOCK"},
        {cidr_block="89.197.133.43/32" , display_name = "ORB Management"}
        
        ]
    ]
    
}

node_config {
    machine_type = "${var.gke_machine_type}"
    labels{
        service = "gke"
    }
    tags = "${var.target_tags}"
}
}

resource "google_compute_firewall" "orb-firewall"{

    name = "${var.google_compute_firewall}"
    network = "${google_compute_network.vpc.name}"

    allow{
        protocol = "icmp"
    }
    allow{
        protocol = "tcp"
        ports = ["80"]
    }
}