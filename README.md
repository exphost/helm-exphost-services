# exphost-services

v1.1.0:
  Required actions:
    - create group "mails" on existing openldap instances


v1.3.0:
  redmine mail issues:
    - manually configure email settings on exsiting redmine
```
    . /opt/bitnami/scripts/libredmine.sh
    if ! is_empty_value "$REDMINE_SMTP_HOST"; then
        for empty_env_var in "REDMINE_SMTP_USER" "REDMINE_SMTP_PASSWORD"; do
            is_empty_value "${!empty_env_var}" && warn "The ${empty_env_var} environment variable is empty or not set."
        done
        is_empty_value "$REDMINE_SMTP_PORT_NUMBER" && print_validation_error "The REDMINE_SMTP_PORT_NUMBER environment variable is empty or not set."
        ! is_empty_value "$REDMINE_SMTP_PORT_NUMBER" && check_valid_port "REDMINE_SMTP_PORT_NUMBER"
        check_multi_value "REDMINE_SMTP_AUTH" "plain login cram_md5"
        if ! is_empty_value "${SMTP_AUTH:-}"; then
            warn "The environment variable SMTP_TLS is set. This configuration will be deprecated soon. Please set REDMINE_PROTOCOL=tls to avoid errors in the future."
            export REDMINE_SMTP_PROTOCOL="tls"
        else
            ! is_empty_value "$REDMINE_SMTP_PROTOCOL" && check_multi_value "REDMINE_SMTP_PROTOCOL" "ssl tls"
        fi
    fi    
```
