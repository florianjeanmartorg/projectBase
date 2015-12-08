package be.lynk.server.service.impl;

import be.lynk.server.service.DozerService;
import be.lynk.server.util.dozer.MyDozerClassLoader;
import org.dozer.DozerBeanMapper;
import org.dozer.MappingException;
import org.dozer.config.BeanContainer;
import org.springframework.stereotype.Component;
import play.Logger;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by florian on 23/04/15.
 */
@Component
public class DozerServiceImpl implements DozerService {


    private DozerBeanMapper mapper;

    public DozerServiceImpl() {
        if (mapper == null) {
            //initialize mapper
            Logger.info("MAPPER INITIALIZATION");

            DozerBeanMapper dozerBeanMapper = new DozerBeanMapper();

            try {

                BeanContainer.getInstance().setClassLoader(new MyDozerClassLoader());
                dozerBeanMapper.addMapping(getClass().getResourceAsStream("/dozer.xml"));

                mapper = dozerBeanMapper;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public <T> T map(Object o, Class<T> aClass) throws MappingException {
        if (o == null) {
            return null;
        }
        return mapper.map(o, aClass);
    }

    @Override
    public void map(Object o, Object o1) throws MappingException {
        if (o == null) {
            return;
        }
        mapper.map(o, o1);
    }

    @Override
    public void map(Object o, Object o1, String s) throws MappingException {
        if (o == null) {
            return;
        }
        mapper.map(o, o1, s);
    }

    @Override
    public <T> T map(Object o, Class<T> aClass, String s) throws MappingException {
        if (o == null) {
            return null;
        }
        return mapper.map(o, aClass, s);
    }

    @Override
    public <T, U> List<T> map(Iterable<U> items, Class<T> klass) throws MappingException {
        if (items == null) {
            return null;
        }
        List<T> result = new ArrayList<>();
        for (U item : items) {
            result.add(mapper.map(item, klass));
        }
        return result;
    }
}
