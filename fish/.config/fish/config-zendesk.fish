# magic used to make my work life easier
alias grid="docker run -it --rm -v ~/.grid.yml:/root/.grid.yml -v /run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" -v ~/.ssh:/root/.ssh -v ~/.aws/credentials:/root/.aws/credentials -v ~/.goship.yaml:/root/.goship.yaml -v ~/.saml2aws:/root/.saml2aws -e TIMEZONE=Europe/Warsaw 724670621497.dkr.ecr.us-east-1.amazonaws.com/grid:stable grid $argv"

set FUTURE_KISS_CONFIG_PROFILE "local"
