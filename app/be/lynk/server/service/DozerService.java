package be.lynk.server.service;

import org.dozer.MappingException;

import java.util.List;

/**
 * Created by florian on 4/05/15.
 */
public interface DozerService {
    <T> T map(Object o, Class<T> aClass) throws MappingException;

    void map(Object o, Object o1) throws MappingException;

    void map(Object o, Object o1, String s) throws MappingException;

    <T> T map(Object o, Class<T> aClass, String s) throws MappingException;

    <T, U> List<T> map(Iterable<U> items, Class<T> klass) throws MappingException;
}
