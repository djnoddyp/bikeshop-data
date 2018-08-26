package com.pnodder.bikeshopdata;

import org.jooq.DSLContext;
import org.jooq.impl.DSL;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static com.pnodder.bikeshopdata.generated.Tables.BIKE;
import static org.junit.Assert.*;


@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration(classes = BikeshopDataApplication.class)
public class BikeshopDataApplicationTests {

//	@Test
//	public void contextLoads() {
//	}

	@Autowired
	DSLContext sql;

	@Test
	public void simpleSelect() {
		assertEquals(4, sql.select(DSL.count()).from(BIKE).execute());
	}

}
