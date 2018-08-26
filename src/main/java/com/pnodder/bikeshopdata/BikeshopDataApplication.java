package com.pnodder.bikeshopdata;

import com.zaxxer.hikari.HikariDataSource;
import org.jooq.DSLContext;
import org.jooq.SQLDialect;
import org.jooq.impl.DataSourceConnectionProvider;
import org.jooq.impl.DefaultConfiguration;
import org.jooq.impl.DefaultDSLContext;
import org.jooq.impl.DefaultExecuteListenerProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jooq.JooqExceptionTranslator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.TransactionAwareDataSourceProxy;


@SpringBootApplication
public class BikeshopDataApplication {

	public static void main(String[] args) {
		SpringApplication.run(BikeshopDataApplication.class, args);
	}

	@Autowired
	Environment env;

	@Bean
	public HikariDataSource dataSource() {
		HikariDataSource dataSource = new HikariDataSource();
		dataSource.setDataSourceClassName(env.getProperty("app.datasource.driver"));
		dataSource.setJdbcUrl(env.getProperty("app.datasource.url"));
		dataSource.setUsername(env.getProperty("app.datasource.userName"));
		dataSource.setPassword(env.getProperty("app.datasource.password"));
		return dataSource;
	}

	@Bean
	public DataSourceTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}

	@Bean
	public TransactionAwareDataSourceProxy transactionAwareDataSourceProxy() {
		return new TransactionAwareDataSourceProxy(dataSource());
	}

	@Bean
	public DataSourceConnectionProvider connectionProvider() {
		return new DataSourceConnectionProvider(transactionAwareDataSourceProxy());
	}

	@Bean
	public DSLContext dslContext() {
		return new DefaultDSLContext(configuration());
	}

	@Bean
	public DefaultConfiguration configuration() {
		DefaultConfiguration configuration = new DefaultConfiguration();
		configuration.setSQLDialect(SQLDialect.MARIADB);
		configuration.setConnectionProvider(connectionProvider());
		configuration.setExecuteListenerProvider(new DefaultExecuteListenerProvider(new JooqExceptionTranslator()));
		return configuration;
	}

}
