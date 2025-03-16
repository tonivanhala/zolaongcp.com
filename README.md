# Static Zola site on Google Cloud

A turn-key deployment for a static website with custom domain on Google Cloud.

This site is built with [Zola](https://www.getzola.org/) and [Serene](https://github.com/isunjn/serene) theme. Github workflow deploys the site to Google Cloud Storage using Terraform.

## How to deploy your own site with custom domain

### Prerequisities

- Install [gcloud CLI](https://cloud.google.com/sdk/docs/install).
- Install [Terraform](https://developer.hashicorp.com/terraform/install).
- Register a custom domain, e.g., [GoDaddy](https://www.godaddy.com) or [Namecheap](https://www.namecheap.com).

### Deployment steps

- Create [a new Github repository using this as a template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).
- Set the `base_url` of your site in `config.toml`. Update `title` and `description`, as well as `extra`->`name` and `extra`->`id`, while you're at it.
- [Create a Google Cloud project](https://developers.google.com/workspace/guides/create-project) for your website (or use existing one).
  * You need to enable [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com) and [Cloud DNS API](https://console.cloud.google.com/apis/api/dns.googleapis.com/overview) for the project.
  * The project needs to be [linked to a billing account](https://cloud.google.com/billing/docs/how-to/modify-project).
- [Authenticate for gcloud CLI and ADC for Terraform](https://cloud.google.com/docs/authentication/gcloud).

  ```bash
  gcloud auth login
  gcloud auth application-default login
  ```

- Bootstrap the remote Terraform state in Google Cloud Storage. Enter your [Google Cloud Project ID](https://support.google.com/googleapi/answer/7014113) when prompted.

  ```bash
  cd bootstrap
  terraform init
  terraform apply
  ```

- Copy the template and fill in values for your Google project ID, domain name, and Github organization and repository name. Initialize Terraform backend with Bootstrapped remote state. Deploy Google Cloud infrastructure with Terraform.

  ```bash
  cd infra
  cp terraform.tfvars.template terraform.tfvars
  # Fill in terraform.tfvars
  ./init.sh
  terraform apply
  ```

- Set Google's nameservers from Terraform output in your domain registrar's DNS.

- Setup [secrets for Github Actions](https://docs.github.com/en/actions/security-for-github-actions/security-guides/using-secrets-in-github-actions).
  * `GOOGLE_PROJECT_ID`: ID of your Google Cloud project, as provided in `terraform.tfvars`.
  * `WEBSITE_BUCKET`: Bucket name from Terraform output.
  * `WORKLOAD_IDENTITY_PROVIDER`: Workload Identity Provider from Terraform output.

## What next?

- Write your first blog post in `content/posts/`. Push to `main` branch to update the site.
- Try local development with dockerized Zola using make targets:

  ```bash
  make build
  make serve
  ```

- This site uses the Serene theme as a submodule. Try out other themes from [Zola Themes](https://www.getzola.org/themes/).
  * Follow the installation instructions for the theme and set the theme in `config.toml`.

## License

The code in this repository is licensed under [the MIT license](./LICENSE).

The site that you build with this repository is not covered by the license. It is yours. You don't need to link to this repository in your site or reference the MIT license.
