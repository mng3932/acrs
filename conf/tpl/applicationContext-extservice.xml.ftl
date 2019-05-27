<?xml version="1.0" encoding="utf-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:aop="http://www.springframework.org/schema/aop"
	xmlns:tx="http://www.springframework.org/schema/tx"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop.xsd http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd"
	default-autowire="byName" default-lazy-init="true">
	
	<!-- extend managers -->
	
	<!--init-->
	<bean id="initDictionUtil"
		class="${hss_base_package}.webapp.util.InitDictionUtil" lazy-init="false" init-method="findAllSysDict">
	</bean>	
	<bean id="constantBean"
		class="${hss_base_package}.common.ConstantBean" autowire="byName" lazy-init="false" init-method="init">
		<property name="propertiesFile" value="sys-conf.properties"></property>
		<property name="propertiesFileDB" value="db-conf.properties"></property>
	</bean>    
    <!-- DWR -->
    <bean id="checkDateUtil" class="${hss_base_package}.webapp.util.CheckDateUtil"></bean>
	<!-- Excel Export manager -->
	<bean id="excelExportSupport"
		class="${hss_base_package}.service.ext.impl.ExcelExportSupportImpl" autowire="byName">
	</bean>
	<!-- Excel Import manager -->
	<bean id="excelImportSupport" class="org.nestframework.importer.impl.ExcelImportSupportImpl" 
    	autowire="byName">
    	<property name="importXmlRootPath" value="$[xmlRootPath]"></property>
    </bean>
	<!-- Upload Photo manager 
	<bean id="uploadPhotoManagerExt"
		class="${hss_base_package}.service.ext.impl.UploadPhotoManagerExt" autowire="byName">
	</bean>-->
</beans>
