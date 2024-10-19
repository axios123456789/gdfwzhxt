package com.wangwen.gdfwzhxt.manager.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.List;

@Data
@ConfigurationProperties(prefix = "gdfw.auth")
public class UserProperties {
    private List<String> noAuthUrls;
}
