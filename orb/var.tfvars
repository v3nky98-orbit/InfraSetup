orb-vpc_name = "orb-vpc-network"

orb-subnet_name = "orb-vpc-subnetwork"

subnet_cidr = "10.154.9.0/24"

region = "us-west1"

container_cidr = "10.0.32.0/20"

services_cidr = "10.4.0.0/14"

gke_cluster_name = "orb-gke-cluster"

gke_location = "us-west1"

gke_initial_node_count = 2

gke_node_version = "1.9.7-gke.5"

gke_min_master_version = "1.9.7-gke.5"

master_cidr = "172.16.0.47/28"

gke_machine_type = "n1-highmem-4"

target_tags = "orb-gke-cluster"

google_compute_firewall_name = "orb-allow-icmp-http"



