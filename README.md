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
        info "Configuring SMTP credentials"
        redmine_conf_set "default.email_delivery.delivery_method" ":smtp"
        redmine_conf_set "default.email_delivery.smtp_settings.address" "$REDMINE_SMTP_HOST"
        redmine_conf_set "default.email_delivery.smtp_settings.port" "$REDMINE_SMTP_PORT_NUMBER"
        redmine_conf_set "default.email_delivery.smtp_settings.authentication" "$REDMINE_SMTP_AUTH"
        redmine_conf_set "default.email_delivery.smtp_settings.user_name" "$REDMINE_SMTP_USER"
        redmine_conf_set "default.email_delivery.smtp_settings.password" "$REDMINE_SMTP_PASSWORD"
        # Remove 'USER@' part from e-mail address and use as domain
        redmine_conf_set "default.email_delivery.smtp_settings.domain" "${REDMINE_SMTP_USER//*@/}"
        if [[ "$REDMINE_SMTP_PROTOCOL" = "tls" ]]; then
            redmine_conf_set "default.email_delivery.smtp_settings.enable_starttls_auto" "true"
        else
            redmine_conf_set "default.email_delivery.smtp_settings.enable_starttls_auto" "false"
        fi
    fi
```
