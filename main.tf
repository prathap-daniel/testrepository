provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "us-east-1"
}

resource "aws_instance" "ec2_instance" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    subnet_id = "${var.subnet_id}"
    instance_type = "${var.instance_type}"
    key_name = "${var.ami_key_pair_name}"
    root_block_device {
        kms_key_id = "arn:aws:kms:us-east-1:925924827205:key/mrk-5a565879268547c8b7c7f484f0efa4eb"
        encrypted = "true"
    }
}
