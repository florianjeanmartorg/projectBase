package be.lynk.server.util.geocode;

import com.google.code.geocoder.model.*;
import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.*;
import java.net.URL;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.util.EnumMap;
import java.util.Map;

/**
 * Created by florian on 13/10/15.
 */
public class GeocodeUtil {

    private static final String GEOCODE_REQUEST_HOST         = "maps.googleapis.com";
    private static final String GEOCODE_REQUEST_SERVER_HTTP  = "http://" + GEOCODE_REQUEST_HOST;
    private static final String GEOCODE_REQUEST_SERVER_HTTPS = "https://" + GEOCODE_REQUEST_HOST;
    private static final String GEOCODE_REQUEST_QUERY_BASIC  = "/maps/api/geocode/json?sensor=false";
    private static final String ENCODING                     = "UTF-8";


    private String key;

    public GeocodeUtil(final String key) throws InvalidKeyException {
        this.key = key;
    }


    public GeocodeResponse geocode(final GeocoderRequest geocoderRequest) throws IOException {

        final Gson gson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES).create();

        final String urlString = getURL(geocoderRequest);

        return request(gson, urlString);

    }

    protected GeocodeResponse request(Gson gson, String urlString) throws IOException {
        final URL url = new URL(urlString);
        final Reader reader = new BufferedReader(new InputStreamReader(url.openStream(), ENCODING));
        try {
            return gson.fromJson(reader, GeocodeResponse.class);
        } finally {
            reader.close();
        }
    }

    public static String getGeocoderHost() {
        return GEOCODE_REQUEST_HOST;
    }

    protected String getURL(final GeocoderRequest geocoderRequest) throws UnsupportedEncodingException {
        final StringBuilder url = getURLQuery(geocoderRequest);

        addClientIdAndSignURL(url);

        // add server name to URL
        url.insert(0, GEOCODE_REQUEST_SERVER_HTTPS);

        return url.toString();
    }

    protected StringBuilder getURLQuery(GeocoderRequest geocoderRequest) throws UnsupportedEncodingException {
        final String channel = geocoderRequest.getChannel();
        final String address = geocoderRequest.getAddress();
        final LatLngBounds bounds = geocoderRequest.getBounds();
        final String language = geocoderRequest.getLanguage();
        final String region = geocoderRequest.getRegion();
        final LatLng location = geocoderRequest.getLocation();
        final EnumMap<GeocoderComponent, String> components = geocoderRequest.getComponents();

        final StringBuilder url = new StringBuilder(GEOCODE_REQUEST_QUERY_BASIC);

        if (channel != null && channel.length() > 0) {
            url.append("&channel=").append(URLEncoder.encode(channel, ENCODING));
        }
        if (address != null && address.length() > 0) {
            url.append("&address=").append(URLEncoder.encode(address, ENCODING));
        } else if (location != null) {
            url.append("&latlng=").append(URLEncoder.encode(location.toUrlValue(), ENCODING));
        } else {
            throw new IllegalArgumentException("Address or location must be defined");
        }
        if (language != null && language.length() > 0) {
            url.append("&language=").append(URLEncoder.encode(language, ENCODING));
        }
        if (region != null && region.length() > 0) {
            url.append("&region=").append(URLEncoder.encode(region, ENCODING));
        }
        if (bounds != null) {
            url.append("&bounds=").append(URLEncoder.encode(bounds.getSouthwest().toUrlValue() + "|" + bounds.getNortheast().toUrlValue(), ENCODING));
        }
        if (!components.isEmpty()) {
            url.append("&components=");
            boolean isFirstLine = true;
            for (Map.Entry<GeocoderComponent, String> entry : components.entrySet()) {
                if (isFirstLine) {
                    isFirstLine = false;
                } else {
                    url.append(URLEncoder.encode("|", ENCODING));
                }
                url.append(URLEncoder.encode(entry.getKey().value(), ENCODING));
                url.append(':');
                url.append(URLEncoder.encode(entry.getValue(), ENCODING));
            }

        }
        return url;
    }

    protected void addClientIdAndSignURL(StringBuilder url) throws UnsupportedEncodingException {
        url.append("&key=").append(URLEncoder.encode(key, ENCODING));
    }


}
