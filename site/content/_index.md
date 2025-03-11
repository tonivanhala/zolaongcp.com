+++
template = 'home.html'

[extra]
lang = 'en'
+++

A turn-key deployment of Zola site on Google Cloud.

## Deploy your site

See instructions for deploying your own site with custom domain in [the Github repository](https://github.com/tonivanhala/zolaongcp.com) used for this site.

## Features

- Terraform deployment for Google Cloud infrastructure
  * Bootstrap Terraform state in a GCS bucket
  * Create GCS bucket for the static site
  * Setup Load Balancer with HTTPS and certificate for custom domain
  * Setup Google IAM [Workload Identity Federation](https://cloud.google.com/iam/docs/workload-identity-federation) for authenticating from Github Actions
- Github Actions deployment from `main` branch
  * Build a static site in Github Actions using Zola
  * Deploy the static site to Google Cloud Storage

## Credits

- [Zola](https://www.getzola.org/)
- [serene](https://github.com/isunjn/serene) theme for Zola. [MIT License](https://github.com/isunjn/serene/blob/a7e9381cae16acdc98025820b62452a83fa6f8bd/LICENSE).

## License

[MIT license](https://github.com/tonivanhala/zolaongcp.com/blob/main/LICENSE).
