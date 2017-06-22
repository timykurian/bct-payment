package com.bct.utils;

import com.bct.model.PaymentConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@Service
public class PaymentConfigurationHelper {

    private DriverManagerDataSource dataSource;
    private JdbcTemplate jdbcTemplate;
    Map<String, Map<String, String>> configuration;

    public void init() {
        ConfigurationMapper mapper = new ConfigurationMapper();
        jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.query(PaymentDAOQuery.getSysConfigs, new Object[]{}, mapper);
        configuration = mapper.getConfiguration();
    }

    public String getStringValue(String configApp, String configName) {

        Map<String, String> properties = configuration.get(configApp);
        return properties.get(configName);
    }

    public Integer getIntegerValue(String configApp, String configName) {

        Map<String, String> properties = configuration.get(configApp);
        String value = properties.get(configName);
        Integer propertyValue = null;

        try {
            propertyValue = Integer.parseInt(value);
        } catch(NumberFormatException e) { }

        return propertyValue;
    }

    public Float getFloatValue(String configApp, String configName) {

        Map<String, String> properties = configuration.get(configApp);
        String value = properties.get(configName);
        Float propertyValue = null;

        try {
            propertyValue = Float.parseFloat(value);
        } catch(NumberFormatException e) { }

        return propertyValue;
    }
    
    public void setDataSource(DriverManagerDataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    private static class ConfigurationMapper implements RowMapper {

        Map<String, Map<String, String>> configuration = new HashMap<String, Map<String, String>>();
        
        public PaymentConfiguration mapRow(ResultSet rs, int rowNum) throws SQLException {

            String configApp = rs.getString("config_app");
            String configName = rs.getString("config_name");
            String configValue = rs.getString("config_value");
            Map<String, String> unitProperties = configuration.get(configApp);
            
            if (unitProperties == null) {
                unitProperties = new HashMap<String, String>();
            }
            unitProperties.put(configName, configValue);
            configuration.put(configApp, unitProperties);
            
            return null;
        }

        public Map<String, Map<String, String>> getConfiguration() {

            return configuration;
        }
    }
}
