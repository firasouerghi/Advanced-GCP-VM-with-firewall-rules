# Advanced GCP VM instance and firewall rules with Terraform 



<!---[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues]][issues-url]
[![MIT License]][license-url]-->

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/firasouerghi/GCP_instance_module">
    <img src="images/logo.png" alt="Logo" width="900" height="300">
  </a>

  <h3 align="center">Advanced GCP instance creation with terraform</h3>

</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#project-structure">Project Structure</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#usage">Usage</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

**This project contains all the necessary steps and files to set up and provision an advanced GCP compute instance hosting an nginx server**


### Project structure

* [version.tf](https://github.com/firasouerghi/GCP_instance_module/blob/main/version.tf)

   `Defines the required version of Terraform and the provider version and repository to use.`

* [provider.tf](https://github.com/firasouerghi/GCP_instance_module/blob/main/provider.tf)

  `Defines the required variables to initialize the Terraform with our provider.`

* [main.tf](https://github.com/firasouerghi/GCP_instance_module/blob/main/main.tf)

  `Defines the main resources that we are going to create.`

* [firewall.tf](https://github.com/firasouerghi/GCP_instance_module/blob/main/firewall.tf)

  `Defines the associated firewall rules to our network resource in our case we are going to allow http, https, ssh, and ICMP protocols.`

* [output.tf](https://github.com/firasouerghi/GCP_instance_module/blob/main/output.tf)

  `Defines the output variables to display once our infrastructure is created: in our case we will output our VM public ip address. `

* [variables.tf](https://github.com/firasouerghi/GCP_instance_module/blob/main/variables.tf)

  `Contains all the variables definitions.`

* [terraform.tfvars](https://github.com/firasouerghi/GCP_instance_module/blob/main/terraform.tfvars)

  `Used to assign values to our variables.`



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* Terraform installation
  ```sh
    $ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    $ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    $ sudo apt-get update && sudo apt-get install terraform
  ```





<!-- USAGE EXAMPLES -->
## Usage

1. Clone the repo
   ```sh
   git clone https://github.com/firasouerghi/Advanced-GCP-VM-with-firewall-rules.git
   ```
2. Make sure to assign the right values to your variables in the [terraform.tfvars](https://github.com/firasouerghi/GCP_instance_module/blob/main/terraform.tfvars) file.

    | Variable | Description |
    |----------|-------|
    `project` | your GCP project ID
    `credentials_file` | Path to your GCP json cridential file
    `ssh_key_file` | path to your ssh public key
    `zone` | your favorite zone
    `region` | your favorite region
    `envvironment` | can be dev, test or prod based on which your going to make your machine type choice
    `machine_types` | is a map { dev  = "f1-micro" test = "n1-highcpu-32" prod = "n1-highcpu-32" } that have the environment type as a key and the machine type as a value



3. Start the infrastructure provisioning
   ```sh
   $ terraform init
   $ terraform validate
   $ terraform plan
   $ terraform apply
   ```
4. Destroy the created infrastructure
   ```sh
      $ terraform destroy
   ```


<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/firasouerghi/GCP_instance_module/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/Feature`)
3. Commit your Changes (`git commit -m 'Add some Feature'`)
4. Push to the Branch (`git push origin feature/Feature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the Apache License 2.0. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact
[![LinkedIn][linkedin-shield]][linkedin-url]

email: [Firas Ouerghi](mailto:ouerghifir@gmail.com) 




<!-- ACKNOWLEDGEMENTS 
## Acknowledgements

* []()-->





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/github_username/repo.svg?style=for-the-badge
[contributors-url]: https://github.com/firasouerghi/
[forks-shield]: https://img.shields.io/github/forks/github_username/repo.svg?style=for-the-badge
[forks-url]: https://github.com/github_username/repo/network/members
[stars-shield]: https://img.shields.io/github/stars/github_username/repo.svg?style=for-the-badge
[stars-url]: https://github.com/github_username/repo/stargazers
[issues-shield]: https://img.shields.io/github/issues/github_username/repo.svg?style=for-the-badge
[license-shield]: https://img.shields.io/github/license/github_username/repo.svg?style=for-the-badge
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555


[issues-url]: https://github.com/firasouerghi/GCP_instance_module/issues
[license-url]: https://github.com/firasouerghi/GCP_instance_module/blob/main/LICENSE
[linkedin-url]: https://linkedin.com/in/firas-ouerghi/
