set -o nounset   # Treat unset variables as an error

# ddl to register the meteorites dataset
host=${1:-'http://localhost:19002/query/service'}
nc=${2:-"asterix_nc1"}
cat <<EOF | curl -XPOST --data-binary @- $host 
create dataverse meteorites if not exists;
use meteorites;

create type meteo if not exists as open {
        created_at: date,
        fall: string?,
        geolocation: geometry?,
        id: string,
        mass: string?,
        name: string?,
        nametype: string?,
        recclass: string?,
        reclat: string?,
        reclong: string?,
        year: string?
};

create dataset meteorites_ds(meteo) if not exists primary key id;
create index meteoIndex on meteorites_ds(geolocation);

insert into meteorites.meteorites_ds(
   [
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                6.08333,
        50.775
            )
        ,
        "id": "1",
        "mass": "21",
        "name": "Aachen",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "50.775000",
        "reclong": "6.083330",
        "year": "1880-01-01T00:00:00.000"
    },
    {
        "created_at": "2020-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                10.23333,
        56.18333
            )
        ,
        "id": "2",
        "mass": "720",
        "name": "Aarhus",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "56.183330",
        "reclong": "10.233330",
        "year": "1951-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -113,
        54.21667
            )
        ,
        "id": "6",
        "mass": "107000",
        "name": "Abee",
        "nametype": "Valid",
        "recclass": "EH4",
        "reclat": "54.216670",
        "reclong": "-113.000000",
        "year": "1952-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -99.9,
        16.88333
            )
        ,
        "id": "10",
        "mass": "1914",
        "name": "Acapulco",
        "nametype": "Valid",
        "recclass": "Acapulcoite",
        "reclat": "16.883330",
        "reclong": "-99.900000",
        "year": "1976-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -64.95,
        -33.16667
            )
        ,
        "id": "370",
        "mass": "780",
        "name": "Achiras",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-33.166670",
        "reclong": "-64.950000",
        "year": "1902-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                71.8,
        32.1
            )
        ,
        "id": "379",
        "mass": "4239",
        "name": "Adhi Kot",
        "nametype": "Valid",
        "recclass": "EH4",
        "reclat": "32.100000",
        "reclong": "71.800000",
        "year": "1919-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                95.16667,
        44.83333
            )
        ,
        "id": "390",
        "mass": "910",
        "name": "Adzhi-Bogdo st_make_point(stone)",
        "nametype": "Valid",
        "recclass": "LL3-6",
        "reclat": "44.833330",
        "reclong": "95.166670",
        "year": "1949-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.61667,
        44.21667
            )
        ,
        "id": "392",
        "mass": "30000",
        "name": "Agen",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "44.216670",
        "reclong": "0.616670",
        "year": "1814-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -65.23333,
        -31.6
            )
        ,
        "id": "398",
        "mass": "1620",
        "name": "Aguada",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-31.600000",
        "reclong": "-65.233330",
        "year": "1930-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -64.55,
        -30.86667
            )
        ,
        "id": "417",
        "mass": "1440",
        "name": "Aguila Blanca",
        "nametype": "Valid",
        "recclass": "L",
        "reclat": "-30.866670",
        "reclong": "-64.550000",
        "year": "1920-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -9.57028,
        16.39806
            )
        ,
        "id": "423",
        "mass": "1000",
        "name": "Aioun el Atrouss",
        "nametype": "Valid",
        "recclass": "Diogenite-pm",
        "reclat": "16.398060",
        "reclong": "-9.570280",
        "year": "1974-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8.38333,
        19.08333
            )
        ,
        "id": "424",
        "mass": "24000",
        "name": "Aïr",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "19.083330",
        "reclong": "8.383330",
        "year": "1925-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                2.33333,
        50.66667
            )
        ,
        "id": "425",
        "name": "Aire-sur-la-Lys",
        "nametype": "Valid",
        "recclass": "Unknown",
        "reclat": "50.666670",
        "reclong": "2.333330",
        "year": "1769-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                35.05,
        29.51667
            )
        ,
        "id": "426",
        "mass": "779",
        "name": "Akaba",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "29.516670",
        "reclong": "35.050000",
        "year": "1949-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                77.95,
        29.71667
            )
        ,
        "id": "427",
        "mass": "1800",
        "name": "Akbarpur",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "29.716670",
        "reclong": "77.950000",
        "year": "1838-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8.43333,
        8.91667
            )
        ,
        "id": "432",
        "mass": "3000",
        "name": "Akwanga",
        "nametype": "Valid",
        "recclass": "H",
        "reclat": "8.916670",
        "reclong": "8.433330",
        "year": "1959-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                42.81667,
        39.91667
            )
        ,
        "id": "433",
        "mass": "50000",
        "name": "Akyumak",
        "nametype": "Valid",
        "recclass": "Iron, IVA",
        "reclat": "39.916670",
        "reclong": "42.816670",
        "year": "1981-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                39.51667,
        24.41667
            )
        ,
        "id": "446",
        "mass": "160",
        "name": "Al Rais",
        "nametype": "Valid",
        "recclass": "CR2-an",
        "reclat": "24.416670",
        "reclong": "39.516670",
        "year": "1957-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                28.96,
        13.66033
            )
        ,
        "id": "447",
        "mass": "700",
        "name": "Al Zarnkh",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "13.660330",
        "reclong": "28.960000",
        "year": "2001-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                4.08333,
        44.11667
            )
        ,
        "id": "448",
        "mass": "6000",
        "name": "Alais",
        "nametype": "Valid",
        "recclass": "CI1",
        "reclat": "44.116670",
        "reclong": "4.083330",
        "year": "1806-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                11.01667,
        44.65
            )
        ,
        "id": "453",
        "mass": "2000",
        "name": "Albareto",
        "nametype": "Valid",
        "recclass": "L/LL4",
        "reclat": "44.650000",
        "reclong": "11.016670",
        "year": "1766-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                22.66667,
        2
            )
        ,
        "id": "454",
        "mass": "625",
        "name": "Alberta",
        "nametype": "Valid",
        "recclass": "L",
        "reclat": "2.000000",
        "reclong": "22.666670",
        "year": "1949-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                6.01533,
        45.82133
            )
        ,
        "id": "458",
        "mass": "252",
        "name": "Alby sur Chéran",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "45.821330",
        "reclong": "6.015330",
        "year": "2002-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -1.78333,
        51.78333
            )
        ,
        "id": "461",
        "mass": "700",
        "name": "Aldsworth",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "51.783330",
        "reclong": "-1.783330",
        "year": "1835-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                37.13333,
        36.23333
            )
        ,
        "id": "462",
        "mass": "3200",
        "name": "Aleppo",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "36.233330",
        "reclong": "37.133330",
        "year": "1873-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8.75,
        44.88333
            )
        ,
        "id": "463",
        "mass": "908",
        "name": "Alessandria",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "44.883330",
        "reclong": "8.750000",
        "year": "1860-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                31.81667,
        50.95
            )
        ,
        "id": "465",
        "mass": "9251",
        "name": "Alexandrovsky",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "50.950000",
        "reclong": "31.816670",
        "year": "1900-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                10.15,
        45.26667
            )
        ,
        "id": "466",
        "mass": "228000",
        "name": "Alfianello",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "45.266670",
        "reclong": "10.150000",
        "year": "1883-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "50",
        ":@computed_region_nnqa_25f4": "429",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -85.88333,
        42.53333
            )
        ,
        "id": "2276",
        "mass": "32000",
        "name": "Allegan",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "42.533330",
        "reclong": "-85.883330",
        "year": "1899-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -105.31667,
        26.96667
            )
        ,
        "id": "2278",
        "mass": "2000000",
        "name": "Allende",
        "nametype": "Valid",
        "recclass": "CV3",
        "reclat": "26.966670",
        "reclong": "-105.316670",
        "year": "1969-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                32.41275,
        20.74575
            )
        ,
        "id": "48915",
        "mass": "3950",
        "name": "Almahata Sitta",
        "nametype": "Valid",
        "recclass": "Ureilite-an",
        "reclat": "20.745750",
        "reclong": "32.412750",
        "year": "2008-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                44.21556,
        35.27333
            )
        ,
        "id": "2284",
        "mass": "6000",
        "name": "Alta'ameem",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "35.273330",
        "reclong": "44.215560",
        "year": "1977-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.25,
        27.66667
            )
        ,
        "id": "2290",
        "mass": "6400",
        "name": "Ambapur Nagla",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "27.666670",
        "reclong": "78.250000",
        "year": "1895-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                85.56667,
        26.58333
            )
        ,
        "id": "2294",
        "mass": "2700",
        "name": "Andhara",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "26.583330",
        "reclong": "85.566670",
        "year": "1880-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "49",
        ":@computed_region_nnqa_25f4": "1723",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -70.75,
        44.61667
            )
        ,
        "id": "2295",
        "mass": "3200",
        "name": "Andover",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "44.616670",
        "reclong": "-70.750000",
        "year": "1898-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                37.5,
        48.7
            )
        ,
        "id": "2296",
        "mass": "600",
        "name": "Andreevka",
        "nametype": "Valid",
        "recclass": "L3",
        "reclat": "48.700000",
        "reclong": "37.500000",
        "year": "1969-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.86667,
        20.88333
            )
        ,
        "id": "2298",
        "mass": "17900",
        "name": "Andura",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "20.883330",
        "reclong": "76.866670",
        "year": "1939-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Found",
        "geolocation": 
            
            st_make_point(
                0,
        0
            )
        ,
        "id": "50693",
        "mass": "256.8",
        "name": "Northwest Africa 5815",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "0.000000",
        "reclong": "0.000000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -0.55,
        47.46667
            )
        ,
        "id": "2301",
        "name": "Angers",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "47.466670",
        "reclong": "-0.550000",
        "year": "1822-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -44.31667,
        -22.96667
            )
        ,
        "id": "2302",
        "mass": "1500",
        "name": "Angra dos Reis st_make_point(stone)",
        "nametype": "Valid",
        "recclass": "Angrite",
        "reclat": "-22.966670",
        "reclong": "-44.316670",
        "year": "1869-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                39.71667,
        9.53333
            )
        ,
        "id": "2304",
        "mass": "6500",
        "name": "Ankober",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "9.533330",
        "reclong": "39.716670",
        "year": "1942-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                105.18333,
        25.15
            )
        ,
        "id": "2305",
        "mass": "2500",
        "name": "Anlong",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "25.150000",
        "reclong": "105.183330",
        "year": "1971-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                140.78556,
        40.81056
            )
        ,
        "id": "2313",
        "mass": "320",
        "name": "Aomori",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "40.810560",
        "reclong": "140.785560",
        "year": "1984-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -2.71667,
        53.58333
            )
        ,
        "id": "2318",
        "mass": "15000",
        "name": "Appley Bridge",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "53.583330",
        "reclong": "-2.716670",
        "year": "1914-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                5.38333,
        43.86667
            )
        ,
        "id": "2320",
        "mass": "3200",
        "name": "Apt",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "43.866670",
        "reclong": "5.383330",
        "year": "1803-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -66,
        -33
            )
        ,
        "id": "2325",
        "mass": "810",
        "name": "Arbol Solo",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-33.000000",
        "reclong": "-66.000000",
        "year": "1954-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "18",
        ":@computed_region_nnqa_25f4": "2697",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -94.3,
        38.5
            )
        ,
        "id": "2329",
        "mass": "5070",
        "name": "Archie",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "38.500000",
        "reclong": "-94.300000",
        "year": "1932-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -60.66667,
        -31.41667
            )
        ,
        "id": "2340",
        "mass": "7450",
        "name": "Arroyo Aguiar",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-31.416670",
        "reclong": "-60.666670",
        "year": "1950-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                9.03333,
        42.45
            )
        ,
        "id": "2345",
        "mass": "41",
        "name": "Asco",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "42.450000",
        "reclong": "9.033330",
        "year": "1805-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "23",
        ":@computed_region_nnqa_25f4": "774",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -97.01,
        31.805
            )
        ,
        "id": "48954",
        "mass": "9500",
        "name": "Ash Creek",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "31.805000",
        "reclong": "-97.010000",
        "year": "2009-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.3,
        52.05
            )
        ,
        "id": "2346",
        "mass": "1300",
        "name": "Ashdon",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "52.050000",
        "reclong": "0.300000",
        "year": "1923-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                12.55,
        43.03333
            )
        ,
        "id": "2353",
        "mass": "2000",
        "name": "Assisi",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "43.033330",
        "reclong": "12.550000",
        "year": "1886-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                80.625,
        25.25417
            )
        ,
        "id": "4883",
        "mass": "1280",
        "name": "Atarra",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "25.254170",
        "reclong": "80.625000",
        "year": "1920-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -103.66667,
        20.06667
            )
        ,
        "id": "4884",
        "mass": "94.2",
        "name": "Atemajac",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "20.066670",
        "reclong": "-103.666670",
        "year": "1896-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "29",
        ":@computed_region_nnqa_25f4": "3134",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -87,
        34.75
            )
        ,
        "id": "4885",
        "mass": "265",
        "name": "Athens",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "34.750000",
        "reclong": "-87.000000",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "20",
        ":@computed_region_nnqa_25f4": "602",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -96.15,
        34.31667
            )
        ,
        "id": "4888",
        "mass": "1384.2",
        "name": "Atoka",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "34.316670",
        "reclong": "-96.150000",
        "year": "1945-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                5.16667,
        44.38333
            )
        ,
        "id": "4893",
        "mass": "800",
        "name": "Aubres",
        "nametype": "Valid",
        "recclass": "Aubrite",
        "reclat": "44.383330",
        "reclong": "5.166670",
        "year": "1836-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                3.66667,
        36.16667
            )
        ,
        "id": "4899",
        "mass": "50000",
        "name": "Aumale",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "36.166670",
        "reclong": "3.666670",
        "year": "1865-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                3.23333,
        44.33333
            )
        ,
        "id": "4900",
        "mass": "2000",
        "name": "Aumieres",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "44.333330",
        "reclong": "3.233330",
        "year": "1842-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.58333,
        43.08333
            )
        ,
        "id": "4903",
        "mass": "50000",
        "name": "Ausson",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "43.083330",
        "reclong": "0.583330",
        "year": "1858-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -49.95083,
        -21.46028
            )
        ,
        "id": "4905",
        "mass": "9330",
        "name": "Avanhandava",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "-21.460280",
        "reclong": "-49.950830",
        "year": "1952-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                13.5,
        46
            )
        ,
        "id": "4906",
        "mass": "1230",
        "name": "Avce",
        "nametype": "Valid",
        "recclass": "Iron, IIAB",
        "reclat": "46.000000",
        "reclong": "13.500000",
        "year": "1908-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -103.5,
        25
            )
        ,
        "id": "4907",
        "mass": "146",
        "name": "Avilez",
        "nametype": "Valid",
        "recclass": "H",
        "reclat": "25.000000",
        "reclong": "-103.500000",
        "year": "1855-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                32.83333,
        2.71667
            )
        ,
        "id": "4910",
        "mass": "134",
        "name": "Awere",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "2.716670",
        "reclong": "32.833330",
        "year": "1968-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "11",
        ":@computed_region_nnqa_25f4": "1989",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -108,
        36.8
            )
        ,
        "id": "4913",
        "mass": "2830",
        "name": "Aztec",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "36.800000",
        "reclong": "-108.000000",
        "year": "1938-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                38,
        48.6
            )
        ,
        "id": "4917",
        "mass": "18000",
        "name": "Bachmut",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "48.600000",
        "reclong": "38.000000",
        "year": "1814-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.5,
        28.48333
            )
        ,
        "id": "4922",
        "mass": "10322",
        "name": "Bahjoi",
        "nametype": "Valid",
        "recclass": "Iron, IAB-sLL",
        "reclat": "28.483330",
        "reclong": "78.500000",
        "year": "1934-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "37",
        ":@computed_region_nnqa_25f4": "2373",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -82.48333,
        35.96667
            )
        ,
        "id": "4925",
        "mass": "3700",
        "name": "Bald Mountain",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "35.966670",
        "reclong": "-82.483330",
        "year": "1929-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "32",
        ":@computed_region_nnqa_25f4": "495",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -88.66667,
        34.5
            )
        ,
        "id": "4926",
        "mass": "345",
        "name": "Baldwyn",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "34.500000",
        "reclong": "-88.666670",
        "year": "1922-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                16.38333,
        5.38333
            )
        ,
        "id": "4928",
        "mass": "1000",
        "name": "Bali",
        "nametype": "Valid",
        "recclass": "CV3",
        "reclat": "5.383330",
        "reclong": "16.383330",
        "year": "1907-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                101.18333,
        16.66667
            )
        ,
        "id": "4934",
        "mass": "16700",
        "name": "Ban Rong Du",
        "nametype": "Valid",
        "recclass": "Iron, ungrouped",
        "reclat": "16.666670",
        "reclong": "101.183330",
        "year": "1993-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                107.6,
        -6.91667
            )
        ,
        "id": "4935",
        "mass": "11500",
        "name": "Bandong",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "-6.916670",
        "reclong": "107.600000",
        "year": "1871-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.33333,
        27.7
            )
        ,
        "id": "4936",
        "mass": "15000",
        "name": "Bansur",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "27.700000",
        "reclong": "76.333330",
        "year": "1892-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.2,
        30.4
            )
        ,
        "id": "4937",
        "mass": "14",
        "name": "Banswal",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "30.400000",
        "reclong": "78.200000",
        "year": "1913-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                106,
        -6.33333
            )
        ,
        "id": "4938",
        "mass": "629",
        "name": "Banten",
        "nametype": "Valid",
        "recclass": "CM2",
        "reclat": "-6.333330",
        "reclong": "106.000000",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -0.05,
        43.95
            )
        ,
        "id": "4942",
        "mass": "6400",
        "name": "Barbotan",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "43.950000",
        "reclong": "-0.050000",
        "year": "1790-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                2.16667,
        41.36667
            )
        ,
        "id": "4944",
        "name": "Barcelona st_make_point(stone)",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "41.366670",
        "reclong": "2.166670",
        "year": "1704-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -2.5,
        42.38333
            )
        ,
        "id": "4946",
        "mass": "3200",
        "name": "Barea",
        "nametype": "Valid",
        "recclass": "Mesosiderite-A1",
        "reclat": "42.383330",
        "reclong": "-2.500000",
        "year": "1842-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                84.08333,
        52.73333
            )
        ,
        "id": "4947",
        "mass": "23.2",
        "name": "Barnaul",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "52.733330",
        "reclong": "84.083330",
        "year": "1904-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                9.1,
        52
            )
        ,
        "id": "4948",
        "mass": "17",
        "name": "Barntrup",
        "nametype": "Valid",
        "recclass": "LL4",
        "reclat": "52.000000",
        "reclong": "9.100000",
        "year": "1886-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.8,
        31.61667
            )
        ,
        "id": "4949",
        "mass": "4500",
        "name": "Baroti",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "31.616670",
        "reclong": "76.800000",
        "year": "1910-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -1.33972,
        52.56528
            )
        ,
        "id": "4954",
        "mass": "44000",
        "name": "Barwell",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "52.565280",
        "reclong": "-1.339720",
        "year": "1965-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -5.9,
        15.78333
            )
        ,
        "id": "44876",
        "mass": "29560",
        "name": "Bassikounou",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "15.783330",
        "reclong": "-5.900000",
        "year": "2006-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                20.93583,
        52.03333
            )
        ,
        "id": "4957",
        "mass": "15500",
        "name": "Baszkówka",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "52.033330",
        "reclong": "20.935830",
        "year": "1994-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "21",
        ":@computed_region_nnqa_25f4": "662",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -98.31667,
        45.41667
            )
        ,
        "id": "4974",
        "mass": "21000",
        "name": "Bath",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "45.416670",
        "reclong": "-98.316670",
        "year": "1892-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "36",
        ":@computed_region_nnqa_25f4": "1921",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -83.75,
        38.25
            )
        ,
        "id": "4975",
        "mass": "86000",
        "name": "Bath Furnace",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "38.250000",
        "reclong": "-83.750000",
        "year": "1902-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "10",
        ":@computed_region_nnqa_25f4": "2397",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -117.18913,
        40.66813
            )
        ,
        "id": "56133",
        "mass": "2900",
        "name": "Battle Mountain",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "40.668130",
        "reclong": "-117.189130",
        "year": "2012-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -0.18333,
        11.08333
            )
        ,
        "id": "4976",
        "mass": "1557",
        "name": "Bawku",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "11.083330",
        "reclong": "-0.183330",
        "year": "1989-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "18",
        ":@computed_region_nnqa_25f4": "2216",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -93.5,
        36.75
            )
        ,
        "id": "4977",
        "mass": "611",
        "name": "Baxter",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "36.750000",
        "reclong": "-93.500000",
        "year": "1916-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "17",
        ":@computed_region_nnqa_25f4": "1285",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -101.2,
        39.8
            )
        ,
        "id": "4984",
        "mass": "16000",
        "name": "Beardsley",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "39.800000",
        "reclong": "-101.200000",
        "year": "1929-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -117.33333,
        51.16667
            )
        ,
        "id": "4986",
        "mass": "14000",
        "name": "Beaver Creek",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "51.166670",
        "reclong": "-117.333330",
        "year": "1893-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -4.1,
        53.01667
            )
        ,
        "id": "4993",
        "mass": "794",
        "name": "Beddgelert",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "53.016670",
        "reclong": "-4.100000",
        "year": "1949-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "23",
        ":@computed_region_nnqa_25f4": "1978",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -96.46667,
        33.6
            )
        ,
        "id": "5005",
        "mass": "375",
        "name": "Bells",
        "nametype": "Valid",
        "recclass": "C2-ung",
        "reclat": "33.600000",
        "reclong": "-96.466670",
        "year": "1961-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -64.86667,
        -32.33333
            )
        ,
        "id": "5009",
        "name": "Belville",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "-32.333330",
        "reclong": "-64.866670",
        "year": "1937-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                82.91667,
        25.36667
            )
        ,
        "id": "5011",
        "mass": "3700",
        "name": "Benares st_make_point(a)",
        "nametype": "Valid",
        "recclass": "LL4",
        "reclat": "25.366670",
        "reclong": "82.916670",
        "year": "1798-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -8.15,
        32.25
            )
        ,
        "id": "30443",
        "mass": "25000",
        "name": "Benguerir",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "32.250000",
        "reclong": "-8.150000",
        "year": "2004-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                10.8,
        32.86667
            )
        ,
        "id": "5018",
        "mass": "19000",
        "name": "Beni M'hira",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "32.866670",
        "reclong": "10.800000",
        "year": "2001-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "34",
        ":@computed_region_nnqa_25f4": "1869",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -89.15,
        39.08333
            )
        ,
        "id": "5021",
        "mass": "1770.5",
        "name": "Benld",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "39.083330",
        "reclong": "-89.150000",
        "year": "1938-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                28.41667,
        -26.16667
            )
        ,
        "id": "5023",
        "mass": "3880",
        "name": "Benoni",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "-26.166670",
        "reclong": "28.416670",
        "year": "1943-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -7,
        30
            )
        ,
        "id": "5024",
        "mass": "45000",
        "name": "Bensour",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "30.000000",
        "reclong": "-7.000000",
        "year": "2002-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -67.55,
        45.95
            )
        ,
        "id": "5026",
        "mass": "2840",
        "name": "Benton",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "45.950000",
        "reclong": "-67.550000",
        "year": "1949-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -58.32833,
        -31.91
            )
        ,
        "id": "48975",
        "mass": "270",
        "name": "Berduc",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-31.910000",
        "reclong": "-58.328330",
        "year": "2008-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -3.65,
        11.65
            )
        ,
        "id": "5028",
        "mass": "18000",
        "name": "Béréba",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "11.650000",
        "reclong": "-3.650000",
        "year": "1924-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -3.8,
        41.68333
            )
        ,
        "id": "5029",
        "mass": "1440",
        "name": "Berlanguillas",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "41.683330",
        "reclong": "-3.800000",
        "year": "1811-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "9",
        ":@computed_region_nnqa_25f4": "1072",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -105.02325,
        40.30583
            )
        ,
        "id": "47355",
        "mass": "960",
        "name": "Berthoud",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "40.305830",
        "reclong": "-105.023250",
        "year": "2004-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "47",
        ":@computed_region_nnqa_25f4": "2030",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -73.83333,
        42.53333
            )
        ,
        "id": "5032",
        "mass": "13.9",
        "name": "Bethlehem",
        "nametype": "Valid",
        "recclass": "H",
        "reclat": "42.533330",
        "reclong": "-73.833330",
        "year": "1859-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -0.23333,
        43.21667
            )
        ,
        "id": "5034",
        "mass": "2000",
        "name": "Beuste",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "43.216670",
        "reclong": "-0.233330",
        "year": "1859-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                35.5,
        33.88333
            )
        ,
        "id": "5035",
        "mass": "1100",
        "name": "Beyrout",
        "nametype": "Valid",
        "recclass": "LL3.8",
        "reclat": "33.883330",
        "reclong": "35.500000",
        "year": "1921-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                74.83333,
        20.88333
            )
        ,
        "id": "5037",
        "mass": "18",
        "name": "Bhagur",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "20.883330",
        "reclong": "74.833330",
        "year": "1877-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                73.11528,
        26.50833
            )
        ,
        "id": "36591",
        "mass": "678",
        "name": "Bhawad",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "26.508330",
        "reclong": "73.115280",
        "year": "2002-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                71.46667,
        20.83333
            )
        ,
        "id": "5039",
        "mass": "100",
        "name": "Bherai",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "20.833330",
        "reclong": "71.466670",
        "year": "1893-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                90.65,
        22.68333
            )
        ,
        "id": "5040",
        "mass": "1047",
        "name": "Bhola",
        "nametype": "Valid",
        "recclass": "LL3-6",
        "reclat": "22.683330",
        "reclong": "90.650000",
        "year": "1940-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                86.9,
        22.08333
            )
        ,
        "id": "5041",
        "mass": "2500",
        "name": "Bholghati",
        "nametype": "Valid",
        "recclass": "Howardite",
        "reclat": "22.083330",
        "reclong": "86.900000",
        "year": "1905-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                23.2,
        53.1
            )
        ,
        "id": "5042",
        "mass": "4000",
        "name": "Bialystok",
        "nametype": "Valid",
        "recclass": "Eucrite-pmict",
        "reclat": "53.100000",
        "reclong": "23.200000",
        "year": "1827-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                27.16667,
        50.13333
            )
        ,
        "id": "5043",
        "mass": "1900",
        "name": "Bielokrynitschie",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "50.133330",
        "reclong": "27.166670",
        "year": "1887-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -0.08333,
        12.45
            )
        ,
        "id": "5045",
        "mass": "25000",
        "name": "Bilanga",
        "nametype": "Valid",
        "recclass": "Diogenite",
        "reclat": "12.450000",
        "reclong": "-0.083330",
        "year": "1999-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                115.67639,
        -33.15639
            )
        ,
        "id": "5051",
        "mass": "488.1",
        "name": "Binningup",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-33.156390",
        "reclong": "115.676390",
        "year": "1984-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                5.3,
        13.76667
            )
        ,
        "id": "5056",
        "mass": "560",
        "name": "Birni N'konni",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "13.766670",
        "reclong": "5.300000",
        "year": "1923-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "33",
        ":@computed_region_nnqa_25f4": "657",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -80.28333,
        34.16667
            )
        ,
        "id": "5059",
        "mass": "6000",
        "name": "Bishopville",
        "nametype": "Valid",
        "recclass": "Aubrite",
        "reclat": "34.166670",
        "reclong": "-80.283330",
        "year": "1843-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                82.6,
        25.38333
            )
        ,
        "id": "5060",
        "mass": "1039",
        "name": "Bishunpur",
        "nametype": "Valid",
        "recclass": "LL3.15",
        "reclat": "25.383330",
        "reclong": "82.600000",
        "year": "1895-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                30.16667,
        49.78333
            )
        ,
        "id": "5063",
        "mass": "1850",
        "name": "Bjelaja Zerkov",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "49.783330",
        "reclong": "30.166670",
        "year": "1796-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                25.8,
        60.4
            )
        ,
        "id": "5064",
        "mass": "330000",
        "name": "Bjurböle",
        "nametype": "Valid",
        "recclass": "L/LL4",
        "reclat": "60.400000",
        "reclong": "25.800000",
        "year": "1899-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "48",
        ":@computed_region_nnqa_25f4": "2495",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -78.08333,
        40.91667
            )
        ,
        "id": "5065",
        "mass": "705",
        "name": "Black Moshannan Park",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "40.916670",
        "reclong": "-78.083330",
        "year": "1941-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "20",
        ":@computed_region_nnqa_25f4": "2164",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -97.33333,
        36.83333
            )
        ,
        "id": "5068",
        "mass": "2381",
        "name": "Blackwell",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "36.833330",
        "reclong": "-97.333330",
        "year": "1906-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "23",
        ":@computed_region_nnqa_25f4": "3063",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -98.83333,
        31.83333
            )
        ,
        "id": "5071",
        "mass": "5100",
        "name": "Blanket",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "31.833330",
        "reclong": "-98.833330",
        "year": "1909-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                16.63333,
        49.36667
            )
        ,
        "id": "5072",
        "mass": "470",
        "name": "Blansko",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "49.366670",
        "reclong": "16.633330",
        "year": "1833-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "34",
        ":@computed_region_nnqa_25f4": "1795",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -89.00417,
        40.48
            )
        ,
        "id": "5076",
        "mass": "67.8",
        "name": "Bloomington",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "40.480000",
        "reclong": "-89.004170",
        "year": "1938-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                115.83333,
        33.83333
            )
        ,
        "id": "5090",
        "mass": "7500",
        "name": "Bo Xian",
        "nametype": "Valid",
        "recclass": "LL3.9",
        "reclat": "33.833330",
        "reclong": "115.833330",
        "year": "1977-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -102,
        23
            )
        ,
        "id": "5093",
        "mass": "56",
        "name": "Bocas",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "23.000000",
        "reclong": "-102.000000",
        "year": "1804-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.7,
        12.5
            )
        ,
        "id": "5097",
        "mass": "8800",
        "name": "Bogou",
        "nametype": "Valid",
        "recclass": "Iron, IAB-MG",
        "reclat": "12.500000",
        "reclong": "0.700000",
        "year": "1962-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                131.63333,
        44.55
            )
        ,
        "id": "5098",
        "mass": "256000",
        "name": "Boguslavka",
        "nametype": "Valid",
        "recclass": "Iron, IIAB",
        "reclat": "44.550000",
        "reclong": "131.633330",
        "year": "1916-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                10.05,
        44.86667
            )
        ,
        "id": "5110",
        "mass": "1676",
        "name": "Borgo San Donino",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "44.866670",
        "reclong": "10.050000",
        "year": "1808-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.03333,
        21.95
            )
        ,
        "id": "5111",
        "mass": "8600",
        "name": "Bori",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "21.950000",
        "reclong": "78.033330",
        "year": "1894-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                52.48333,
        54.23333
            )
        ,
        "id": "5112",
        "mass": "1342",
        "name": "Boriskino",
        "nametype": "Valid",
        "recclass": "CM2",
        "reclat": "54.233330",
        "reclong": "52.483330",
        "year": "1930-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                24.28333,
        48.15
            )
        ,
        "id": "5113",
        "mass": "7000",
        "name": "Borkut",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "48.150000",
        "reclong": "24.283330",
        "year": "1852-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                35.86667,
        55.46667
            )
        ,
        "id": "5114",
        "mass": "500",
        "name": "Borodino",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "55.466670",
        "reclong": "35.866670",
        "year": "1812-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                33.88333,
        51.33333
            )
        ,
        "id": "5117",
        "mass": "614",
        "name": "Botschetschki",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "51.333330",
        "reclong": "33.883330",
        "year": "1823-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -11.3715,
        17.71067
            )
        ,
        "id": "57168",
        "mass": "190",
        "name": "Boumdeid st_make_point(2003)",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "17.710670",
        "reclong": "-11.371500",
        "year": "2003-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -11.34133,
        17.17493
            )
        ,
        "id": "57167",
        "mass": "3599",
        "name": "Boumdeid st_make_point(2011)",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "17.174930",
        "reclong": "-11.341330",
        "year": "2011-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -6.33333,
        54.56667
            )
        ,
        "id": "5121",
        "mass": "5460",
        "name": "Bovedy",
        "nametype": "Valid",
        "recclass": "L3",
        "reclat": "54.566670",
        "reclong": "-6.333330",
        "year": "1969-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "48",
        ":@computed_region_nnqa_25f4": "2455",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -80.08333,
        40.5
            )
        ,
        "id": "5128",
        "mass": "762",
        "name": "Bradford Woods",
        "nametype": "Valid",
        "recclass": "L",
        "reclat": "40.500000",
        "reclong": "-80.083330",
        "year": "1886-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                16.3,
        50.6
            )
        ,
        "id": "5133",
        "mass": "39000",
        "name": "Braunau",
        "nametype": "Valid",
        "recclass": "Iron, IIAB",
        "reclat": "50.600000",
        "reclong": "16.300000",
        "year": "1847-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8.18361,
        50.66694
            )
        ,
        "id": "5134",
        "mass": "1500",
        "name": "Breitscheid",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "50.666940",
        "reclong": "8.183610",
        "year": "1956-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                9.1,
        53.4
            )
        ,
        "id": "5135",
        "mass": "7250",
        "name": "Bremervörde",
        "nametype": "Valid",
        "recclass": "H/L3.9",
        "reclat": "53.400000",
        "reclong": "9.100000",
        "year": "1855-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                59.31667,
        52.13333
            )
        ,
        "id": "5140",
        "mass": "219",
        "name": "Brient",
        "nametype": "Valid",
        "recclass": "Eucrite-pmict",
        "reclat": "52.133330",
        "reclong": "59.316670",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -112.88333,
        53.9
            )
        ,
        "id": "5156",
        "mass": "303000",
        "name": "Bruderheim",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "53.900000",
        "reclong": "-112.883330",
        "year": "1960-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                64.60035,
        39.77978
            )
        ,
        "id": "30448",
        "mass": "5300",
        "name": "Bukhara",
        "nametype": "Valid",
        "recclass": "CV3",
        "reclat": "39.779780",
        "reclong": "64.600350",
        "year": "2001-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "id": "5163",
        "mass": "2250",
        "name": "Bulls Run",
        "nametype": "Valid",
        "recclass": "Iron?",
        "year": "1964-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                129.19,
        -31.35
            )
        ,
        "id": "48653",
        "mass": "324",
        "name": "Bunburra Rockhole",
        "nametype": "Valid",
        "recclass": "Eucrite",
        "reclat": "-31.350000",
        "reclong": "129.190000",
        "year": "2007-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                9.58333,
        10.01667
            )
        ,
        "id": "5165",
        "mass": "357",
        "name": "Bununu",
        "nametype": "Valid",
        "recclass": "Howardite",
        "reclat": "10.016670",
        "reclong": "9.583330",
        "year": "1942-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                48,
        5
            )
        ,
        "id": "5169",
        "mass": "120000",
        "name": "Bur-Gheluai",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "5.000000",
        "reclong": "48.000000",
        "year": "1919-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "36",
        ":@computed_region_nnqa_25f4": "256",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -82.23722,
        37.62194
            )
        ,
        "id": "5175",
        "mass": "1504",
        "name": "Burnwell",
        "nametype": "Valid",
        "recclass": "H4-an",
        "reclat": "37.621940",
        "reclong": "-82.237220",
        "year": "1990-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                29.23333,
        40.2
            )
        ,
        "id": "5177",
        "mass": "25000",
        "name": "Bursa",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "40.200000",
        "reclong": "29.233330",
        "year": "1946-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                25.78333,
        46.45
            )
        ,
        "id": "5178",
        "mass": "5000",
        "name": "Buschhof",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "46.450000",
        "reclong": "25.783330",
        "year": "1863-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                82.83333,
        26.78333
            )
        ,
        "id": "5181",
        "mass": "1500",
        "name": "Bustee",
        "nametype": "Valid",
        "recclass": "Aubrite",
        "reclat": "26.783330",
        "reclong": "82.833330",
        "year": "1852-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                84.08333,
        27.08333
            )
        ,
        "id": "5183",
        "mass": "29000",
        "name": "Butsura",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "27.083330",
        "reclong": "84.083330",
        "year": "1861-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -109.84817,
        52.996
            )
        ,
        "id": "48654",
        "mass": "41000",
        "name": "Buzzard Coulee",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "52.996000",
        "reclong": "-109.848170",
        "year": "2008-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -1.16667,
        37.98333
            )
        ,
        "id": "5185",
        "mass": "25000",
        "name": "Cabezo de Mayo",
        "nametype": "Valid",
        "recclass": "L/LL6",
        "reclat": "37.983330",
        "reclong": "-1.166670",
        "year": "1870-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "15",
        ":@computed_region_nnqa_25f4": "1029",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -93.5,
        35.5
            )
        ,
        "id": "5186",
        "mass": "48500",
        "name": "Cabin Creek",
        "nametype": "Valid",
        "recclass": "Iron, IIIAB",
        "reclat": "35.500000",
        "reclong": "-93.500000",
        "year": "1886-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                20.33333,
        43.83889
            )
        ,
        "id": "5187",
        "mass": "212",
        "name": "Cacak",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "43.838890",
        "reclong": "20.333330",
        "year": "1919-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -76.51,
        3.405
            )
        ,
        "id": "45976",
        "mass": "478",
        "name": "Cali",
        "nametype": "Valid",
        "recclass": "H/L4",
        "reclat": "3.405000",
        "reclong": "-76.510000",
        "year": "2007-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                122.33333,
        11.75
            )
        ,
        "id": "5200",
        "mass": "2400",
        "name": "Calivo",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "11.750000",
        "reclong": "122.333330",
        "year": "1916-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -40.16667,
        -7.03333
            )
        ,
        "id": "5249",
        "mass": "23680",
        "name": "Campos Sales",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "-7.033330",
        "reclong": "-40.166670",
        "year": "1991-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                26.6,
        39.8
            )
        ,
        "id": "5250",
        "mass": "4000",
        "name": "Çanakkale",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "39.800000",
        "reclong": "26.600000",
        "year": "1964-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                1.66667,
        41.25
            )
        ,
        "id": "5251",
        "mass": "945",
        "name": "Cañellas",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "41.250000",
        "reclong": "1.666670",
        "year": "1861-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -5.15,
        43.38333
            )
        ,
        "id": "5252",
        "mass": "34000",
        "name": "Cangas de Onis",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "43.383330",
        "reclong": "-5.150000",
        "year": "1866-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "9",
        ":@computed_region_nnqa_25f4": "1448",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -105.24139,
        38.47028
            )
        ,
        "id": "5253",
        "mass": "1400",
        "name": "Canon City",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "38.470280",
        "reclong": "-105.241390",
        "year": "1973-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "18",
        ":@computed_region_nnqa_25f4": "2695",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -89.58333,
        37.26667
            )
        ,
        "id": "5260",
        "mass": "2300",
        "name": "Cape Girardeau",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "37.266670",
        "reclong": "-89.583330",
        "year": "1846-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -64.55,
        -30.88333
            )
        ,
        "id": "5264",
        "mass": "750",
        "name": "Capilla del Monte",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "-30.883330",
        "reclong": "-64.550000",
        "year": "1934-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -69.04389,
        -16.66444
            )
        ,
        "id": "45817",
        "mass": "342",
        "name": "Carancas",
        "nametype": "Valid",
        "recclass": "H4-5",
        "reclat": "-16.664440",
        "reclong": "-69.043890",
        "year": "2007-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                27,
        38.5
            )
        ,
        "id": "5265",
        "mass": "8",
        "name": "Caratash",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "38.500000",
        "reclong": "27.000000",
        "year": "1902-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "37",
        ":@computed_region_nnqa_25f4": "648",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -78.06667,
        36.08333
            )
        ,
        "id": "5291",
        "mass": "7300",
        "name": "Castalia",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "36.083330",
        "reclong": "-78.066670",
        "year": "1874-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                11.5,
        43.35
            )
        ,
        "id": "5292",
        "name": "Castel Berardenga",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "43.350000",
        "reclong": "11.500000",
        "year": "1791-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "49",
        ":@computed_region_nnqa_25f4": "414",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -68.75,
        44.38333
            )
        ,
        "id": "5293",
        "mass": "94",
        "name": "Castine",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "44.383330",
        "reclong": "-68.750000",
        "year": "1848-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                16.2,
        39.8
            )
        ,
        "id": "5295",
        "mass": "15000",
        "name": "Castrovillari",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "39.800000",
        "reclong": "16.200000",
        "year": "1583-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "37",
        ":@computed_region_nnqa_25f4": "637",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -79.25,
        36.5
            )
        ,
        "id": "5296",
        "mass": "1360",
        "name": "Caswell County",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "36.500000",
        "reclong": "-79.250000",
        "year": "1810-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -105.23333,
        26.46667
            )
        ,
        "id": "5306",
        "mass": "1025",
        "name": "Ceniceros",
        "nametype": "Valid",
        "recclass": "L3.7",
        "reclat": "26.466670",
        "reclong": "-105.233330",
        "year": "1988-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "21",
        ":@computed_region_nnqa_25f4": "2684",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -96.91667,
        43.2
            )
        ,
        "id": "5307",
        "mass": "45.6",
        "name": "Centerville",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "43.200000",
        "reclong": "-96.916670",
        "year": "1956-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8.3,
        45.08333
            )
        ,
        "id": "5308",
        "mass": "6460",
        "name": "Cereseto",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "45.083330",
        "reclong": "8.300000",
        "year": "1840-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                109.31667,
        28.53333
            )
        ,
        "id": "5313",
        "mass": "3700",
        "name": "Chadong",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "28.533330",
        "reclong": "109.316670",
        "year": "1998-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                81.66667,
        25.36667
            )
        ,
        "id": "5314",
        "mass": "0.5",
        "name": "Chail",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "25.366670",
        "reclong": "81.666670",
        "year": "1814-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                83.48333,
        25.85
            )
        ,
        "id": "5315",
        "mass": "8200",
        "name": "Chainpur",
        "nametype": "Valid",
        "recclass": "LL3.4",
        "reclat": "25.850000",
        "reclong": "83.483330",
        "year": "1907-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -58.05,
        -30.78333
            )
        ,
        "id": "5316",
        "mass": "18300",
        "name": "Chajari",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "-30.783330",
        "reclong": "-58.050000",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.01667,
        20.26667
            )
        ,
        "id": "5320",
        "mass": "8800",
        "name": "Chandakapur",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "20.266670",
        "reclong": "76.016670",
        "year": "1838-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                79.05,
        27.28333
            )
        ,
        "id": "5321",
        "mass": "1100",
        "name": "Chandpur",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "27.283330",
        "reclong": "79.050000",
        "year": "1885-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                111.75,
        29.08333
            )
        ,
        "id": "5322",
        "mass": "1810",
        "name": "Changde",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "29.083330",
        "reclong": "111.750000",
        "year": "1977-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                1.05,
        46.68333
            )
        ,
        "id": "5325",
        "mass": "31500",
        "name": "Chantonnay",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "46.683330",
        "reclong": "1.050000",
        "year": "1812-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "39",
        ":@computed_region_nnqa_25f4": "2007",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -87.33333,
        36.16667
            )
        ,
        "id": "5328",
        "mass": "4300",
        "name": "Charlotte",
        "nametype": "Valid",
        "recclass": "Iron, IVA",
        "reclat": "36.166670",
        "reclong": "-87.333330",
        "year": "1835-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                1.56667,
        47.93333
            )
        ,
        "id": "5329",
        "mass": "27000",
        "name": "Charsonville",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "47.933330",
        "reclong": "1.566670",
        "year": "1810-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                75.5,
        29.48333
            )
        ,
        "id": "5330",
        "mass": "12000",
        "name": "Charwallas",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "29.483330",
        "reclong": "75.500000",
        "year": "1834-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                5.36667,
        47.71667
            )
        ,
        "id": "5331",
        "mass": "4000",
        "name": "Chassigny",
        "nametype": "Valid",
        "recclass": "Martian st_make_point(chassignite)",
        "reclat": "47.716670",
        "reclong": "5.366670",
        "year": "1815-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                2.91667,
        47.93333
            )
        ,
        "id": "5332",
        "mass": "30000",
        "name": "Château-Renard",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "47.933330",
        "reclong": "2.916670",
        "year": "1841-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -7.46667,
        41.93333
            )
        ,
        "id": "5334",
        "mass": "2945",
        "name": "Chaves",
        "nametype": "Valid",
        "recclass": "Howardite",
        "reclat": "41.933330",
        "reclong": "-7.466670",
        "year": "1925-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                32.5,
        -3.66667
            )
        ,
        "id": "5338",
        "mass": "2936",
        "name": "Chela",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "-3.666670",
        "reclong": "32.500000",
        "year": "1988-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                61.11667,
        54.81667
            )
        ,
        "id": "57165",
        "mass": "100000",
        "name": "Chelyabinsk",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "54.816670",
        "reclong": "61.116670",
        "year": "2013-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -5.01472,
        23.69639
            )
        ,
        "id": "47347",
        "mass": "100000",
        "name": "Chergach ",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "23.696390",
        "reclong": "-5.014720",
        "year": "2007-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                30.1,
        53.7
            )
        ,
        "id": "5339",
        "mass": "6000",
        "name": "Chernyi Bor",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "53.700000",
        "reclong": "30.100000",
        "year": "1964-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "33",
        ":@computed_region_nnqa_25f4": "2582",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -81.88333,
        35.03333
            )
        ,
        "id": "5340",
        "mass": "8400",
        "name": "Cherokee Springs",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "35.033330",
        "reclong": "-81.883330",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                6.81667,
        46.55
            )
        ,
        "id": "5341",
        "mass": "705",
        "name": "Chervettaz",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "46.550000",
        "reclong": "6.816670",
        "year": "1901-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                34,
        50.83333
            )
        ,
        "id": "5342",
        "mass": "1700",
        "name": "Chervony Kut",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "50.833330",
        "reclong": "34.000000",
        "year": "1939-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.5,
        14.5
            )
        ,
        "id": "5344",
        "mass": "72",
        "name": "Chetrinahatti",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "14.500000",
        "reclong": "76.500000",
        "year": "1880-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                101.63333,
        17.9
            )
        ,
        "id": "5345",
        "mass": "367",
        "name": "Chiang Khan",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "17.900000",
        "reclong": "101.633330",
        "year": "1981-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "48",
        ":@computed_region_nnqa_25f4": "2459",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -79.73333,
        40.93333
            )
        ,
        "id": "5349",
        "mass": "303",
        "name": "Chicora",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "40.933330",
        "reclong": "-79.733330",
        "year": "1938-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                33.395,
        -10.05944
            )
        ,
        "id": "5355",
        "mass": "3920",
        "name": "Chisenga",
        "nametype": "Valid",
        "recclass": "Iron, IIIAB",
        "reclat": "-10.059440",
        "reclong": "33.395000",
        "year": "1988-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                13.96667,
        -17.35
            )
        ,
        "id": "5356",
        "name": "Chitado",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-17.350000",
        "reclong": "13.966670",
        "year": "1966-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.97667,
        47.47083
            )
        ,
        "id": "5357",
        "mass": "4000",
        "name": "Chitenay",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "47.470830",
        "reclong": "0.976670",
        "year": "1978-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                108.1,
        -6.95
            )
        ,
        "id": "5364",
        "mass": "1600",
        "name": "Cilimus",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "-6.950000",
        "reclong": "108.100000",
        "year": "1979-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "31",
        ":@computed_region_nnqa_25f4": "67",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -81.87278,
        32.1025
            )
        ,
        "id": "5374",
        "mass": "1455",
        "name": "Claxton",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "32.102500",
        "reclong": "-81.872780",
        "year": "1984-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "id": "5383",
        "mass": "48.6",
        "name": "Clohars",
        "nametype": "Valid",
        "recclass": "L4",
        "year": "1822-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "41",
        ":@computed_region_nnqa_25f4": "877",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -90.28333,
        44.9
            )
        ,
        "id": "5395",
        "mass": "104000",
        "name": "Colby st_make_point(Wisconsin)",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "44.900000",
        "reclong": "-90.283330",
        "year": "1917-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                19.38333,
        -33.13333
            )
        ,
        "id": "5397",
        "mass": "5200",
        "name": "Cold Bokkeveld",
        "nametype": "Valid",
        "recclass": "CM2",
        "reclat": "-33.133330",
        "reclong": "19.383330",
        "year": "1838-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "50",
        ":@computed_region_nnqa_25f4": "356",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -84.50778,
        43.76111
            )
        ,
        "id": "5401",
        "mass": "469",
        "name": "Coleman",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "43.761110",
        "reclong": "-84.507780",
        "year": "1994-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                12.61667,
        42.53333
            )
        ,
        "id": "5403",
        "mass": "5000",
        "name": "Collescipoli",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "42.533330",
        "reclong": "12.616670",
        "year": "1890-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -47.55,
        -19.85
            )
        ,
        "id": "5418",
        "mass": "20350",
        "name": "Conquista",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "-19.850000",
        "reclong": "-47.550000",
        "year": "1965-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -100.86667,
        21.16667
            )
        ,
        "id": "5451",
        "mass": "1200",
        "name": "Cosina",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "21.166670",
        "reclong": "-100.866670",
        "year": "1844-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.26667,
        10.2
            )
        ,
        "id": "5465",
        "mass": "1460",
        "name": "Cranganore",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "10.200000",
        "reclong": "76.266670",
        "year": "1917-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "20",
        ":@computed_region_nnqa_25f4": "2201",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -97.58333,
        35.95
            )
        ,
        "id": "5470",
        "mass": "78.400000000000006",
        "name": "Crescent",
        "nametype": "Valid",
        "recclass": "CM2",
        "reclat": "35.950000",
        "reclong": "-97.583330",
        "year": "1936-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                27.3,
        -27.7
            )
        ,
        "id": "5474",
        "mass": "3650",
        "name": "Cronstad",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-27.700000",
        "reclong": "27.300000",
        "year": "1877-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "37",
        ":@computed_region_nnqa_25f4": "2332",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -78.13333,
        35.63333
            )
        ,
        "id": "5476",
        "mass": "167",
        "name": "Cross Roads",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "35.633330",
        "reclong": "-78.133330",
        "year": "1892-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -6.21667,
        54.61667
            )
        ,
        "id": "5477",
        "mass": "4255",
        "name": "Crumlin",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "54.616670",
        "reclong": "-6.216670",
        "year": "1902-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "36",
        ":@computed_region_nnqa_25f4": "1426",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -84.35,
        36.83333
            )
        ,
        "id": "5496",
        "mass": "17000",
        "name": "Cumberland Falls",
        "nametype": "Valid",
        "recclass": "Aubrite",
        "reclat": "36.833330",
        "reclong": "-84.350000",
        "year": "1919-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "36",
        ":@computed_region_nnqa_25f4": "244",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -84.25,
        38.4
            )
        ,
        "id": "5500",
        "mass": "6000",
        "name": "Cynthiana",
        "nametype": "Valid",
        "recclass": "L/LL4",
        "reclat": "38.400000",
        "reclong": "-84.250000",
        "year": "1877-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8.83333,
        35.61667
            )
        ,
        "id": "5504",
        "mass": "18000",
        "name": "Dahmani",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "35.616670",
        "reclong": "8.833330",
        "year": "1981-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                83.96667,
        26.91667
            )
        ,
        "id": "5511",
        "mass": "5650",
        "name": "Dandapur",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "26.916670",
        "reclong": "83.966670",
        "year": "1878-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                24.56667,
        -28.2
            )
        ,
        "id": "5513",
        "mass": "1064",
        "name": "Daniel's Kuil",
        "nametype": "Valid",
        "recclass": "EL6",
        "reclat": "-28.200000",
        "reclong": "24.566670",
        "year": "1868-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "29",
        ":@computed_region_nnqa_25f4": "103",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -87.06667,
        34.4
            )
        ,
        "id": "5514",
        "mass": "2000",
        "name": "Danville",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "34.400000",
        "reclong": "-87.066670",
        "year": "1868-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8.65,
        49.86667
            )
        ,
        "id": "6603",
        "mass": "100",
        "name": "Darmstadt",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "49.866670",
        "reclong": "8.650000",
        "year": "1804-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                59.685,
        41.98444
            )
        ,
        "id": "6604",
        "mass": "7000",
        "name": "Dashoguz",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "41.984440",
        "reclong": "59.685000",
        "year": "1998-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -79.95756,
        -1.87089
            )
        ,
        "id": "51559",
        "mass": "6580",
        "name": "Daule",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "-1.870890",
        "reclong": "-79.957560",
        "year": "2008-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -80,
        43
            )
        ,
        "id": "6621",
        "mass": "340",
        "name": "De Cewsville",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "43.000000",
        "reclong": "-80.000000",
        "year": "1887-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_nnqa_25f4": "2491",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -74,
        40.25
            )
        ,
        "id": "6634",
        "mass": "28",
        "name": "Deal",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "40.250000",
        "reclong": "-74.000000",
        "year": "1829-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                77.25,
        28.56667
            )
        ,
        "id": "6642",
        "mass": "0.8",
        "name": "Delhi",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "28.566670",
        "reclong": "77.250000",
        "year": "1897-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                84.76667,
        51.46667
            )
        ,
        "id": "6649",
        "mass": "16400",
        "name": "Demina",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "51.466670",
        "reclong": "84.766670",
        "year": "1911-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "9",
        ":@computed_region_nnqa_25f4": "1444",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -104.93056,
        39.7825
            )
        ,
        "id": "6660",
        "mass": "230",
        "name": "Denver",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "39.782500",
        "reclong": "-104.930560",
        "year": "1967-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                93.86667,
        26.68333
            )
        ,
        "id": "6664",
        "mass": "12500",
        "name": "Dergaon",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "26.683330",
        "reclong": "93.866670",
        "year": "2001-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                73.61667,
        25.73333
            )
        ,
        "id": "6693",
        "mass": "25400",
        "name": "Desuri",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "25.733330",
        "reclong": "73.616670",
        "year": "1962-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                81,
        19
            )
        ,
        "id": "6694",
        "mass": "12000",
        "name": "Devgaon",
        "nametype": "Valid",
        "recclass": "H3.8",
        "reclat": "19.000000",
        "reclong": "81.000000",
        "year": "2001-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.525,
        24.225
            )
        ,
        "id": "6696",
        "mass": "1140",
        "name": "Devri-Khera",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "24.225000",
        "reclong": "76.525000",
        "year": "1994-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                71.42722,
        22.37778
            )
        ,
        "id": "6698",
        "mass": "45000",
        "name": "Dhajala",
        "nametype": "Valid",
        "recclass": "H3.8",
        "reclat": "22.377780",
        "reclong": "71.427220",
        "year": "1976-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                75.6,
        14.88333
            )
        ,
        "id": "6699",
        "mass": "1800",
        "name": "Dharwar",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "14.883330",
        "reclong": "75.600000",
        "year": "1848-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.46667,
        32.23333
            )
        ,
        "id": "7640",
        "mass": "32000",
        "name": "Dhurmsala",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "32.233330",
        "reclong": "76.466670",
        "year": "1860-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                27.32997,
        37.35172
            )
        ,
        "id": "47350",
        "mass": "3396",
        "name": "Didim",
        "nametype": "Valid",
        "recclass": "H3-5",
        "reclat": "37.351720",
        "reclong": "27.329970",
        "year": "2007-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                18.56667,
        -33.75
            )
        ,
        "id": "7642",
        "mass": "1000",
        "name": "Diep River",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-33.750000",
        "reclong": "18.566670",
        "year": "1906-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -60.46667,
        -31.88333
            )
        ,
        "id": "7649",
        "mass": "400",
        "name": "Distrito Quebracho",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "-31.883330",
        "reclong": "-60.466670",
        "year": "1957-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                111.5,
        -7.5
            )
        ,
        "id": "7652",
        "mass": "166000",
        "name": "Djati-Pengilon",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "-7.500000",
        "reclong": "111.500000",
        "year": "1884-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                15.05,
        12.73333
            )
        ,
        "id": "7656",
        "mass": "3950",
        "name": "Djermaia",
        "nametype": "Valid",
        "recclass": "H",
        "reclat": "12.733330",
        "reclong": "15.050000",
        "year": "1961-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                9.55,
        36.95
            )
        ,
        "id": "7657",
        "mass": "10000",
        "name": "Djoumine",
        "nametype": "Valid",
        "recclass": "H5-6",
        "reclat": "36.950000",
        "reclong": "9.550000",
        "year": "1999-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                90.33333,
        23.5
            )
        ,
        "id": "7658",
        "mass": "3840",
        "name": "Dokachi",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "23.500000",
        "reclong": "90.333330",
        "year": "1903-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                25.3,
        50.75
            )
        ,
        "id": "7659",
        "mass": "1600",
        "name": "Dolgovoli",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "50.750000",
        "reclong": "25.300000",
        "year": "1864-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                29,
        40
            )
        ,
        "id": "7661",
        "mass": "438",
        "name": "Domanitch",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "40.000000",
        "reclong": "29.000000",
        "year": "1907-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                119.03333,
        45.5
            )
        ,
        "id": "7706",
        "mass": "128800",
        "name": "Dong Ujimqin Qi",
        "nametype": "Valid",
        "recclass": "Mesosiderite",
        "reclat": "45.500000",
        "reclong": "119.033330",
        "year": "1995-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                82.45,
        21.86667
            )
        ,
        "id": "7707",
        "mass": "230",
        "name": "Donga Kohrod",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "21.866670",
        "reclong": "82.450000",
        "year": "1899-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                120.78333,
        32.91667
            )
        ,
        "id": "7708",
        "mass": "5500",
        "name": "Dongtai",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "32.916670",
        "reclong": "120.783330",
        "year": "1970-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                112.3,
        51.2
            )
        ,
        "id": "7718",
        "mass": "3891",
        "name": "Doroninsk",
        "nametype": "Valid",
        "recclass": "H5-7",
        "reclat": "51.200000",
        "reclong": "112.300000",
        "year": "1805-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                3.16667,
        13.05
            )
        ,
        "id": "7722",
        "mass": "1250",
        "name": "Dosso",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "13.050000",
        "reclong": "3.166670",
        "year": "1962-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -6.3,
        32.33333
            )
        ,
        "id": "7723",
        "mass": "1161",
        "name": "Douar Mghila",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "32.333330",
        "reclong": "-6.300000",
        "year": "1932-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                33.91667,
        -13.66667
            )
        ,
        "id": "7725",
        "mass": "642",
        "name": "Dowa",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "-13.666670",
        "reclong": "33.916670",
        "year": "1976-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "39",
        ":@computed_region_nnqa_25f4": "2115",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -86.5,
        36.4
            )
        ,
        "id": "7728",
        "mass": "5000",
        "name": "Drake Creek",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "36.400000",
        "reclong": "-86.500000",
        "year": "1827-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -82.26,
        42.52
            )
        ,
        "id": "7731",
        "mass": "47700",
        "name": "Dresden st_make_point(Ontario)",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "42.520000",
        "reclong": "-82.260000",
        "year": "1939-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                18.44167,
        42.45833
            )
        ,
        "id": "7736",
        "mass": "1900",
        "name": "Dubrovnik",
        "nametype": "Valid",
        "recclass": "L3-6",
        "reclat": "42.458330",
        "reclong": "18.441670",
        "year": "1951-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                152.83333,
        -31.66667
            )
        ,
        "id": "7743",
        "mass": "30",
        "name": "Dunbogan",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-31.666670",
        "reclong": "152.833330",
        "year": "1999-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -8.03333,
        52.55
            )
        ,
        "id": "7745",
        "mass": "2270",
        "name": "Dundrum",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "52.550000",
        "reclong": "-8.033330",
        "year": "1865-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                128.25,
        43.33333
            )
        ,
        "id": "7749",
        "name": "Dunhua",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "43.333330",
        "reclong": "128.250000",
        "year": "1976-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.63333,
        30.3
            )
        ,
        "id": "7750",
        "mass": "13200",
        "name": "Durala",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "30.300000",
        "reclong": "76.633330",
        "year": "1815-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                39.5,
        -4
            )
        ,
        "id": "7752",
        "mass": "577",
        "name": "Duruma",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-4.000000",
        "reclong": "39.500000",
        "year": "1853-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                127.26667,
        33.43333
            )
        ,
        "id": "7754",
        "mass": "2117",
        "name": "Duwun",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "33.433330",
        "reclong": "127.266670",
        "year": "1943-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                31.31667,
        -27.2
            )
        ,
        "id": "7755",
        "mass": "3230",
        "name": "Dwaleni",
        "nametype": "Valid",
        "recclass": "H4-6",
        "reclat": "-27.200000",
        "reclong": "31.316670",
        "year": "1970-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                82,
        26.25
            )
        ,
        "id": "7757",
        "mass": "300",
        "name": "Dyalpur",
        "nametype": "Valid",
        "recclass": "Ureilite",
        "reclat": "26.250000",
        "reclong": "82.000000",
        "year": "1872-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                151,
        -3
            )
        ,
        "id": "7758",
        "mass": "188",
        "name": "Dyarrl Island",
        "nametype": "Valid",
        "recclass": "Mesosiderite-A1",
        "reclat": "-3.000000",
        "reclong": "151.000000",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "19",
        ":@computed_region_nnqa_25f4": "462",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -96.47167,
        40.78167
            )
        ,
        "id": "7760",
        "mass": "10000",
        "name": "Eagle",
        "nametype": "Valid",
        "recclass": "EL6",
        "reclat": "40.781670",
        "reclong": "-96.471670",
        "year": "1947-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                15.83333,
        -17.3
            )
        ,
        "id": "7774",
        "mass": "2400",
        "name": "Ehole",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-17.300000",
        "reclong": "15.833330",
        "year": "1961-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                11.21667,
        48.9
            )
        ,
        "id": "7775",
        "mass": "3000",
        "name": "Eichstädt",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "48.900000",
        "reclong": "11.216670",
        "year": "1785-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                13,
        56.03333
            )
        ,
        "id": "7776",
        "mass": "3336",
        "name": "Ekeby",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "56.033330",
        "reclong": "13.000000",
        "year": "1939-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.78333,
        28.26667
            )
        ,
        "id": "7777",
        "mass": "840",
        "name": "Ekh Khera",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "28.266670",
        "reclong": "78.783330",
        "year": "1916-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                3.25,
        34.41667
            )
        ,
        "id": "7807",
        "mass": "10000",
        "name": "El Idrissia",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "34.416670",
        "reclong": "3.250000",
        "year": "1989-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -97.37,
        25.37
            )
        ,
        "id": "45977",
        "mass": "17226",
        "name": "El Paso de Aguila",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "25.370000",
        "reclong": "-97.370000",
        "year": "1977-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -103.05167,
        19.96722
            )
        ,
        "id": "7819",
        "mass": "5000",
        "name": "El Tigre",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "19.967220",
        "reclong": "-103.051670",
        "year": "1993-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "9",
        ":@computed_region_nnqa_25f4": "88",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -104.58817,
        39.24667
            )
        ,
        "id": "7822",
        "mass": "680.5",
        "name": "Elbert",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "39.246670",
        "reclong": "-104.588170",
        "year": "1998-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                12.73333,
        50.18333
            )
        ,
        "id": "7823",
        "mass": "107000",
        "name": "Elbogen",
        "nametype": "Valid",
        "recclass": "Iron, IID",
        "reclat": "50.183330",
        "reclong": "12.733330",
        "year": "1400-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                37.66667,
        47.83333
            )
        ,
        "id": "7824",
        "mass": "54640",
        "name": "Elenovka",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "47.833330",
        "reclong": "37.666670",
        "year": "1951-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                4,
        51.75
            )
        ,
        "id": "10019",
        "mass": "1470",
        "name": "Ellemeet",
        "nametype": "Valid",
        "recclass": "Diogenite",
        "reclat": "51.750000",
        "reclong": "4.000000",
        "year": "1925-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                151.61667,
        -29.46667
            )
        ,
        "id": "10033",
        "mass": "127",
        "name": "Emmaville",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "-29.466670",
        "reclong": "151.616670",
        "year": "1900-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                109.5,
        30.3
            )
        ,
        "id": "10038",
        "mass": "8000",
        "name": "Enshi",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "30.300000",
        "reclong": "109.500000",
        "year": "1974-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                7.35,
        47.86667
            )
        ,
        "id": "10039",
        "mass": "127000",
        "name": "Ensisheim",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "47.866670",
        "reclong": "7.350000",
        "year": "1492-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                6.46667,
        48.18333
            )
        ,
        "id": "10041",
        "mass": "277",
        "name": "Épinal",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "48.183330",
        "reclong": "6.466670",
        "year": "1822-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                81.89167,
        19.03333
            )
        ,
        "id": "10042",
        "mass": "113",
        "name": "Erakot",
        "nametype": "Valid",
        "recclass": "CM2",
        "reclat": "19.033330",
        "reclong": "81.891670",
        "year": "1940-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                44.5,
        40.3
            )
        ,
        "id": "10043",
        "mass": "107.2",
        "name": "Erevan",
        "nametype": "Valid",
        "recclass": "Howardite",
        "reclat": "40.300000",
        "reclong": "44.500000",
        "year": "1911-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                44.16667,
        1.16667
            )
        ,
        "id": "10044",
        "mass": "20000",
        "name": "Ergheo",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "1.166670",
        "reclong": "44.166670",
        "year": "1889-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                11.25,
        52.21667
            )
        ,
        "id": "10049",
        "mass": "2250",
        "name": "Erxleben",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "52.216670",
        "reclong": "11.250000",
        "year": "1812-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -1.1,
        46.25
            )
        ,
        "id": "10051",
        "mass": "1500",
        "name": "Esnandes",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "46.250000",
        "reclong": "-1.100000",
        "year": "1837-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                30.83333,
        2.88333
            )
        ,
        "id": "10055",
        "mass": "500",
        "name": "Essebi",
        "nametype": "Valid",
        "recclass": "C2-ung",
        "reclat": "2.883330",
        "reclong": "30.833330",
        "year": "1957-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "16",
        ":@computed_region_nnqa_25f4": "277",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -94.83333,
        43.41667
            )
        ,
        "id": "10059",
        "mass": "320000",
        "name": "Estherville",
        "nametype": "Valid",
        "recclass": "Mesosiderite-A3/4",
        "reclat": "43.416670",
        "reclong": "-94.833330",
        "year": "1879-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "17",
        ":@computed_region_nnqa_25f4": "1300",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -97.03333,
        39.75
            )
        ,
        "id": "10074",
        "mass": "89400",
        "name": "Farmington",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "39.750000",
        "reclong": "-97.033330",
        "year": "1890-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "37",
        ":@computed_region_nnqa_25f4": "2439",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -77.53333,
        35.55
            )
        ,
        "id": "10075",
        "mass": "56000",
        "name": "Farmville",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "35.550000",
        "reclong": "-77.533330",
        "year": "1934-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                2.81667,
        44.38333
            )
        ,
        "id": "10078",
        "mass": "1500",
        "name": "Favars",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "44.383330",
        "reclong": "2.816670",
        "year": "1844-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "15",
        ":@computed_region_nnqa_25f4": "70",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -94.16667,
        36.05
            )
        ,
        "id": "10079",
        "mass": "2360",
        "name": "Fayetteville",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "36.050000",
        "reclong": "-94.166670",
        "year": "1934-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8.45,
        36.88333
            )
        ,
        "id": "10080",
        "mass": "380",
        "name": "Feid Chair",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "36.883330",
        "reclong": "8.450000",
        "year": "1875-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "29",
        ":@computed_region_nnqa_25f4": "1631",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -87.16667,
        32.53333
            )
        ,
        "id": "10081",
        "mass": "3200",
        "name": "Felix",
        "nametype": "Valid",
        "recclass": "CO3.3",
        "reclat": "32.533330",
        "reclong": "-87.166670",
        "year": "1900-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                116.75,
        34.6
            )
        ,
        "id": "10086",
        "mass": "82",
        "name": "Fenghsien-Ku",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "34.600000",
        "reclong": "116.750000",
        "year": "1924-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "37",
        ":@computed_region_nnqa_25f4": "2331",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -81.41667,
        36.1
            )
        ,
        "id": "10088",
        "mass": "220",
        "name": "Ferguson",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "36.100000",
        "reclong": "-81.416670",
        "year": "1889-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                13.75333,
        43.18111
            )
        ,
        "id": "10091",
        "mass": "10200",
        "name": "Fermo",
        "nametype": "Valid",
        "recclass": "H3-5",
        "reclat": "43.181110",
        "reclong": "13.753330",
        "year": "1996-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "1",
        ":@computed_region_nnqa_25f4": "385",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -96.85,
        47.81667
            )
        ,
        "id": "10107",
        "mass": "17600",
        "name": "Fisher",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "47.816670",
        "reclong": "-96.850000",
        "year": "1894-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "23",
        ":@computed_region_nnqa_25f4": "807",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -97.76667,
        30.83333
            )
        ,
        "id": "10111",
        "mass": "3640",
        "name": "Florence",
        "nametype": "Valid",
        "recclass": "H3",
        "reclat": "30.833330",
        "reclong": "-97.766670",
        "year": "1922-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "16",
        ":@computed_region_nnqa_25f4": "1785",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -93.66667,
        43.25
            )
        ,
        "id": "10119",
        "mass": "152000",
        "name": "Forest City",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "43.250000",
        "reclong": "-93.666670",
        "year": "1890-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                146.85833,
        -33.35
            )
        ,
        "id": "10120",
        "mass": "26000",
        "name": "Forest Vale",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "-33.350000",
        "reclong": "146.858330",
        "year": "1942-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "40",
        ":@computed_region_nnqa_25f4": "2839",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -78.08333,
        36.78333
            )
        ,
        "id": "10123",
        "mass": "6067",
        "name": "Forksville",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "36.783330",
        "reclong": "-78.083330",
        "year": "1924-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                7.31667,
        50.95
            )
        ,
        "id": "10163",
        "mass": "240",
        "name": "Forsbach",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "50.950000",
        "reclong": "7.316670",
        "year": "1900-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "31",
        ":@computed_region_nnqa_25f4": "1470",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -83.96667,
        33.01667
            )
        ,
        "id": "10164",
        "mass": "16300",
        "name": "Forsyth",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "33.016670",
        "reclong": "-83.966670",
        "year": "1829-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                7,
        28.25
            )
        ,
        "id": "10166",
        "name": "Fort Flatters",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "28.250000",
        "reclong": "7.000000",
        "year": "1944-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "29",
        ":@computed_region_nnqa_25f4": "99",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -87.83333,
        34.48333
            )
        ,
        "id": "10177",
        "mass": "650",
        "name": "Frankfort st_make_point(stone)",
        "nametype": "Valid",
        "recclass": "Howardite",
        "reclat": "34.483330",
        "reclong": "-87.833330",
        "year": "1868-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                113.56694,
        31.47556
            )
        ,
        "id": "52412",
        "mass": "23000",
        "name": "Fuhe",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "31.475560",
        "reclong": "113.566940",
        "year": "1945-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                130.2,
        33.18333
            )
        ,
        "id": "10836",
        "mass": "11620",
        "name": "Fukutomi",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "33.183330",
        "reclong": "130.200000",
        "year": "1882-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                10.33333,
        55.33333
            )
        ,
        "id": "10838",
        "name": "Fünen",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "55.333330",
        "reclong": "10.333330",
        "year": "1654-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                80.81667,
        25.95
            )
        ,
        "id": "10839",
        "mass": "4000",
        "name": "Futtehpur",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "25.950000",
        "reclong": "80.816670",
        "year": "1822-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                115.9,
        32.9
            )
        ,
        "id": "10840",
        "mass": "2500",
        "name": "Fuyang",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "32.900000",
        "reclong": "115.900000",
        "year": "1977-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.4,
        44.3
            )
        ,
        "id": "10846",
        "mass": "132.69999999999999",
        "name": "Galapian",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "44.300000",
        "reclong": "0.400000",
        "year": "1826-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                12.43333,
        7.05
            )
        ,
        "id": "10848",
        "mass": "36.1",
        "name": "Galim st_make_point(a)",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "7.050000",
        "reclong": "12.433330",
        "year": "1952-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                12.43333,
        7.05
            )
        ,
        "id": "10849",
        "mass": "28",
        "name": "Galim st_make_point(b)",
        "nametype": "Valid",
        "recclass": "EH3/4-an",
        "reclat": "7.050000",
        "reclong": "12.433330",
        "year": "1952-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                30.78333,
        51.68333
            )
        ,
        "id": "10850",
        "mass": "5000",
        "name": "Galkiv",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "51.683330",
        "reclong": "30.783330",
        "year": "1995-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                68.53333,
        27.35
            )
        ,
        "id": "10851",
        "mass": "6400",
        "name": "Gambat",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "27.350000",
        "reclong": "68.533330",
        "year": "1897-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -2.18333,
        11.65
            )
        ,
        "id": "10854",
        "name": "Gao-Guenie",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "11.650000",
        "reclong": "-2.183330",
        "year": "1960-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                68.53333,
        27.88333
            )
        ,
        "id": "10860",
        "mass": "380",
        "name": "Garhi Yasin",
        "nametype": "Valid",
        "recclass": "Iron, IIE",
        "reclat": "27.883330",
        "reclong": "68.533330",
        "year": "1917-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "13",
        ":@computed_region_nnqa_25f4": "2985",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -112.13333,
        41.68333
            )
        ,
        "id": "10861",
        "mass": "102",
        "name": "Garland",
        "nametype": "Valid",
        "recclass": "Diogenite-pm",
        "reclat": "41.683330",
        "reclong": "-112.133330",
        "year": "1950-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                11.03333,
        12.85
            )
        ,
        "id": "44882",
        "mass": "4162",
        "name": "Gashua",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "12.850000",
        "reclong": "11.033330",
        "year": "1984-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -2.04167,
        14.15083
            )
        ,
        "id": "10866",
        "name": "Gasseltepaoua",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "14.150830",
        "reclong": "-2.041670",
        "year": "2000-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                11.91667,
        12.91667
            )
        ,
        "id": "10870",
        "mass": "725",
        "name": "Geidam",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "12.916670",
        "reclong": "11.916670",
        "year": "1950-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                136.88333,
        35.53333
            )
        ,
        "id": "10914",
        "mass": "14290",
        "name": "Gifu",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "35.533330",
        "reclong": "136.883330",
        "year": "1909-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                13.56667,
        37.31667
            )
        ,
        "id": "10917",
        "mass": "18000",
        "name": "Girgenti",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "37.316670",
        "reclong": "13.566670",
        "year": "1853-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                9.91667,
        9.6
            )
        ,
        "id": "10919",
        "mass": "480",
        "name": "Git-Git",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "9.600000",
        "reclong": "9.916670",
        "year": "1947-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                6.86667,
        52.2
            )
        ,
        "id": "10923",
        "mass": "670",
        "name": "Glanerbrug",
        "nametype": "Valid",
        "recclass": "L/LL5",
        "reclat": "52.200000",
        "reclong": "6.866670",
        "year": "1990-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                107.7,
        -7.25
            )
        ,
        "id": "10924",
        "mass": "1303",
        "name": "Glanggang",
        "nametype": "Valid",
        "recclass": "H5-6",
        "reclat": "-7.250000",
        "reclong": "107.700000",
        "year": "1939-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                37.61667,
        57.35
            )
        ,
        "id": "10926",
        "mass": "152000",
        "name": "Glasatovo",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "57.350000",
        "reclong": "37.616670",
        "year": "1918-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -0.3,
        52.45972
            )
        ,
        "id": "10930",
        "mass": "767",
        "name": "Glatton",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "52.459720",
        "reclong": "-0.300000",
        "year": "1991-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                16.76667,
        50.66667
            )
        ,
        "id": "10936",
        "mass": "1750",
        "name": "Gnadenfrei",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "50.666670",
        "reclong": "16.766670",
        "year": "1879-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                89.05,
        24.23333
            )
        ,
        "id": "10948",
        "mass": "1600",
        "name": "Gopalpur",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "24.233330",
        "reclong": "89.050000",
        "year": "1865-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                38.08333,
        48.28333
            )
        ,
        "id": "10949",
        "mass": "3618",
        "name": "Gorlovka",
        "nametype": "Valid",
        "recclass": "H3.7",
        "reclat": "48.283330",
        "reclong": "38.083330",
        "year": "1974-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                2.25,
        42.9
            )
        ,
        "id": "10956",
        "mass": "9000",
        "name": "Granes",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "42.900000",
        "reclong": "2.250000",
        "year": "1964-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                11,
        60.66667
            )
        ,
        "id": "11196",
        "mass": "45.5",
        "name": "Grefsheim",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "60.666670",
        "reclong": "11.000000",
        "year": "1976-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -79.61667,
        43.2
            )
        ,
        "id": "50911",
        "mass": "215",
        "name": "Grimsby",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "43.200000",
        "reclong": "-79.616670",
        "year": "2009-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                45.38333,
        43.66667
            )
        ,
        "id": "11206",
        "mass": "3500",
        "name": "Grosnaja",
        "nametype": "Valid",
        "recclass": "CV3",
        "reclat": "43.666670",
        "reclong": "45.383330",
        "year": "1861-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                18.71667,
        49.26667
            )
        ,
        "id": "11207",
        "mass": "10500",
        "name": "Gross-Divina",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "49.266670",
        "reclong": "18.716670",
        "year": "1837-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                30.58333,
        46.35
            )
        ,
        "id": "11208",
        "mass": "8000",
        "name": "Grossliebenthal",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "46.350000",
        "reclong": "30.583330",
        "year": "1881-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                15.5,
        51.93333
            )
        ,
        "id": "11426",
        "mass": "1000",
        "name": "Grüneberg",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "51.933330",
        "reclong": "15.500000",
        "year": "1841-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                16.63333,
        52.86667
            )
        ,
        "id": "11429",
        "mass": "690",
        "name": "Grzempach",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "52.866670",
        "reclong": "16.633330",
        "year": "1910-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -58.61667,
        -33
            )
        ,
        "id": "11432",
        "mass": "22000",
        "name": "Gualeguaychú",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "-33.000000",
        "reclong": "-58.616670",
        "year": "1932-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                122.76389,
        39.80417
            )
        ,
        "id": "11435",
        "mass": "2910",
        "name": "Guangmingshan",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "39.804170",
        "reclong": "122.763890",
        "year": "1996-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                105,
        24.1
            )
        ,
        "id": "11436",
        "name": "Guangnan",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "24.100000",
        "reclong": "105.000000",
        "year": "1983-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                118.4,
        37.1
            )
        ,
        "id": "11437",
        "mass": "1900",
        "name": "Guangrao",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "37.100000",
        "reclong": "118.400000",
        "year": "1980-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -6.01667,
        38.73333
            )
        ,
        "id": "11439",
        "mass": "39000",
        "name": "Guareña",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "38.733330",
        "reclong": "-6.016670",
        "year": "1892-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                20.23333,
        43.76667
            )
        ,
        "id": "11440",
        "mass": "1915",
        "name": "Guêa",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "43.766670",
        "reclong": "20.233330",
        "year": "1891-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -0.68333,
        13.5
            )
        ,
        "id": "11442",
        "mass": "288",
        "name": "Guibga",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "13.500000",
        "reclong": "-0.683330",
        "year": "1972-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                13.98333,
        9.91667
            )
        ,
        "id": "11443",
        "mass": "968",
        "name": "Guidder",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "9.916670",
        "reclong": "13.983330",
        "year": "1949-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.05,
        22.98333
            )
        ,
        "id": "11448",
        "mass": "2449",
        "name": "Gujargaon",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "22.983330",
        "reclong": "76.050000",
        "year": "1982-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                11.65833,
        11.49167
            )
        ,
        "id": "11449",
        "mass": "100000",
        "name": "Gujba",
        "nametype": "Valid",
        "recclass": "CBa",
        "reclat": "11.491670",
        "reclong": "11.658330",
        "year": "1984-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                24.7,
        42.9
            )
        ,
        "id": "11450",
        "mass": "5700",
        "name": "Gumoschnik",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "42.900000",
        "reclong": "24.700000",
        "year": "1904-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.56667,
        13.78333
            )
        ,
        "id": "11464",
        "mass": "28",
        "name": "Gurram Konda",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "13.783330",
        "reclong": "78.566670",
        "year": "1814-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                42.41667,
        9.36667
            )
        ,
        "id": "11465",
        "mass": "34650",
        "name": "Gursum",
        "nametype": "Valid",
        "recclass": "H4/5",
        "reclat": "9.366670",
        "reclong": "42.416670",
        "year": "1981-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8.38333,
        51.91667
            )
        ,
        "id": "11466",
        "mass": "1000",
        "name": "Gütersloh",
        "nametype": "Valid",
        "recclass": "H3/4",
        "reclat": "51.916670",
        "reclong": "8.383330",
        "year": "1851-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                127.5,
        35
            )
        ,
        "id": "11467",
        "mass": "1320",
        "name": "Gyokukei",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "35.000000",
        "reclong": "127.500000",
        "year": "1930-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                139.33333,
        35.65
            )
        ,
        "id": "11468",
        "mass": "0.2",
        "name": "Hachi-oji",
        "nametype": "Valid",
        "recclass": "H?",
        "reclat": "35.650000",
        "reclong": "139.333330",
        "year": "1817-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                3.73333,
        50.31667
            )
        ,
        "id": "11472",
        "mass": "9000",
        "name": "Hainaut",
        "nametype": "Valid",
        "recclass": "H3-6",
        "reclat": "50.316670",
        "reclong": "3.733330",
        "year": "1934-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                16.23333,
        57.81667
            )
        ,
        "id": "11479",
        "mass": "1456",
        "name": "Hallingeberg",
        "nametype": "Valid",
        "recclass": "L3.4",
        "reclat": "57.816670",
        "reclong": "16.233330",
        "year": "1944-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "35",
        ":@computed_region_nnqa_25f4": "1205",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -86.6,
        41.38333
            )
        ,
        "id": "11485",
        "mass": "3710",
        "name": "Hamlet",
        "nametype": "Valid",
        "recclass": "LL4",
        "reclat": "41.383330",
        "reclong": "-86.600000",
        "year": "1959-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                82.53333,
        26.8
            )
        ,
        "id": "11824",
        "mass": "1000",
        "name": "Haraiya",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "26.800000",
        "reclong": "82.533330",
        "year": "1878-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                75.78333,
        28.38333
            )
        ,
        "id": "11829",
        "mass": "315",
        "name": "Haripura",
        "nametype": "Valid",
        "recclass": "CM2",
        "reclat": "28.383330",
        "reclong": "75.783330",
        "year": "1921-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "23",
        ":@computed_region_nnqa_25f4": "2025",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -94.51167,
        32.675
            )
        ,
        "id": "11830",
        "mass": "8360",
        "name": "Harleton",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "32.675000",
        "reclong": "-94.511670",
        "year": "1961-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "35",
        ":@computed_region_nnqa_25f4": "1855",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -86.16667,
        38.25
            )
        ,
        "id": "11842",
        "mass": "680",
        "name": "Harrison County",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "38.250000",
        "reclong": "-86.166670",
        "year": "1859-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                136.70033,
        35.2945
            )
        ,
        "id": "11848",
        "mass": "1110.5999999999999",
        "name": "Hashima",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "35.294500",
        "reclong": "136.700330",
        "year": "1910-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.81667,
        28.95
            )
        ,
        "id": "11852",
        "mass": "1250",
        "name": "Hassi-Jekna",
        "nametype": "Valid",
        "recclass": "Iron, IAB-sHL",
        "reclat": "28.950000",
        "reclong": "0.816670",
        "year": "1890-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -1.51667,
        51.65
            )
        ,
        "id": "11855",
        "mass": "29000",
        "name": "Hatford",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "51.650000",
        "reclong": "-1.516670",
        "year": "1628-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                22.06194,
        60.24556
            )
        ,
        "id": "11859",
        "mass": "1544",
        "name": "Haverö",
        "nametype": "Valid",
        "recclass": "Ureilite",
        "reclat": "60.245560",
        "reclong": "22.061940",
        "year": "1971-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                13.78333,
        55.46667
            )
        ,
        "id": "11869",
        "mass": "3500",
        "name": "Hedeskoga",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "55.466670",
        "reclong": "13.783330",
        "year": "1922-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                35.66667,
        27.33333
            )
        ,
        "id": "11870",
        "mass": "6100",
        "name": "Hedjaz",
        "nametype": "Valid",
        "recclass": "L3.7-6",
        "reclat": "27.333330",
        "reclong": "35.666670",
        "year": "1910-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -84.1,
        10
            )
        ,
        "id": "11875",
        "mass": "1000",
        "name": "Heredia",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "10.000000",
        "reclong": "-84.100000",
        "year": "1857-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                17.66667,
        59.85
            )
        ,
        "id": "11878",
        "mass": "20000",
        "name": "Hessle",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "59.850000",
        "reclong": "17.666670",
        "year": "1869-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                130.43333,
        33.6
            )
        ,
        "id": "11883",
        "mass": "750",
        "name": "Higashi-koen",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "33.600000",
        "reclong": "130.433330",
        "year": "1897-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -4.23333,
        55.9
            )
        ,
        "id": "11884",
        "mass": "4500",
        "name": "High Possil",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "55.900000",
        "reclong": "-4.233330",
        "year": "1804-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                132.38333,
        34.45
            )
        ,
        "id": "11889",
        "mass": "414",
        "name": "Hiroshima",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "34.450000",
        "reclong": "132.383330",
        "year": "2003-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                31.47278,
        1.345
            )
        ,
        "id": "44714",
        "mass": "167.7",
        "name": "Hoima",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "1.345000",
        "reclong": "31.472780",
        "year": "2003-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                21.2,
        64.43333
            )
        ,
        "id": "11893",
        "mass": "305.5",
        "name": "Hökmark",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "64.433330",
        "reclong": "21.200000",
        "year": "1954-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "7",
        ":@computed_region_nnqa_25f4": "990",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -110.18333,
        34.9
            )
        ,
        "id": "11894",
        "mass": "220000",
        "name": "Holbrook",
        "nametype": "Valid",
        "recclass": "L/LL6",
        "reclat": "34.900000",
        "reclong": "-110.183330",
        "year": "1912-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                38.41667,
        9.06667
            )
        ,
        "id": "11895",
        "mass": "1415",
        "name": "Holetta",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "9.066670",
        "reclong": "38.416670",
        "year": "1923-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "16",
        ":@computed_region_nnqa_25f4": "284",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -91.86667,
        41.8
            )
        ,
        "id": "11901",
        "mass": "230000",
        "name": "Homestead",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "41.800000",
        "reclong": "-91.866670",
        "year": "1875-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "4",
        ":@computed_region_nnqa_25f4": "1657",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -157.86667,
        21.3
            )
        ,
        "id": "11904",
        "mass": "2420",
        "name": "Honolulu",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "21.300000",
        "reclong": "-157.866670",
        "year": "1825-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                115.5,
        35.66667
            )
        ,
        "id": "11913",
        "mass": "180",
        "name": "Hotse",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "35.666670",
        "reclong": "115.500000",
        "year": "1956-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "17",
        ":@computed_region_nnqa_25f4": "1293",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -100.45,
        39.35
            )
        ,
        "id": "11915",
        "mass": "266.10000000000002",
        "name": "Hoxie",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "39.350000",
        "reclong": "-100.450000",
        "year": "1963-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                16.33333,
        46.1
            )
        ,
        "id": "11916",
        "mass": "49000",
        "name": "Hraschina",
        "nametype": "Valid",
        "recclass": "Iron, IID",
        "reclat": "46.100000",
        "reclong": "16.333330",
        "year": "1751-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                106.63241,
        26.46469
            )
        ,
        "id": "54719",
        "mass": "1600",
        "name": "Huaxi",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "26.464690",
        "reclong": "106.632410",
        "year": "2010-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8.91667,
        50.3
            )
        ,
        "id": "11986",
        "mass": "112",
        "name": "Hungen",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "50.300000",
        "reclong": "8.916670",
        "year": "1877-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                22.68333,
        61.18333
            )
        ,
        "id": "11989",
        "mass": "14000",
        "name": "Hvittis",
        "nametype": "Valid",
        "recclass": "EL6",
        "reclat": "61.183330",
        "reclong": "22.683330",
        "year": "1901-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                7.7,
        52.28333
            )
        ,
        "id": "11992",
        "mass": "2000",
        "name": "Ibbenbüren",
        "nametype": "Valid",
        "recclass": "Diogenite",
        "reclat": "52.283330",
        "reclong": "7.700000",
        "year": "1870-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -45,
        -20
            )
        ,
        "id": "11993",
        "mass": "2500",
        "name": "Ibitira",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "-20.000000",
        "reclong": "-45.000000",
        "year": "1957-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                35,
        38
            )
        ,
        "id": "11994",
        "name": "Ibrisim",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "38.000000",
        "reclong": "35.000000",
        "year": "1949-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                82.93333,
        58.2
            )
        ,
        "id": "11995",
        "mass": "3973",
        "name": "Ichkala",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "58.200000",
        "reclong": "82.933330",
        "year": "1936-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                28.33333,
        -32.1
            )
        ,
        "id": "12000",
        "mass": "3457",
        "name": "Idutywa",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-32.100000",
        "reclong": "28.333330",
        "year": "1956-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -51.83333,
        -23.2
            )
        ,
        "id": "12003",
        "mass": "1200",
        "name": "Iguaracu",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-23.200000",
        "reclong": "-51.833330",
        "year": "1977-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                145.36667,
        -6.03333
            )
        ,
        "id": "12004",
        "mass": "7330",
        "name": "Ijopega",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "-6.033330",
        "reclong": "145.366670",
        "year": "1975-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                46.66667,
        39.75
            )
        ,
        "id": "12027",
        "mass": "27000",
        "name": "Indarch",
        "nametype": "Valid",
        "recclass": "EH4",
        "reclat": "39.750000",
        "reclong": "46.666670",
        "year": "1891-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "18",
        ":@computed_region_nnqa_25f4": "525",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -94.4,
        39.08333
            )
        ,
        "id": "12028",
        "mass": "880",
        "name": "Independence",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "39.083330",
        "reclong": "-94.400000",
        "year": "1917-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                112,
        41
            )
        ,
        "id": "12037",
        "mass": "3000",
        "name": "Inner Mongolia",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "41.000000",
        "reclong": "112.000000",
        "year": "1963-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -111.3375,
        53.415
            )
        ,
        "id": "12039",
        "mass": "4576",
        "name": "Innisfree",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "53.415000",
        "reclong": "-111.337500",
        "year": "1977-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -54.5,
        -25.5
            )
        ,
        "id": "12043",
        "mass": "7000",
        "name": "Ipiranga",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "-25.500000",
        "reclong": "-54.500000",
        "year": "1972-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                33.8,
        -8.93333
            )
        ,
        "id": "12049",
        "mass": "1300",
        "name": "Ishinga",
        "nametype": "Valid",
        "recclass": "H",
        "reclat": "-8.933330",
        "reclong": "33.800000",
        "year": "1954-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -57.95,
        -31.18333
            )
        ,
        "id": "12053",
        "mass": "3050",
        "name": "Isthilart",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-31.183330",
        "reclong": "-57.950000",
        "year": "1928-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -44.33333,
        -3.4
            )
        ,
        "id": "12056",
        "mass": "2024",
        "name": "Itapicuru-Mirim",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-3.400000",
        "reclong": "-44.333330",
        "year": "1879-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -12.95217,
        26.59083
            )
        ,
        "id": "12058",
        "mass": "4720",
        "name": "Itqiy",
        "nametype": "Valid",
        "recclass": "EH7-an",
        "reclat": "26.590830",
        "reclong": "-12.952170",
        "year": "1990-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                32.43333,
        -8.41667
            )
        ,
        "id": "12063",
        "mass": "704.5",
        "name": "Ivuna",
        "nametype": "Valid",
        "recclass": "CI1",
        "reclat": "-8.416670",
        "reclong": "32.433330",
        "year": "1938-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                21.9,
        -32.5
            )
        ,
        "id": "12065",
        "mass": "48000",
        "name": "Jackalsfontein",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-32.500000",
        "reclong": "21.900000",
        "year": "1903-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                68.41667,
        26.75
            )
        ,
        "id": "12067",
        "mass": "973",
        "name": "Jajh deh Kot Lalu",
        "nametype": "Valid",
        "recclass": "EL6",
        "reclat": "26.750000",
        "reclong": "68.416670",
        "year": "1926-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "id": "12068",
        "mass": "700",
        "name": "Jalanash",
        "nametype": "Valid",
        "recclass": "Ureilite",
        "year": "1990-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                75,
        31
            )
        ,
        "id": "12069",
        "mass": "1967",
        "name": "Jalandhar",
        "nametype": "Valid",
        "recclass": "Iron",
        "reclat": "31.000000",
        "reclong": "75.000000",
        "year": "1621-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                75.33333,
        18.75
            )
        ,
        "id": "12072",
        "mass": "22",
        "name": "Jamkheir",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "18.750000",
        "reclong": "75.333330",
        "year": "1866-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                105.8,
        39.7
            )
        ,
        "id": "12074",
        "mass": "20500",
        "name": "Jartai",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "39.700000",
        "reclong": "105.800000",
        "year": "1979-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                20.44167,
        43.83333
            )
        ,
        "id": "12078",
        "mass": "34000",
        "name": "Jelica",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "43.833330",
        "reclong": "20.441670",
        "year": "1889-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "id": "12079",
        "mass": "450",
        "name": "Jemlapur",
        "nametype": "Valid",
        "recclass": "L6",
        "year": "1901-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                14.05217,
        46.42137
            )
        ,
        "id": "51589",
        "mass": "3667",
        "name": "Jesenice",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "46.421370",
        "reclong": "14.052170",
        "year": "2009-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                72.38333,
        31.3
            )
        ,
        "id": "12085",
        "mass": "5900",
        "name": "Jhung",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "31.300000",
        "reclong": "72.383330",
        "year": "1873-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                104.91667,
        31.91667
            )
        ,
        "id": "12086",
        "mass": "222",
        "name": "Jiange",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "31.916670",
        "reclong": "104.916670",
        "year": "1964-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                109.5,
        30.80833
            )
        ,
        "id": "12087",
        "mass": "600000",
        "name": "Jianshi",
        "nametype": "Valid",
        "recclass": "Iron, IIIAB",
        "reclat": "30.808330",
        "reclong": "109.500000",
        "year": "1890-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                126.16667,
        44.05
            )
        ,
        "id": "12171",
        "mass": "4000000",
        "name": "Jilin",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "44.050000",
        "reclong": "126.166670",
        "year": "1976-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                70.31333,
        22.68
            )
        ,
        "id": "47362",
        "mass": "100",
        "name": "Jodiya",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "22.680000",
        "reclong": "70.313330",
        "year": "2006-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                24.4,
        55.7
            )
        ,
        "id": "12173",
        "mass": "30",
        "name": "Jodzie",
        "nametype": "Valid",
        "recclass": "Howardite",
        "reclat": "55.700000",
        "reclong": "24.400000",
        "year": "1877-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "9",
        ":@computed_region_nnqa_25f4": "1072",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -104.9,
        40.35
            )
        ,
        "id": "12198",
        "mass": "40300",
        "name": "Johnstown",
        "nametype": "Valid",
        "recclass": "Diogenite",
        "reclat": "40.350000",
        "reclong": "-104.900000",
        "year": "1924-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                15.83333,
        -11.85
            )
        ,
        "id": "12199",
        "mass": "483",
        "name": "Jolomba",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "-11.850000",
        "reclong": "15.833330",
        "year": "1974-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -0.45,
        45.43333
            )
        ,
        "id": "12202",
        "mass": "5000",
        "name": "Jonzac",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "45.433330",
        "reclong": "-0.450000",
        "year": "1819-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                115.41667,
        35.5
            )
        ,
        "id": "12203",
        "mass": "100000",
        "name": "Juancheng",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "35.500000",
        "reclong": "115.416670",
        "year": "1997-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.8,
        12.85
            )
        ,
        "id": "12207",
        "mass": "680",
        "name": "Judesegeri",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "12.850000",
        "reclong": "76.800000",
        "year": "1876-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                111.2,
        -7.71667
            )
        ,
        "id": "12209",
        "mass": "32490",
        "name": "Jumapalo",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-7.716670",
        "reclong": "111.200000",
        "year": "1984-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                118.8,
        35.2
            )
        ,
        "id": "12210",
        "mass": "950",
        "name": "Junan",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "35.200000",
        "reclong": "118.800000",
        "year": "1976-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -7.27,
        38.74028
            )
        ,
        "id": "12213",
        "mass": "25250",
        "name": "Juromenha",
        "nametype": "Valid",
        "recclass": "Iron, IIIAB",
        "reclat": "38.740280",
        "reclong": "-7.270000",
        "year": "1968-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                4.3,
        44.71667
            )
        ,
        "id": "12214",
        "mass": "91000",
        "name": "Juvinas",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "44.716670",
        "reclong": "4.300000",
        "year": "1821-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                21.3,
        47.35
            )
        ,
        "id": "12218",
        "mass": "3000",
        "name": "Kaba",
        "nametype": "Valid",
        "recclass": "CV3",
        "reclat": "47.350000",
        "reclong": "21.300000",
        "year": "1857-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8.21667,
        11.85
            )
        ,
        "id": "12220",
        "mass": "13400",
        "name": "Kabo",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "11.850000",
        "reclong": "8.216670",
        "year": "1971-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.33333,
        27.08333
            )
        ,
        "id": "12221",
        "mass": "89",
        "name": "Kadonah",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "27.083330",
        "reclong": "78.333330",
        "year": "1822-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                79.96667,
        27.25
            )
        ,
        "id": "12222",
        "mass": "230",
        "name": "Kaee",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "27.250000",
        "reclong": "79.966670",
        "year": "1838-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                30.83333,
        49.86667
            )
        ,
        "id": "12227",
        "mass": "1900",
        "name": "Kagarlyk",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "49.866670",
        "reclong": "30.833330",
        "year": "1908-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                48.3,
        15
            )
        ,
        "id": "12228",
        "mass": "2000",
        "name": "Kaidun",
        "nametype": "Valid",
        "recclass": "CR2",
        "reclat": "15.000000",
        "reclong": "48.300000",
        "year": "1980-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                53.25,
        55.43333
            )
        ,
        "id": "12229",
        "mass": "200000",
        "name": "Kainsaz",
        "nametype": "Valid",
        "recclass": "CO3.2",
        "reclat": "55.433330",
        "reclong": "53.250000",
        "year": "1937-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.51667,
        12.38333
            )
        ,
        "id": "12230",
        "mass": "350",
        "name": "Kakangari",
        "nametype": "Valid",
        "recclass": "K3",
        "reclat": "12.383330",
        "reclong": "78.516670",
        "year": "1890-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                21.66667,
        45.13333
            )
        ,
        "id": "12231",
        "mass": "577",
        "name": "Kakowa",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "45.133330",
        "reclong": "21.666670",
        "year": "1858-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                29.5,
        -6.83333
            )
        ,
        "id": "12232",
        "mass": "950",
        "name": "Kalaba",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "-6.833330",
        "reclong": "29.500000",
        "year": "1951-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                73.98333,
        17.83333
            )
        ,
        "id": "12236",
        "mass": "4500",
        "name": "Kalumbi",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "17.833330",
        "reclong": "73.983330",
        "year": "1879-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                81.46667,
        26.03333
            )
        ,
        "id": "12238",
        "mass": "2770",
        "name": "Kamalpur",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "26.033330",
        "reclong": "81.466670",
        "year": "1942-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                139.95667,
        36.04167
            )
        ,
        "id": "12240",
        "mass": "448",
        "name": "Kamiomi",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "36.041670",
        "reclong": "139.956670",
        "year": "1913-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                75.8,
        14.18333
            )
        ,
        "id": "12241",
        "mass": "1293",
        "name": "Kamsagar",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "14.183330",
        "reclong": "75.800000",
        "year": "1902-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                65.78333,
        31.6
            )
        ,
        "id": "12243",
        "mass": "299",
        "name": "Kandahar st_make_point(Afghanistan)",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "31.600000",
        "reclong": "65.783330",
        "year": "1959-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                115.5,
        -7
            )
        ,
        "id": "12245",
        "mass": "1630",
        "name": "Kangean",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-7.000000",
        "reclong": "115.500000",
        "year": "1908-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.3,
        32.08333
            )
        ,
        "id": "12246",
        "mass": "400",
        "name": "Kangra Valley",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "32.083330",
        "reclong": "76.300000",
        "year": "1897-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                33.63333,
        4.7
            )
        ,
        "id": "12251",
        "mass": "11355",
        "name": "Kapoeta",
        "nametype": "Valid",
        "recclass": "Howardite",
        "reclat": "4.700000",
        "reclong": "33.633330",
        "year": "1942-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                73.22329,
        20.33916
            )
        ,
        "id": "47357",
        "mass": "1600",
        "name": "Kaprada",
        "nametype": "Valid",
        "recclass": "L5/6",
        "reclat": "20.339160",
        "reclong": "73.223290",
        "year": "2004-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                73.36667,
        42.45
            )
        ,
        "id": "12253",
        "mass": "3500",
        "name": "Kaptal-Aryk",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "42.450000",
        "reclong": "73.366670",
        "year": "1937-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                81.01667,
        47.21667
            )
        ,
        "id": "12256",
        "mass": "3000",
        "name": "Karakol",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "47.216670",
        "reclong": "81.016670",
        "year": "1840-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                35.58333,
        -3.5
            )
        ,
        "id": "12258",
        "mass": "2220",
        "name": "Karatu",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "-3.500000",
        "reclong": "35.583330",
        "year": "1963-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                7.15,
        12.9
            )
        ,
        "id": "12260",
        "mass": "180",
        "name": "Karewar",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "12.900000",
        "reclong": "7.150000",
        "year": "1949-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                67.16667,
        27.8
            )
        ,
        "id": "12262",
        "mass": "22000",
        "name": "Karkh",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "27.800000",
        "reclong": "67.166670",
        "year": "1905-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                71.6,
        31.58333
            )
        ,
        "id": "12263",
        "mass": "2950",
        "name": "Karloowala",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "31.583330",
        "reclong": "71.600000",
        "year": "1955-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                139.91667,
        -35.08333
            )
        ,
        "id": "12264",
        "mass": "41730",
        "name": "Karoonda",
        "nametype": "Valid",
        "recclass": "CK4",
        "reclat": "-35.083330",
        "reclong": "139.916670",
        "year": "1930-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                136.76667,
        35.36667
            )
        ,
        "id": "12266",
        "mass": "710",
        "name": "Kasamatsu",
        "nametype": "Valid",
        "recclass": "H",
        "reclat": "35.366670",
        "reclong": "136.766670",
        "year": "1938-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                77.58333,
        29.58333
            )
        ,
        "id": "30740",
        "mass": "16820",
        "name": "Kasauli",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "29.583330",
        "reclong": "77.583330",
        "year": "2003-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                10.08333,
        11.33333
            )
        ,
        "id": "35465",
        "mass": "1500",
        "name": "Katagum",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "11.333330",
        "reclong": "10.083330",
        "year": "1999-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                75.81333,
        25.14333
            )
        ,
        "id": "47351",
        "mass": "6800",
        "name": "Kavarpura",
        "nametype": "Valid",
        "recclass": "Iron, IIE-an",
        "reclat": "25.143330",
        "reclong": "75.813330",
        "year": "2006-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                31.78,
        39.26333
            )
        ,
        "id": "12268",
        "mass": "85000",
        "name": "Kayakent",
        "nametype": "Valid",
        "recclass": "Iron, IIIAB",
        "reclat": "39.263330",
        "reclong": "31.780000",
        "year": "1961-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                112.01667,
        -7.75
            )
        ,
        "id": "12270",
        "mass": "3300",
        "name": "Kediri",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "-7.750000",
        "reclong": "112.016670",
        "year": "1940-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                29.41822,
        36.54194
            )
        ,
        "id": "53654",
        "mass": "5760",
        "name": "Kemer",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "36.541940",
        "reclong": "29.418220",
        "year": "2008-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "23",
        ":@computed_region_nnqa_25f4": "3190",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -96,
        29.45
            )
        ,
        "id": "12275",
        "mass": "6937",
        "name": "Kendleton",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "29.450000",
        "reclong": "-96.000000",
        "year": "1939-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                86.70278,
        20.4625
            )
        ,
        "id": "12276",
        "mass": "6669.2",
        "name": "Kendrapara",
        "nametype": "Valid",
        "recclass": "H4-5",
        "reclat": "20.462500",
        "reclong": "86.702780",
        "year": "2003-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -3.3,
        48.4
            )
        ,
        "id": "12282",
        "mass": "5000",
        "name": "Kerilis",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "48.400000",
        "reclong": "-3.300000",
        "year": "1874-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -3.08333,
        48.11667
            )
        ,
        "id": "12284",
        "mass": "80000",
        "name": "Kernouve",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "48.116670",
        "reclong": "-3.083330",
        "year": "1869-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                141.61667,
        38.98333
            )
        ,
        "id": "12286",
        "mass": "135000",
        "name": "Kesen",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "38.983330",
        "reclong": "141.616670",
        "year": "1850-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                72.3,
        29.53333
            )
        ,
        "id": "12288",
        "mass": "13600",
        "name": "Khairpur",
        "nametype": "Valid",
        "recclass": "EL6",
        "reclat": "29.533330",
        "reclong": "72.300000",
        "year": "1873-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                83.11667,
        25.55
            )
        ,
        "id": "12289",
        "mass": "3698",
        "name": "Khanpur",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "25.550000",
        "reclong": "83.116670",
        "year": "1932-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                35.075,
        50.625
            )
        ,
        "id": "12291",
        "mass": "1500",
        "name": "Kharkov",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "50.625000",
        "reclong": "35.075000",
        "year": "1787-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                77.88333,
        26.95
            )
        ,
        "id": "12294",
        "mass": "450",
        "name": "Kheragur",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "26.950000",
        "reclong": "77.883330",
        "year": "1860-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                75.81667,
        28.01667
            )
        ,
        "id": "12296",
        "mass": "100",
        "name": "Khetri",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "28.016670",
        "reclong": "75.816670",
        "year": "1867-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                75.33333,
        56.75
            )
        ,
        "id": "12297",
        "mass": "6109",
        "name": "Khmelevka",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "56.750000",
        "reclong": "75.333330",
        "year": "1929-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                81.53333,
        25.1
            )
        ,
        "id": "12298",
        "mass": "9700",
        "name": "Khohar",
        "nametype": "Valid",
        "recclass": "L3.6",
        "reclat": "25.100000",
        "reclong": "81.533330",
        "year": "1910-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                36,
        16
            )
        ,
        "id": "12299",
        "mass": "3200",
        "name": "Khor Temiki",
        "nametype": "Valid",
        "recclass": "Aubrite",
        "reclat": "16.000000",
        "reclong": "36.000000",
        "year": "1932-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                28,
        14
            )
        ,
        "id": "12300",
        "mass": "100000",
        "name": "Kidairat",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "14.000000",
        "reclong": "28.000000",
        "year": "1983-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                10.15,
        54.4
            )
        ,
        "id": "12301",
        "mass": "737.6",
        "name": "Kiel",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "54.400000",
        "reclong": "10.150000",
        "year": "1962-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -11.33333,
        16.58333
            )
        ,
        "id": "12303",
        "mass": "1500",
        "name": "Kiffa",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "16.583330",
        "reclong": "-11.333330",
        "year": "1970-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                138.38333,
        36.85
            )
        ,
        "id": "12305",
        "mass": "331",
        "name": "Kijima st_make_point(1906)",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "36.850000",
        "reclong": "138.383330",
        "year": "1906-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                34,
        55
            )
        ,
        "id": "12306",
        "mass": "195",
        "name": "Kikino",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "55.000000",
        "reclong": "34.000000",
        "year": "1809-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                9.8,
        12.76667
            )
        ,
        "id": "12307",
        "mass": "19000",
        "name": "Kilabo",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "12.766670",
        "reclong": "9.800000",
        "year": "2002-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "41",
        ":@computed_region_nnqa_25f4": "2971",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -89.6,
        43.58333
            )
        ,
        "id": "12308",
        "mass": "772",
        "name": "Kilbourn",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "43.583330",
        "reclong": "-89.600000",
        "year": "1911-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -7.66667,
        54.66667
            )
        ,
        "id": "12309",
        "mass": "140",
        "name": "Killeter",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "54.666670",
        "reclong": "-7.666670",
        "year": "1844-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                24.68333,
        11.63333
            )
        ,
        "id": "12316",
        "mass": "67.400000000000006",
        "name": "Kingai",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "11.633330",
        "reclong": "24.683330",
        "year": "1967-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "23",
        ":@computed_region_nnqa_25f4": "2018",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -95.95,
        30.75
            )
        ,
        "id": "12321",
        "mass": "97.7",
        "name": "Kirbyville",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "30.750000",
        "reclong": "-95.950000",
        "year": "1906-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                22.30833,
        48.16667
            )
        ,
        "id": "12325",
        "mass": "1550",
        "name": "Kisvarsány",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "48.166670",
        "reclong": "22.308330",
        "year": "1914-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -80.38333,
        43.38333
            )
        ,
        "id": "12326",
        "mass": "202.6",
        "name": "Kitchener",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "43.383330",
        "reclong": "-80.383330",
        "year": "1998-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                10.8,
        51.6
            )
        ,
        "id": "12332",
        "mass": "3250",
        "name": "Klein-Wenden",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "51.600000",
        "reclong": "10.800000",
        "year": "1843-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                22.4,
        48.9
            )
        ,
        "id": "12335",
        "mass": "500000",
        "name": "Knyahinya",
        "nametype": "Valid",
        "recclass": "L/LL5",
        "reclat": "48.900000",
        "reclong": "22.400000",
        "year": "1866-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                135.16667,
        34.73333
            )
        ,
        "id": "12336",
        "mass": "136",
        "name": "Kobe",
        "nametype": "Valid",
        "recclass": "CK4",
        "reclat": "34.733330",
        "reclong": "135.166670",
        "year": "1999-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                133.95,
        34.3
            )
        ,
        "id": "12342",
        "mass": "11510",
        "name": "Kokubunji",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "34.300000",
        "reclong": "133.950000",
        "year": "1986-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                139.75,
        35.73333
            )
        ,
        "id": "12343",
        "mass": "238",
        "name": "Komagome",
        "nametype": "Valid",
        "recclass": "Iron",
        "reclat": "35.733330",
        "reclong": "139.750000",
        "year": "1926-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                26.16667,
        42.51667
            )
        ,
        "id": "12344",
        "mass": "90",
        "name": "Konovo",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "42.516670",
        "reclong": "26.166670",
        "year": "1931-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                21.17633,
        48.76367
            )
        ,
        "id": "53810",
        "mass": "4300",
        "name": "Košice",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "48.763670",
        "reclong": "21.176330",
        "year": "2010-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                7.46472,
        49.32694
            )
        ,
        "id": "12353",
        "mass": "16500",
        "name": "Krähenberg",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "49.326940",
        "reclong": "7.464720",
        "year": "1869-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                40.9,
        54.03333
            )
        ,
        "id": "12355",
        "mass": "2440",
        "name": "Krasnoi-Ugol",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "54.033330",
        "reclong": "40.900000",
        "year": "1829-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                56.08333,
        54.33333
            )
        ,
        "id": "12357",
        "mass": "4000",
        "name": "Krasnyi Klyuch",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "54.333330",
        "reclong": "56.083330",
        "year": "1946-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                77,
        56.8
            )
        ,
        "id": "12363",
        "mass": "845.2",
        "name": "Krutikha",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "56.800000",
        "reclong": "77.000000",
        "year": "1906-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                30.76667,
        47.83333
            )
        ,
        "id": "12364",
        "mass": "50000",
        "name": "Krymka",
        "nametype": "Valid",
        "recclass": "LL3.2",
        "reclat": "47.833330",
        "reclong": "30.766670",
        "year": "1946-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                31.7,
        51.15
            )
        ,
        "id": "12368",
        "mass": "2250",
        "name": "Kukschin",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "51.150000",
        "reclong": "31.700000",
        "year": "1938-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                66.80222,
        30.73111
            )
        ,
        "id": "12369",
        "mass": "453.6",
        "name": "Kulak",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "30.731110",
        "reclong": "66.802220",
        "year": "1961-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                33.5,
        50.75
            )
        ,
        "id": "12370",
        "mass": "6000",
        "name": "Kuleschovka",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "50.750000",
        "reclong": "33.500000",
        "year": "1811-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                45,
        41.11667
            )
        ,
        "id": "12373",
        "mass": "3719",
        "name": "Kulp",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "41.116670",
        "reclong": "45.000000",
        "year": "1906-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                61.36667,
        55.78333
            )
        ,
        "id": "12377",
        "mass": "200000",
        "name": "Kunashak",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "55.783330",
        "reclong": "61.366670",
        "year": "1949-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                59.2,
        42.25
            )
        ,
        "id": "12379",
        "mass": "1100000",
        "name": "Kunya-Urgench",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "42.250000",
        "reclong": "59.200000",
        "year": "1998-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                138.38333,
        37.05
            )
        ,
        "id": "12381",
        "mass": "4460",
        "name": "Kushiike",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "37.050000",
        "reclong": "138.383330",
        "year": "1920-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.38333,
        29.68333
            )
        ,
        "id": "12382",
        "mass": "5",
        "name": "Kusiali",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "29.683330",
        "reclong": "78.383330",
        "year": "1860-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                39.3,
        44.51667
            )
        ,
        "id": "12383",
        "mass": "23",
        "name": "Kutais",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "44.516670",
        "reclong": "39.300000",
        "year": "1977-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.03333,
        10.83333
            )
        ,
        "id": "12384",
        "mass": "45000",
        "name": "Kuttippuram",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "10.833330",
        "reclong": "76.033330",
        "year": "1914-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                75.33333,
        55.2
            )
        ,
        "id": "12385",
        "mass": "4047",
        "name": "Kuznetzovo",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "55.200000",
        "reclong": "75.333330",
        "year": "1932-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                130.63333,
        32.03333
            )
        ,
        "id": "12390",
        "mass": "45000",
        "name": "Kyushu",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "32.033330",
        "reclong": "130.633330",
        "year": "1886-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                1.75,
        47.08333
            )
        ,
        "id": "12392",
        "mass": "2800",
        "name": "La Bécasse",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "47.083330",
        "reclong": "1.750000",
        "year": "1879-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -101.28333,
        20.66667
            )
        ,
        "id": "12394",
        "mass": "399",
        "name": "La Charca",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "20.666670",
        "reclong": "-101.283330",
        "year": "1878-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -61.53333,
        -37.33333
            )
        ,
        "id": "12395",
        "mass": "2000",
        "name": "La Colina",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-37.333330",
        "reclong": "-61.533330",
        "year": "1924-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -58.16667,
        -31.23333
            )
        ,
        "id": "12396",
        "mass": "45000",
        "name": "La Criolla",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-31.233330",
        "reclong": "-58.166670",
        "year": "1985-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                5.58333,
        44.28333
            )
        ,
        "id": "12408",
        "mass": "3833",
        "name": "Laborel",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "44.283330",
        "reclong": "5.583330",
        "year": "1871-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                82.71667,
        26.78333
            )
        ,
        "id": "12433",
        "mass": "900",
        "name": "Lahrauli",
        "nametype": "Valid",
        "recclass": "Ureilite",
        "reclat": "26.783330",
        "reclong": "82.716670",
        "year": "1955-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.63333,
        48.76667
            )
        ,
        "id": "12434",
        "mass": "37000",
        "name": "L'Aigle",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "48.766670",
        "reclong": "0.633330",
        "year": "1803-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Found",
        "id": "32531",
        "mass": "9.6",
        "name": "Cumulus Hills 04075",
        "nametype": "Valid",
        "recclass": "Pallasite",
        "year": "2003-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.03333,
        21.86667
            )
        ,
        "id": "12435",
        "mass": "212.5",
        "name": "Lakangaon",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "21.866670",
        "reclong": "76.033330",
        "year": "1910-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.56667,
        24.45
            )
        ,
        "id": "12451",
        "mass": "372",
        "name": "Lalitpur",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "24.450000",
        "reclong": "78.566670",
        "year": "1887-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                1.06667,
        47.7
            )
        ,
        "id": "12455",
        "mass": "51700",
        "name": "Lancé",
        "nametype": "Valid",
        "recclass": "CO3.5",
        "reclat": "47.700000",
        "reclong": "1.066670",
        "year": "1872-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                5.11667,
        43.75
            )
        ,
        "id": "12456",
        "mass": "7000",
        "name": "Lancon",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "43.750000",
        "reclong": "5.116670",
        "year": "1897-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                16.73333,
        58.85
            )
        ,
        "id": "12461",
        "mass": "2300",
        "name": "Långhalsen",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "58.850000",
        "reclong": "16.733330",
        "year": "1947-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                126.19611,
        46.24167
            )
        ,
        "id": "12464",
        "mass": "1282",
        "name": "Lanxi",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "46.241670",
        "reclong": "126.196110",
        "year": "1986-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                16.23333,
        47.75
            )
        ,
        "id": "12465",
        "mass": "7000",
        "name": "Lanzenkirchen",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "47.750000",
        "reclong": "16.233330",
        "year": "1925-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                115.16667,
        33.13333
            )
        ,
        "id": "12466",
        "mass": "14250",
        "name": "Laochenzhen",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "33.133330",
        "reclong": "115.166670",
        "year": "1987-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -1.11667,
        51.9
            )
        ,
        "id": "12740",
        "mass": "1060",
        "name": "Launton",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "51.900000",
        "reclong": "-1.116670",
        "year": "1830-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                51.56667,
        52.45
            )
        ,
        "id": "12743",
        "mass": "800",
        "name": "Lavrentievka",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "52.450000",
        "reclong": "51.566670",
        "year": "1938-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.43333,
        47.16667
            )
        ,
        "id": "12748",
        "mass": "3000",
        "name": "Le Pressoir",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "47.166670",
        "reclong": "0.433330",
        "year": "1845-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -0.86667,
        48.53333
            )
        ,
        "id": "12749",
        "mass": "780",
        "name": "Le Teilleul",
        "nametype": "Valid",
        "recclass": "Howardite",
        "reclat": "48.533330",
        "reclong": "-0.866670",
        "year": "1845-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "20",
        ":@computed_region_nnqa_25f4": "608",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -99.33333,
        35.88333
            )
        ,
        "id": "12755",
        "mass": "51500",
        "name": "Leedey",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "35.883330",
        "reclong": "-99.333330",
        "year": "1943-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                28.36667,
        -25.66667
            )
        ,
        "id": "12756",
        "mass": "460",
        "name": "Leeuwfontein",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-25.666670",
        "reclong": "28.366670",
        "year": "1912-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -6.96667,
        52.66667
            )
        ,
        "id": "12759",
        "mass": "271.39999999999998",
        "name": "Leighlinbridge",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "52.666670",
        "reclong": "-6.966670",
        "year": "1999-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "29",
        ":@computed_region_nnqa_25f4": "1585",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -87.5,
        34.58333
            )
        ,
        "id": "12760",
        "mass": "877",
        "name": "Leighton",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "34.583330",
        "reclong": "-87.500000",
        "year": "1907-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                32.85,
        52.26667
            )
        ,
        "id": "12765",
        "mass": "700",
        "name": "Leonovka",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "52.266670",
        "reclong": "32.850000",
        "year": "1900-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                3.25,
        48.35
            )
        ,
        "id": "12769",
        "mass": "125",
        "name": "Les Ormes",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "48.350000",
        "reclong": "3.250000",
        "year": "1857-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                4.73333,
        50.36667
            )
        ,
        "id": "12772",
        "mass": "2000",
        "name": "Lesves",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "50.366670",
        "reclong": "4.733330",
        "year": "1896-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                26.18333,
        -26.15
            )
        ,
        "id": "14646",
        "mass": "4000",
        "name": "Lichtenberg",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "-26.150000",
        "reclong": "26.183330",
        "year": "1973-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                15.86667,
        56.65
            )
        ,
        "id": "14650",
        "mass": "6862",
        "name": "Lillaverke",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "56.650000",
        "reclong": "15.866670",
        "year": "1930-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -8.78333,
        52.56667
            )
        ,
        "id": "14652",
        "mass": "50000",
        "name": "Limerick",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "52.566670",
        "reclong": "-8.783330",
        "year": "1813-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                12.9,
        52.75
            )
        ,
        "id": "14655",
        "mass": "1862",
        "name": "Linum",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "52.750000",
        "reclong": "12.900000",
        "year": "1854-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                118.98333,
        31.63333
            )
        ,
        "id": "14659",
        "mass": "498",
        "name": "Lishui",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "31.633330",
        "reclong": "118.983330",
        "year": "1978-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                14.85,
        50.2
            )
        ,
        "id": "14661",
        "mass": "12800",
        "name": "Lissa",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "50.200000",
        "reclong": "14.850000",
        "year": "1808-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "18",
        ":@computed_region_nnqa_25f4": "2171",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -92.08333,
        37.91667
            )
        ,
        "id": "14664",
        "mass": "491",
        "name": "Little Piney",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "37.916670",
        "reclong": "-92.083330",
        "year": "1839-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                26.43333,
        56
            )
        ,
        "id": "14670",
        "mass": "5213",
        "name": "Lixna",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "56.000000",
        "reclong": "26.433330",
        "year": "1820-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                71.8,
        29.53333
            )
        ,
        "id": "14675",
        "mass": "1000",
        "name": "Lodran",
        "nametype": "Valid",
        "recclass": "Lodranite",
        "reclat": "29.533330",
        "reclong": "71.800000",
        "year": "1868-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                72.62667,
        26.96556
            )
        ,
        "id": "14678",
        "mass": "40000",
        "name": "Lohawat",
        "nametype": "Valid",
        "recclass": "Howardite",
        "reclat": "26.965560",
        "reclong": "72.626670",
        "year": "1994-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "40",
        ":@computed_region_nnqa_25f4": "2770",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -77.21163,
        38.70066
            )
        ,
        "id": "52843",
        "mass": "329.7",
        "name": "Lorton",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "38.700660",
        "reclong": "-77.211630",
        "year": "2010-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -0.83333,
        38
            )
        ,
        "id": "14708",
        "mass": "25",
        "name": "Los Martinez",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "38.000000",
        "reclong": "-0.833330",
        "year": "1894-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "20",
        ":@computed_region_nnqa_25f4": "2711",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -95.15,
        36.00833
            )
        ,
        "id": "14711",
        "mass": "17000",
        "name": "Lost City",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "36.008330",
        "reclong": "-95.150000",
        "year": "1970-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "36",
        ":@computed_region_nnqa_25f4": "1327",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -85.75,
        38.25
            )
        ,
        "id": "14716",
        "mass": "1300",
        "name": "Louisville",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "38.250000",
        "reclong": "-85.750000",
        "year": "1977-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                19.91667,
        52
            )
        ,
        "id": "14718",
        "mass": "59000",
        "name": "Łowicz",
        "nametype": "Valid",
        "recclass": "Mesosiderite-A3",
        "reclat": "52.000000",
        "reclong": "19.916670",
        "year": "1935-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                75.15,
        24.95
            )
        ,
        "id": "14721",
        "mass": "9241",
        "name": "Lua",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "24.950000",
        "reclong": "75.150000",
        "year": "1926-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.48333,
        47.85
            )
        ,
        "id": "14724",
        "mass": "3500",
        "name": "Lucé",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "47.850000",
        "reclong": "0.483330",
        "year": "1768-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "31",
        ":@computed_region_nnqa_25f4": "1567",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -84.76667,
        32.03333
            )
        ,
        "id": "14753",
        "mass": "340",
        "name": "Lumpkin",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "32.033330",
        "reclong": "-84.766670",
        "year": "1869-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                103.3,
        24.8
            )
        ,
        "id": "14754",
        "mass": "2520",
        "name": "Lunan",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "24.800000",
        "reclong": "103.300000",
        "year": "1980-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                13.03333,
        56.21667
            )
        ,
        "id": "14755",
        "mass": "11000",
        "name": "Lundsgård",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "56.216670",
        "reclong": "13.033330",
        "year": "1889-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                27.7,
        61.2
            )
        ,
        "id": "14756",
        "mass": "885",
        "name": "Luotolax",
        "nametype": "Valid",
        "recclass": "Howardite",
        "reclat": "61.200000",
        "reclong": "27.700000",
        "year": "1813-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                5,
        46.21667
            )
        ,
        "id": "14757",
        "mass": "14000",
        "name": "Luponnas",
        "nametype": "Valid",
        "recclass": "H3-5",
        "reclat": "46.216670",
        "reclong": "5.000000",
        "year": "1753-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                29.43333,
        -7.21667
            )
        ,
        "id": "14759",
        "name": "Lusaka",
        "nametype": "Valid",
        "recclass": "Unknown",
        "reclat": "-7.216670",
        "reclong": "29.433330",
        "year": "1951-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                97,
        19
            )
        ,
        "id": "14764",
        "mass": "540",
        "name": "Mabwe-Khoywa",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "19.000000",
        "reclong": "97.000000",
        "year": "1937-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -36.66667,
        -5.2
            )
        ,
        "id": "15370",
        "mass": "1500",
        "name": "Macau",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-5.200000",
        "reclong": "-36.666670",
        "year": "1836-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                35.24222,
        -15.21222
            )
        ,
        "id": "15371",
        "mass": "93200",
        "name": "Machinga",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-15.212220",
        "reclong": "35.242220",
        "year": "1981-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                31.95,
        -28.83333
            )
        ,
        "id": "15372",
        "mass": "1995",
        "name": "Macibini",
        "nametype": "Valid",
        "recclass": "Eucrite-pmict",
        "reclat": "-28.833330",
        "reclong": "31.950000",
        "year": "1936-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                86.36667,
        25.91667
            )
        ,
        "id": "15379",
        "mass": "1000",
        "name": "Madhipura",
        "nametype": "Valid",
        "recclass": "L",
        "reclat": "25.916670",
        "reclong": "86.366670",
        "year": "1950-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                111.53333,
        -7.75
            )
        ,
        "id": "15380",
        "mass": "400",
        "name": "Madiun",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-7.750000",
        "reclong": "111.533330",
        "year": "1935-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -3.71667,
        40.41667
            )
        ,
        "id": "15382",
        "mass": "400",
        "name": "Madrid",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "40.416670",
        "reclong": "-3.716670",
        "year": "1896-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -49.93333,
        -26.16667
            )
        ,
        "id": "15383",
        "mass": "600",
        "name": "Mafra",
        "nametype": "Valid",
        "recclass": "L3-4",
        "reclat": "-26.166670",
        "reclong": "-49.933330",
        "year": "1941-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                27.51667,
        37.86667
            )
        ,
        "id": "15386",
        "mass": "5000",
        "name": "Magnesia",
        "nametype": "Valid",
        "recclass": "Iron, IAB-sHL",
        "reclat": "37.866670",
        "reclong": "27.516670",
        "year": "1899-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                31.65,
        -19.48333
            )
        ,
        "id": "15387",
        "mass": "666.6",
        "name": "Magombedze",
        "nametype": "Valid",
        "recclass": "H3-5",
        "reclat": "-19.483330",
        "reclong": "31.650000",
        "year": "1990-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                95.78333,
        27.66667
            )
        ,
        "id": "47361",
        "mass": "70500",
        "name": "Mahadevpur",
        "nametype": "Valid",
        "recclass": "H4/5",
        "reclat": "27.666670",
        "reclong": "95.783330",
        "year": "2007-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                9.38333,
        12.83333
            )
        ,
        "id": "30751",
        "mass": "4629",
        "name": "Maigatari-Danduma",
        "nametype": "Valid",
        "recclass": "H5/6",
        "reclat": "12.833330",
        "reclong": "9.383330",
        "year": "2004-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "11",
        ":@computed_region_nnqa_25f4": "611",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -104,
        32.21667
            )
        ,
        "id": "15393",
        "mass": "150",
        "name": "Malaga",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "32.216670",
        "reclong": "-104.000000",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                31.75,
        9.5
            )
        ,
        "id": "15394",
        "mass": "2000",
        "name": "Malakal",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "9.500000",
        "reclong": "31.750000",
        "year": "1970-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                33.51667,
        -3.13333
            )
        ,
        "id": "15395",
        "mass": "470",
        "name": "Malampaka",
        "nametype": "Valid",
        "recclass": "H",
        "reclat": "-3.133330",
        "reclong": "33.516670",
        "year": "1930-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -63.23333,
        -28.93333
            )
        ,
        "id": "15397",
        "name": "Malotas",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-28.933330",
        "reclong": "-63.233330",
        "year": "1931-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                26.76667,
        -29.45
            )
        ,
        "id": "15400",
        "mass": "807",
        "name": "Malvern",
        "nametype": "Valid",
        "recclass": "Eucrite-pmict",
        "reclat": "-29.450000",
        "reclong": "26.766670",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                62.08333,
        45.21667
            )
        ,
        "id": "15401",
        "mass": "1000",
        "name": "Mamra Springs",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "45.216670",
        "reclong": "62.083330",
        "year": "1927-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                86.7,
        23.05
            )
        ,
        "id": "15402",
        "mass": "1700",
        "name": "Manbhoom",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "23.050000",
        "reclong": "86.700000",
        "year": "1863-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.1,
        20.96667
            )
        ,
        "id": "15403",
        "mass": "50",
        "name": "Manegaon",
        "nametype": "Valid",
        "recclass": "Diogenite",
        "reclat": "20.966670",
        "reclong": "76.100000",
        "year": "1843-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                31.6,
        -17.65
            )
        ,
        "id": "15405",
        "mass": "22300",
        "name": "Mangwendi",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "-17.650000",
        "reclong": "31.600000",
        "year": "1934-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                44.63333,
        45.81667
            )
        ,
        "id": "15409",
        "mass": "3555",
        "name": "Manych",
        "nametype": "Valid",
        "recclass": "LL3.4",
        "reclat": "45.816670",
        "reclong": "44.633330",
        "year": "1951-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                72.08333,
        34.23333
            )
        ,
        "id": "15414",
        "mass": "4500",
        "name": "Mardan",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "34.233330",
        "reclong": "72.083330",
        "year": "1948-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "id": "15418",
        "mass": "114",
        "name": "Maria Linden",
        "nametype": "Valid",
        "recclass": "L4",
        "year": "1925-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "19",
        ":@computed_region_nnqa_25f4": "471",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -99.38333,
        42.71667
            )
        ,
        "id": "15419",
        "mass": "340",
        "name": "Mariaville",
        "nametype": "Valid",
        "recclass": "Iron",
        "reclat": "42.716670",
        "reclong": "-99.383330",
        "year": "1898-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                11.46745,
        54.76183
            )
        ,
        "id": "48973",
        "mass": "25.81",
        "name": "Maribo",
        "nametype": "Valid",
        "recclass": "CM2",
        "reclat": "54.761830",
        "reclong": "11.467450",
        "year": "2009-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                29.25,
        4.66667
            )
        ,
        "id": "15421",
        "mass": "3200",
        "name": "Maridi",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "4.666670",
        "reclong": "29.250000",
        "year": "1941-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -49.93333,
        -22.25
            )
        ,
        "id": "15422",
        "mass": "2500",
        "name": "Marilia",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "-22.250000",
        "reclong": "-49.933330",
        "year": "1971-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "16",
        ":@computed_region_nnqa_25f4": "287",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -91.6,
        41.9
            )
        ,
        "id": "15424",
        "mass": "28400",
        "name": "Marion st_make_point(Iowa)",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "41.900000",
        "reclong": "-91.600000",
        "year": "1847-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                30.5,
        61.5
            )
        ,
        "id": "15426",
        "mass": "45000",
        "name": "Marjalahti",
        "nametype": "Valid",
        "recclass": "Pallasite, PMG",
        "reclat": "61.500000",
        "reclong": "30.500000",
        "year": "1902-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.15,
        44.5
            )
        ,
        "id": "15429",
        "mass": "3000",
        "name": "Marmande",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "44.500000",
        "reclong": "0.150000",
        "year": "1848-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                48.1,
        -14.2
            )
        ,
        "id": "15430",
        "mass": "6000",
        "name": "Maromandia",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-14.200000",
        "reclong": "48.100000",
        "year": "2002-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "39",
        ":@computed_region_nnqa_25f4": "2740",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -84.1,
        35.8
            )
        ,
        "id": "15436",
        "mass": "1443",
        "name": "Maryville",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "35.800000",
        "reclong": "-84.100000",
        "year": "1983-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                1.86667,
        45.36667
            )
        ,
        "id": "15438",
        "mass": "1000",
        "name": "Mascombes",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "45.366670",
        "reclong": "1.866670",
        "year": "1836-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0,
        0
            )
        ,
        "id": "53653",
        "mass": "24.54",
        "name": "Mason Gully",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "0.000000",
        "reclong": "0.000000",
        "year": "2010-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                12.61667,
        48.13333
            )
        ,
        "id": "15443",
        "mass": "1600",
        "name": "Mässing",
        "nametype": "Valid",
        "recclass": "Howardite",
        "reclat": "48.133330",
        "reclong": "12.616670",
        "year": "1803-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                13.13333,
        48.18333
            )
        ,
        "id": "15446",
        "mass": "19000",
        "name": "Mauerkirchen",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "48.183330",
        "reclong": "13.133330",
        "year": "1768-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                57,
        -20
            )
        ,
        "id": "15447",
        "mass": "220",
        "name": "Mauritius",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-20.000000",
        "reclong": "57.000000",
        "year": "1801-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                12.08333,
        8.96667
            )
        ,
        "id": "15451",
        "mass": "4850",
        "name": "Mayo Belwa",
        "nametype": "Valid",
        "recclass": "Aubrite",
        "reclat": "8.966670",
        "reclong": "12.083330",
        "year": "1974-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -101.68333,
        24.68333
            )
        ,
        "id": "15453",
        "mass": "4000",
        "name": "Mazapil",
        "nametype": "Valid",
        "recclass": "Iron, IAB-sLL",
        "reclat": "24.683330",
        "reclong": "-101.683330",
        "year": "1885-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                30,
        -1.21667
            )
        ,
        "id": "15454",
        "mass": "4975",
        "name": "Maziba",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-1.216670",
        "reclong": "30.000000",
        "year": "1942-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                34.16667,
        1.06667
            )
        ,
        "id": "15455",
        "mass": "150000",
        "name": "Mbale",
        "nametype": "Valid",
        "recclass": "L5/6",
        "reclat": "1.066670",
        "reclong": "34.166670",
        "year": "1992-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -67.5,
        -27.25
            )
        ,
        "id": "15467",
        "mass": "31",
        "name": "Medanitos",
        "nametype": "Valid",
        "recclass": "Eucrite-cm",
        "reclat": "-27.250000",
        "reclong": "-67.500000",
        "year": "1953-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                77.8,
        29.01667
            )
        ,
        "id": "15469",
        "mass": "22",
        "name": "Meerut",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "29.016670",
        "reclong": "77.800000",
        "year": "1861-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                106.88333,
        -6.23333
            )
        ,
        "id": "15470",
        "mass": "24750",
        "name": "Meester-Cornelis",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-6.233330",
        "reclong": "106.883330",
        "year": "1915-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                13.15,
        53.18333
            )
        ,
        "id": "15485",
        "mass": "10500",
        "name": "Menow",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "53.183330",
        "reclong": "13.150000",
        "year": "1862-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                7.21817,
        46.81867
            )
        ,
        "id": "15486",
        "mass": "28.9",
        "name": "Menziswyl",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "46.818670",
        "reclong": "7.218170",
        "year": "1903-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                12.06667,
        55.05
            )
        ,
        "id": "15489",
        "mass": "4000",
        "name": "Mern",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "55.050000",
        "reclong": "12.066670",
        "year": "1878-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                37.66667,
        0
            )
        ,
        "id": "15491",
        "mass": "6000",
        "name": "Meru",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "0.000000",
        "reclong": "37.666670",
        "year": "1945-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                81.98333,
        25.48333
            )
        ,
        "id": "15492",
        "mass": "71400",
        "name": "Merua",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "25.483330",
        "reclong": "81.983330",
        "year": "1920-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                15.56667,
        38.18333
            )
        ,
        "id": "15495",
        "mass": "2405",
        "name": "Messina",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "38.183330",
        "reclong": "15.566670",
        "year": "1955-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                11.1,
        50.58333
            )
        ,
        "id": "16626",
        "mass": "870",
        "name": "Meuselbach",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "50.583330",
        "reclong": "11.100000",
        "year": "1897-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                3.25,
        45.76667
            )
        ,
        "id": "16627",
        "mass": "1300",
        "name": "Mezel",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "45.766670",
        "reclong": "3.250000",
        "year": "1949-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                25.73333,
        46.5
            )
        ,
        "id": "16628",
        "mass": "22700",
        "name": "Mezö-Madaras",
        "nametype": "Valid",
        "recclass": "L3.7",
        "reclat": "46.500000",
        "reclong": "25.733330",
        "year": "1852-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                83.61667,
        25.9
            )
        ,
        "id": "16629",
        "mass": "350",
        "name": "Mhow",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "25.900000",
        "reclong": "83.616670",
        "year": "1827-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                111.7,
        34.8
            )
        ,
        "id": "16631",
        "mass": "1100",
        "name": "Mianchi",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "34.800000",
        "reclong": "111.700000",
        "year": "1980-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -1.16667,
        54.56667
            )
        ,
        "id": "16632",
        "mass": "1600",
        "name": "Middlesbrough",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "54.566670",
        "reclong": "-1.166670",
        "year": "1881-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "41",
        ":@computed_region_nnqa_25f4": "2996",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -90.36556,
        42.9075
            )
        ,
        "id": "52090",
        "mass": "3584",
        "name": "Mifflin",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "42.907500",
        "reclong": "-90.365560",
        "year": "2010-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                30.96667,
        48.06667
            )
        ,
        "id": "16634",
        "mass": "8000",
        "name": "Mighei",
        "nametype": "Valid",
        "recclass": "CM2",
        "reclat": "48.066670",
        "reclong": "30.966670",
        "year": "1889-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                133.22,
        35.56833
            )
        ,
        "id": "16635",
        "mass": "6380",
        "name": "Mihonoseki",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "35.568330",
        "reclong": "133.220000",
        "year": "1992-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                17.53333,
        46.23333
            )
        ,
        "id": "16636",
        "mass": "224.2",
        "name": "Mike",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "46.233330",
        "reclong": "17.533330",
        "year": "1944-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                16.1,
        46.18333
            )
        ,
        "id": "16640",
        "mass": "10000",
        "name": "Milena",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "46.183330",
        "reclong": "16.100000",
        "year": "1842-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                120.36667,
        -26.45
            )
        ,
        "id": "16643",
        "mass": "330000",
        "name": "Millbillillie",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "-26.450000",
        "reclong": "120.366670",
        "year": "1960-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "15",
        ":@computed_region_nnqa_25f4": "11",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -92.05,
        35.4
            )
        ,
        "id": "16645",
        "mass": "16700",
        "name": "Miller st_make_point(Arkansas)",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "35.400000",
        "reclong": "-92.050000",
        "year": "1930-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                136.93333,
        35.07833
            )
        ,
        "id": "16692",
        "mass": "1040",
        "name": "Minamino",
        "nametype": "Valid",
        "recclass": "L",
        "reclat": "35.078330",
        "reclong": "136.933330",
        "year": "1632-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                14.7,
        37.28333
            )
        ,
        "id": "16696",
        "mass": "42",
        "name": "Mineo",
        "nametype": "Valid",
        "recclass": "Pallasite",
        "reclat": "37.283330",
        "reclong": "14.700000",
        "year": "1826-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                120.66667,
        32.33333
            )
        ,
        "id": "16697",
        "mass": "5500",
        "name": "Min-Fan-Zhun",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "32.333330",
        "reclong": "120.666670",
        "year": "1952-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                16.6,
        47.7
            )
        ,
        "id": "16700",
        "mass": "550",
        "name": "Minnichhof",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "47.700000",
        "reclong": "16.600000",
        "year": "1905-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                83.25,
        25.68333
            )
        ,
        "id": "16701",
        "mass": "8510",
        "name": "Mirzapur",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "25.683330",
        "reclong": "83.250000",
        "year": "1910-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                23,
        56.66667
            )
        ,
        "id": "16703",
        "mass": "5800",
        "name": "Misshof",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "56.666670",
        "reclong": "23.000000",
        "year": "1890-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                5.93333,
        61.73333
            )
        ,
        "id": "16707",
        "mass": "100.7",
        "name": "Mjelleim",
        "nametype": "Valid",
        "recclass": "H",
        "reclat": "61.733330",
        "reclong": "5.933330",
        "year": "1898-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                24.03333,
        46.8
            )
        ,
        "id": "16709",
        "mass": "300000",
        "name": "Mocs",
        "nametype": "Valid",
        "recclass": "L5-6",
        "reclat": "46.800000",
        "reclong": "24.033330",
        "year": "1882-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "17",
        ":@computed_region_nnqa_25f4": "1290",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -101.1,
        38.5
            )
        ,
        "id": "16711",
        "mass": "35000",
        "name": "Modoc st_make_point(1905)",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "38.500000",
        "reclong": "-101.100000",
        "year": "1905-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                174.4,
        -39.63333
            )
        ,
        "id": "16713",
        "mass": "4500",
        "name": "Mokoia",
        "nametype": "Valid",
        "recclass": "CV3",
        "reclat": "-39.633330",
        "reclong": "174.400000",
        "year": "1908-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -1.16667,
        38.11667
            )
        ,
        "id": "16715",
        "mass": "144000",
        "name": "Molina",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "38.116670",
        "reclong": "-1.166670",
        "year": "1858-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                26.46667,
        -31.25
            )
        ,
        "id": "16717",
        "mass": "150",
        "name": "Molteno",
        "nametype": "Valid",
        "recclass": "Howardite",
        "reclat": "-31.250000",
        "reclong": "26.466670",
        "year": "1953-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "23",
        ":@computed_region_nnqa_25f4": "2957",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -102.85833,
        31.60833
            )
        ,
        "id": "16719",
        "mass": "2587",
        "name": "Monahans st_make_point(1998)",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "31.608330",
        "reclong": "-102.858330",
        "year": "1998-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "37",
        ":@computed_region_nnqa_25f4": "636",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -80.5,
        35.25
            )
        ,
        "id": "16720",
        "mass": "8600",
        "name": "Monroe",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "35.250000",
        "reclong": "-80.500000",
        "year": "1849-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -8.25,
        38.01667
            )
        ,
        "id": "16725",
        "mass": "4885",
        "name": "Monte das Fortes",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "38.016670",
        "reclong": "-8.250000",
        "year": "1950-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                13.35,
        43.26667
            )
        ,
        "id": "16726",
        "mass": "3130",
        "name": "Monte Milone",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "43.266670",
        "reclong": "13.350000",
        "year": "1846-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                1.9625,
        43.39056
            )
        ,
        "id": "16727",
        "mass": "149000",
        "name": "Montferré",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "43.390560",
        "reclong": "1.962500",
        "year": "1923-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                1.58333,
        47.63333
            )
        ,
        "id": "16729",
        "mass": "500",
        "name": "Montlivault",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "47.633330",
        "reclong": "1.583330",
        "year": "1838-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                27.35,
        -15.96667
            )
        ,
        "id": "16733",
        "name": "Monze",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-15.966670",
        "reclong": "27.350000",
        "year": "1950-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "37",
        ":@computed_region_nnqa_25f4": "2431",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -79.38333,
        35.41667
            )
        ,
        "id": "16736",
        "mass": "1880",
        "name": "Moore County",
        "nametype": "Valid",
        "recclass": "Eucrite-cm",
        "reclat": "35.416670",
        "reclong": "-79.383330",
        "year": "1913-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -8.33333,
        52.45
            )
        ,
        "id": "16737",
        "mass": "3520",
        "name": "Mooresfort",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "52.450000",
        "reclong": "-8.333330",
        "year": "1810-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                145.6,
        -40.975
            )
        ,
        "id": "16738",
        "mass": "8887.5",
        "name": "Moorleah",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-40.975000",
        "reclong": "145.600000",
        "year": "1930-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.83333,
        28.78333
            )
        ,
        "id": "16740",
        "mass": "70",
        "name": "Moradabad",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "28.783330",
        "reclong": "78.833330",
        "year": "1808-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                18.53333,
        49.6
            )
        ,
        "id": "16742",
        "mass": "633",
        "name": "Morávka",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "49.600000",
        "reclong": "18.533330",
        "year": "2000-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                5.13333,
        44.6
            )
        ,
        "id": "16747",
        "mass": "1300",
        "name": "Mornans",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "44.600000",
        "reclong": "5.133330",
        "year": "1875-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                10.7,
        59.43333
            )
        ,
        "id": "36592",
        "mass": "3763",
        "name": "Moss",
        "nametype": "Valid",
        "recclass": "CO3.6",
        "reclat": "59.433330",
        "reclong": "10.700000",
        "year": "2006-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                77.33333,
        26.83333
            )
        ,
        "id": "16759",
        "mass": "1500",
        "name": "Moti-ka-nagla",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "26.833330",
        "reclong": "77.333330",
        "year": "1868-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8.5,
        45.2
            )
        ,
        "id": "16762",
        "mass": "9150",
        "name": "Motta di Conti",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "45.200000",
        "reclong": "8.500000",
        "year": "1868-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                141.7,
        -29.8
            )
        ,
        "id": "16766",
        "mass": "11300",
        "name": "Mount Browne",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "-29.800000",
        "reclong": "141.700000",
        "year": "1902-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                4.8,
        18.7
            )
        ,
        "id": "16804",
        "mass": "110000",
        "name": "Mount Tazerzait",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "18.700000",
        "reclong": "4.800000",
        "year": "1991-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                6.86667,
        44.08333
            )
        ,
        "id": "16805",
        "mass": "17000",
        "name": "Mount Vaisi",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "44.083330",
        "reclong": "6.866670",
        "year": "1637-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                33.5,
        -11.5
            )
        ,
        "id": "16820",
        "mass": "1100",
        "name": "Mtola",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "-11.500000",
        "reclong": "33.500000",
        "year": "1944-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                77.01667,
        12.63333
            )
        ,
        "id": "16841",
        "mass": "4400",
        "name": "Muddoor",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "12.633330",
        "reclong": "77.016670",
        "year": "1865-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                80.83333,
        9.33333
            )
        ,
        "id": "16851",
        "mass": "25.5",
        "name": "Mulletiwu",
        "nametype": "Valid",
        "recclass": "L",
        "reclat": "9.333330",
        "reclong": "80.833330",
        "year": "1795-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                90.21667,
        24.5
            )
        ,
        "id": "16874",
        "mass": "4703",
        "name": "Muraid",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "24.500000",
        "reclong": "90.216670",
        "year": "1924-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                145.2,
        -36.61667
            )
        ,
        "id": "16875",
        "mass": "100000",
        "name": "Murchison",
        "nametype": "Valid",
        "recclass": "CM2",
        "reclat": "-36.616670",
        "reclong": "145.200000",
        "year": "1969-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "36",
        ":@computed_region_nnqa_25f4": "237",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -88.1,
        36.6
            )
        ,
        "id": "16882",
        "mass": "12600",
        "name": "Murray",
        "nametype": "Valid",
        "recclass": "CM2",
        "reclat": "36.600000",
        "reclong": "-88.100000",
        "year": "1950-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                85.53333,
        26.13333
            )
        ,
        "id": "16885",
        "mass": "1245",
        "name": "Muzaffarpur",
        "nametype": "Valid",
        "recclass": "Iron, IAB-sHL",
        "reclat": "26.133330",
        "reclong": "85.533330",
        "year": "1964-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                72.63333,
        23.05
            )
        ,
        "id": "16887",
        "name": "Myhee Caunta",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "23.050000",
        "reclong": "72.633330",
        "year": "1842-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                1,
        12
            )
        ,
        "id": "16889",
        "mass": "8165",
        "name": "Nadiabondi",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "12.000000",
        "reclong": "1.000000",
        "year": "1956-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                140.06167,
        38.12167
            )
        ,
        "id": "16890",
        "mass": "1810",
        "name": "Nagai",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "38.121670",
        "reclong": "140.061670",
        "year": "1922-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.21667,
        26.98333
            )
        ,
        "id": "16892",
        "mass": "20",
        "name": "Nagaria",
        "nametype": "Valid",
        "recclass": "Eucrite-cm",
        "reclat": "26.983330",
        "reclong": "78.216670",
        "year": "1875-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                19.5,
        49.16667
            )
        ,
        "id": "16893",
        "mass": "6100",
        "name": "Nagy-Borové",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "49.166670",
        "reclong": "19.500000",
        "year": "1895-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                30.35,
        31.31667
            )
        ,
        "id": "16898",
        "mass": "10000",
        "name": "Nakhla",
        "nametype": "Valid",
        "recclass": "Martian st_make_point(nakhlite)",
        "reclat": "31.316670",
        "reclong": "30.350000",
        "year": "1911-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                100.08333,
        13.73333
            )
        ,
        "id": "16899",
        "mass": "23200",
        "name": "Nakhon Pathom",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "13.733330",
        "reclong": "100.083330",
        "year": "1923-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                79.2,
        12.28333
            )
        ,
        "id": "16902",
        "mass": "4500",
        "name": "Nammianthal",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "12.283330",
        "reclong": "79.200000",
        "year": "1886-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                103.5,
        35.66667
            )
        ,
        "id": "16903",
        "mass": "52900",
        "name": "Nan Yang Pao",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "35.666670",
        "reclong": "103.500000",
        "year": "1917-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "45",
        ":@computed_region_nnqa_25f4": "419",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -77.16667,
        38.41667
            )
        ,
        "id": "16904",
        "mass": "7500",
        "name": "Nanjemoy",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "38.416670",
        "reclong": "-77.166670",
        "year": "1825-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                121.8,
        32.11667
            )
        ,
        "id": "16907",
        "mass": "529",
        "name": "Nantong",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "32.116670",
        "reclong": "121.800000",
        "year": "1984-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                77,
        19.25
            )
        ,
        "id": "16908",
        "mass": "17000",
        "name": "Naoki",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "19.250000",
        "reclong": "77.000000",
        "year": "1928-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                51.5,
        33.75
            )
        ,
        "id": "16909",
        "mass": "2700",
        "name": "Naragh",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "33.750000",
        "reclong": "51.500000",
        "year": "1974-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                150.68889,
        -34.05
            )
        ,
        "id": "16912",
        "mass": "367.5",
        "name": "Narellan",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-34.050000",
        "reclong": "150.688890",
        "year": "1928-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                12.51667,
        42.51667
            )
        ,
        "id": "16914",
        "name": "Narni",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "42.516670",
        "reclong": "12.516670",
        "year": "0921-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                165.9,
        -21.73333
            )
        ,
        "id": "16922",
        "mass": "347",
        "name": "Nassirah",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "-21.733330",
        "reclong": "165.900000",
        "year": "1936-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "id": "16923",
        "mass": "1.4",
        "name": "Natal",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "year": "1973-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                83.66667,
        21.25
            )
        ,
        "id": "16927",
        "mass": "105",
        "name": "Nawapali",
        "nametype": "Valid",
        "recclass": "CM2",
        "reclat": "21.250000",
        "reclong": "83.666670",
        "year": "1890-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                136.46528,
        36.44917
            )
        ,
        "id": "16934",
        "mass": "420",
        "name": "Neagari",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "36.449170",
        "reclong": "136.465280",
        "year": "1995-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                83.48333,
        18.68333
            )
        ,
        "id": "16935",
        "mass": "4500",
        "name": "Nedagolla",
        "nametype": "Valid",
        "recclass": "Iron, ungrouped",
        "reclat": "18.683330",
        "reclong": "83.483330",
        "year": "1870-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                35.33333,
        9.5
            )
        ,
        "id": "16941",
        "mass": "2450",
        "name": "Nejo",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "9.500000",
        "reclong": "35.333330",
        "year": "1970-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                21.5,
        56.5
            )
        ,
        "id": "16945",
        "mass": "10250",
        "name": "Nerft",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "56.500000",
        "reclong": "21.500000",
        "year": "1864-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                10.80833,
        47.525
            )
        ,
        "id": "16950",
        "mass": "6189",
        "name": "Neuschwanstein",
        "nametype": "Valid",
        "recclass": "EL6",
        "reclat": "47.525000",
        "reclong": "10.808330",
        "year": "2002-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "38",
        ":@computed_region_nnqa_25f4": "2615",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -81.76667,
        40
            )
        ,
        "id": "16953",
        "mass": "230000",
        "name": "New Concord",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "40.000000",
        "reclong": "-81.766670",
        "year": "1860-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                35.68333,
        15.36667
            )
        ,
        "id": "16954",
        "mass": "12000",
        "name": "New Halfa",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "15.366670",
        "reclong": "35.683330",
        "year": "1994-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "22",
        ":@computed_region_nnqa_25f4": "1667",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -90.10976,
        29.94718
            )
        ,
        "id": "16960",
        "mass": "19256",
        "name": "New Orleans",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "29.947180",
        "reclong": "-90.109760",
        "year": "2003-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                111.41667,
        -7.45
            )
        ,
        "id": "16966",
        "mass": "1393",
        "name": "Ngawi",
        "nametype": "Valid",
        "recclass": "LL3.6",
        "reclat": "-7.450000",
        "reclong": "111.416670",
        "year": "1883-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -4.38333,
        13.85
            )
        ,
        "id": "16968",
        "mass": "37500",
        "name": "N'Goureyma",
        "nametype": "Valid",
        "recclass": "Iron, ungrouped",
        "reclat": "13.850000",
        "reclong": "-4.383330",
        "year": "1900-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -1.43333,
        49.03333
            )
        ,
        "id": "16970",
        "name": "Nicorps",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "49.033330",
        "reclong": "-1.433330",
        "year": "1750-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "id": "16974",
        "mass": "3.3",
        "name": "Niger st_make_point(L6)",
        "nametype": "Valid",
        "recclass": "L6",
        "year": "1967-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "id": "16975",
        "mass": "3.3",
        "name": "Niger st_make_point(LL6)",
        "nametype": "Valid",
        "recclass": "LL6",
        "year": "1967-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.63333,
        52.45
            )
        ,
        "id": "16976",
        "mass": "3996",
        "name": "Nikolaevka",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "52.450000",
        "reclong": "78.633330",
        "year": "1935-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                37.33333,
        56.11667
            )
        ,
        "id": "16977",
        "mass": "6000",
        "name": "Nikolskoe",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "56.116670",
        "reclong": "37.333330",
        "year": "1954-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                121.48333,
        29.86667
            )
        ,
        "id": "16980",
        "mass": "14250",
        "name": "Ningbo",
        "nametype": "Valid",
        "recclass": "Iron, IVA",
        "reclat": "29.866670",
        "reclong": "121.483330",
        "year": "1975-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                105.90667,
        32.925
            )
        ,
        "id": "16981",
        "mass": "4610",
        "name": "Ningqiang",
        "nametype": "Valid",
        "recclass": "C3-ung",
        "reclat": "32.925000",
        "reclong": "105.906670",
        "year": "1983-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                131.56667,
        34.2
            )
        ,
        "id": "16982",
        "mass": "467",
        "name": "Nio",
        "nametype": "Valid",
        "recclass": "H3-4",
        "reclat": "34.200000",
        "reclong": "131.566670",
        "year": "1897-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                30.7,
        -28.56667
            )
        ,
        "id": "16983",
        "mass": "17200",
        "name": "N'Kandhla",
        "nametype": "Valid",
        "recclass": "Iron, IID",
        "reclat": "-28.566670",
        "reclong": "30.700000",
        "year": "1912-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "49",
        ":@computed_region_nnqa_25f4": "1683",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -69.48333,
        44.08333
            )
        ,
        "id": "16984",
        "mass": "2300",
        "name": "Nobleborough",
        "nametype": "Valid",
        "recclass": "Eucrite-pmict",
        "reclat": "44.083330",
        "reclong": "-69.483330",
        "year": "1823-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "35",
        ":@computed_region_nnqa_25f4": "2238",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -86.055,
        40.08528
            )
        ,
        "id": "16985",
        "mass": "483.7",
        "name": "Noblesville",
        "nametype": "Valid",
        "recclass": "H4-6",
        "reclat": "40.085280",
        "reclong": "-86.055000",
        "year": "1991-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                130.75,
        33.725
            )
        ,
        "id": "16988",
        "mass": "472",
        "name": "Nogata",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "33.725000",
        "reclong": "130.750000",
        "year": "0861-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -59.83333,
        -32.36667
            )
        ,
        "id": "16989",
        "mass": "4000",
        "name": "Nogoya",
        "nametype": "Valid",
        "recclass": "CM2",
        "reclat": "-32.366670",
        "reclong": "-59.833330",
        "year": "1879-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "15",
        ":@computed_region_nnqa_25f4": "10",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -92.26667,
        36.21667
            )
        ,
        "id": "16994",
        "mass": "1050",
        "name": "Norfork",
        "nametype": "Valid",
        "recclass": "Iron, IIIAB",
        "reclat": "36.216670",
        "reclong": "-92.266670",
        "year": "1918-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "17",
        ":@computed_region_nnqa_25f4": "1252",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -99.86667,
        39.68333
            )
        ,
        "id": "17922",
        "mass": "1100000",
        "name": "Norton County",
        "nametype": "Valid",
        "recclass": "Aubrite",
        "reclat": "39.683330",
        "reclong": "-99.866670",
        "year": "1948-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                11.52722,
        45.29167
            )
        ,
        "id": "17930",
        "mass": "177",
        "name": "Noventa Vicentina",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "45.291670",
        "reclong": "11.527220",
        "year": "1971-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                46,
        54.81667
            )
        ,
        "id": "17933",
        "mass": "1900",
        "name": "Novo-Urei",
        "nametype": "Valid",
        "recclass": "Ureilite",
        "reclat": "54.816670",
        "reclong": "46.000000",
        "year": "1886-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                31.33333,
        58.55
            )
        ,
        "id": "17934",
        "name": "Novy-Ergi",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "58.550000",
        "reclong": "31.333330",
        "year": "1662-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                22,
        56
            )
        ,
        "id": "17935",
        "mass": "1001",
        "name": "Novy-Projekt",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "56.000000",
        "reclong": "22.000000",
        "year": "1908-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                102.46667,
        42.91667
            )
        ,
        "id": "17936",
        "mass": "250",
        "name": "Noyan-Bogdo",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "42.916670",
        "reclong": "102.466670",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -102.13333,
        24.3
            )
        ,
        "id": "17938",
        "mass": "50000",
        "name": "Nuevo Mercurio",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "24.300000",
        "reclong": "-102.133330",
        "year": "1978-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.75,
        41.63333
            )
        ,
        "id": "17959",
        "mass": "5000",
        "name": "Nulles",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "41.633330",
        "reclong": "0.750000",
        "year": "1851-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                141.86667,
        43.33333
            )
        ,
        "id": "17960",
        "mass": "363",
        "name": "Numakai",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "43.333330",
        "reclong": "141.866670",
        "year": "1925-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                94.91667,
        21.20833
            )
        ,
        "id": "17969",
        "mass": "737.6",
        "name": "Nyaung",
        "nametype": "Valid",
        "recclass": "Iron, IIIAB",
        "reclat": "21.208330",
        "reclong": "94.916670",
        "year": "1939-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                22.025,
        47.55
            )
        ,
        "id": "17970",
        "mass": "1100",
        "name": "Nyirábrany",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "47.550000",
        "reclong": "22.025000",
        "year": "1914-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                55.26667,
        57.78333
            )
        ,
        "id": "17979",
        "mass": "500000",
        "name": "Ochansk",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "57.783330",
        "reclong": "55.266670",
        "year": "1887-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8.05,
        52.28333
            )
        ,
        "id": "17988",
        "mass": "1400",
        "name": "Oesede",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "52.283330",
        "reclong": "8.050000",
        "year": "1927-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                23,
        58.5
            )
        ,
        "id": "17989",
        "mass": "6000",
        "name": "Oesel",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "58.500000",
        "reclong": "23.000000",
        "year": "1855-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                22.03333,
        47.88333
            )
        ,
        "id": "17990",
        "mass": "3750",
        "name": "Ofehértó",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "47.883330",
        "reclong": "22.033330",
        "year": "1900-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                130.2,
        33.28333
            )
        ,
        "id": "17994",
        "mass": "14360",
        "name": "Ogi",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "33.283330",
        "reclong": "130.200000",
        "year": "1741-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                23.58333,
        46.06667
            )
        ,
        "id": "17995",
        "mass": "16250",
        "name": "Ohaba",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "46.066670",
        "reclong": "23.583330",
        "year": "1857-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8.5,
        6.75
            )
        ,
        "id": "17996",
        "mass": "7700",
        "name": "Ohuma",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "6.750000",
        "reclong": "8.500000",
        "year": "1963-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -5.4,
        38.18333
            )
        ,
        "id": "17997",
        "mass": "5850",
        "name": "Ojuelos Altos",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "38.183330",
        "reclong": "-5.400000",
        "year": "1926-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                139.21667,
        36.18333
            )
        ,
        "id": "17998",
        "mass": "194",
        "name": "Okabe",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "36.183330",
        "reclong": "139.216670",
        "year": "1958-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                135.2,
        35.08333
            )
        ,
        "id": "18000",
        "mass": "4742",
        "name": "Okano",
        "nametype": "Valid",
        "recclass": "Iron, IIAB",
        "reclat": "35.083330",
        "reclong": "135.200000",
        "year": "1904-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                25.5,
        50.83333
            )
        ,
        "id": "18002",
        "mass": "12000",
        "name": "Okniny",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "50.833330",
        "reclong": "25.500000",
        "year": "1834-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8.16667,
        52.95
            )
        ,
        "id": "18009",
        "mass": "16570",
        "name": "Oldenburg st_make_point(1930)",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "52.950000",
        "reclong": "8.166670",
        "year": "1930-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -0.03333,
        39
            )
        ,
        "id": "18012",
        "name": "Oliva-Gandia",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "39.000000",
        "reclong": "-0.033330",
        "year": "1520-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -7.06667,
        38.71667
            )
        ,
        "id": "18013",
        "mass": "150000",
        "name": "Olivenza",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "38.716670",
        "reclong": "-7.066670",
        "year": "1924-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -2.1,
        39.56667
            )
        ,
        "id": "18015",
        "mass": "40000",
        "name": "Olmedilla de Alarcón",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "39.566670",
        "reclong": "-2.100000",
        "year": "1929-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                161.80833,
        64.02
            )
        ,
        "id": "18019",
        "mass": "250000",
        "name": "Omolon",
        "nametype": "Valid",
        "recclass": "Pallasite, PMG",
        "reclat": "64.020000",
        "reclong": "161.808330",
        "year": "1981-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                1.38333,
        43.88333
            )
        ,
        "id": "18026",
        "mass": "14000",
        "name": "Orgueil",
        "nametype": "Valid",
        "recclass": "CI1",
        "reclat": "43.883330",
        "reclong": "1.383330",
        "year": "1864-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "30",
        ":@computed_region_nnqa_25f4": "1078",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -81.36222,
        28.5475
            )
        ,
        "id": "34489",
        "mass": "180",
        "name": "Orlando",
        "nametype": "Valid",
        "recclass": "Eucrite",
        "reclat": "28.547500",
        "reclong": "-81.362220",
        "year": "2004-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                6.15,
        47.11667
            )
        ,
        "id": "18030",
        "mass": "6000",
        "name": "Ornans",
        "nametype": "Valid",
        "recclass": "CO3.4",
        "reclat": "47.116670",
        "reclong": "6.150000",
        "year": "1868-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                8,
        48.5
            )
        ,
        "id": "18033",
        "mass": "4500",
        "name": "Ortenau",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "48.500000",
        "reclong": "8.000000",
        "year": "1671-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                12.93333,
        42.13333
            )
        ,
        "id": "18034",
        "mass": "3400",
        "name": "Orvinio",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "42.133330",
        "reclong": "12.933330",
        "year": "1872-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                9.4,
        58.88333
            )
        ,
        "id": "18042",
        "mass": "246",
        "name": "Oterøy",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "58.883330",
        "reclong": "9.400000",
        "year": "1928-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                140.35,
        38.4
            )
        ,
        "id": "18045",
        "mass": "6510",
        "name": "Otomi",
        "nametype": "Valid",
        "recclass": "H",
        "reclat": "38.400000",
        "reclong": "140.350000",
        "year": "1867-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "17",
        ":@computed_region_nnqa_25f4": "1947",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -95.21667,
        38.6
            )
        ,
        "id": "18046",
        "mass": "840",
        "name": "Ottawa",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "38.600000",
        "reclong": "-95.216670",
        "year": "1896-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.08,
        12.9
            )
        ,
        "id": "56729",
        "mass": "4440",
        "name": "Ouadangou",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "12.900000",
        "reclong": "0.080000",
        "year": "2003-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -6.57717,
        30.18
            )
        ,
        "id": "18050",
        "mass": "1215.5",
        "name": "Oued el Hadjar",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "30.180000",
        "reclong": "-6.577170",
        "year": "1986-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -13.1,
        24.3
            )
        ,
        "id": "31282",
        "mass": "17000",
        "name": "Oum Dreyga",
        "nametype": "Valid",
        "recclass": "H3-5",
        "reclat": "24.300000",
        "reclong": "-13.100000",
        "year": "2003-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -8.28,
        37.60833
            )
        ,
        "id": "18052",
        "mass": "20000",
        "name": "Ourique",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "37.608330",
        "reclong": "-8.280000",
        "year": "1998-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                16,
        -18
            )
        ,
        "id": "18055",
        "mass": "121.5",
        "name": "Ovambo",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-18.000000",
        "reclong": "16.000000",
        "year": "1900-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -5.86667,
        43.4
            )
        ,
        "id": "18058",
        "mass": "205",
        "name": "Oviedo",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "43.400000",
        "reclong": "-5.866670",
        "year": "1856-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                28.83333,
        51.33333
            )
        ,
        "id": "18062",
        "name": "Owrucz",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "51.333330",
        "reclong": "28.833330",
        "year": "1775-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -99.3,
        21.05
            )
        ,
        "id": "18068",
        "mass": "3400",
        "name": "Pacula",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "21.050000",
        "reclong": "-99.300000",
        "year": "1881-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                25,
        55.66667
            )
        ,
        "id": "18069",
        "mass": "3858",
        "name": "Padvarninkai",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "55.666670",
        "reclong": "25.000000",
        "year": "1929-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                120.45583,
        17.74333
            )
        ,
        "id": "18072",
        "mass": "515",
        "name": "Paitan",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "17.743330",
        "reclong": "120.455830",
        "year": "1910-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "32",
        ":@computed_region_nnqa_25f4": "503",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -89.71667,
        32.31667
            )
        ,
        "id": "18073",
        "name": "Palahatchie",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "32.316670",
        "reclong": "-89.716670",
        "year": "1910-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -65.1,
        -23.11667
            )
        ,
        "id": "18074",
        "mass": "1430",
        "name": "Palca de Aparzo",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "-23.116670",
        "reclong": "-65.100000",
        "year": "1988-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                118.61667,
        43.48333
            )
        ,
        "id": "18077",
        "mass": "18000",
        "name": "Palinshih",
        "nametype": "Valid",
        "recclass": "Iron",
        "reclat": "43.483330",
        "reclong": "118.616670",
        "year": "1914-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "18",
        ":@computed_region_nnqa_25f4": "2122",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -91.5,
        39.8
            )
        ,
        "id": "18079",
        "mass": "135",
        "name": "Palmyra",
        "nametype": "Valid",
        "recclass": "L3",
        "reclat": "39.800000",
        "reclong": "-91.500000",
        "year": "1926-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "4",
        ":@computed_region_nnqa_25f4": "1657",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -157.78333,
        21.3
            )
        ,
        "id": "18082",
        "mass": "682",
        "name": "Palolo Valley",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "21.300000",
        "reclong": "-157.783330",
        "year": "1949-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Found",
        "id": "32591",
        "mass": "69.5",
        "name": "Dominion Range 03239",
        "nametype": "Valid",
        "recclass": "L6",
        "year": "2002-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                120.7,
        15.08333
            )
        ,
        "id": "18093",
        "mass": "10500",
        "name": "Pampanga",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "15.083330",
        "reclong": "120.700000",
        "year": "1859-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                124.28333,
        8.06667
            )
        ,
        "id": "18098",
        "mass": "2130",
        "name": "Pantar",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "8.066670",
        "reclong": "124.283330",
        "year": "1938-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "15",
        ":@computed_region_nnqa_25f4": "1023",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -90.5,
        36.06667
            )
        ,
        "id": "18101",
        "mass": "408000",
        "name": "Paragould",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "36.066670",
        "reclong": "-90.500000",
        "year": "1930-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -40.7,
        -6.23333
            )
        ,
        "id": "18102",
        "mass": "2000",
        "name": "Parambu",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "-6.233330",
        "reclong": "-40.700000",
        "year": "1967-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -51.66667,
        -19.13333
            )
        ,
        "id": "18103",
        "mass": "100000",
        "name": "Paranaiba",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-19.133330",
        "reclong": "-51.666670",
        "year": "1956-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "34",
        ":@computed_region_nnqa_25f4": "1863",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -87.67917,
        41.48472
            )
        ,
        "id": "18106",
        "mass": "18000",
        "name": "Park Forest",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "41.484720",
        "reclong": "-87.679170",
        "year": "2003-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.35,
        9.23333
            )
        ,
        "id": "18108",
        "mass": "77600",
        "name": "Parnallee",
        "nametype": "Valid",
        "recclass": "LL3.6",
        "reclat": "9.233330",
        "reclong": "78.350000",
        "year": "1857-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                85.4,
        26.2
            )
        ,
        "id": "18109",
        "mass": "800",
        "name": "Parsa",
        "nametype": "Valid",
        "recclass": "EH3",
        "reclat": "26.200000",
        "reclong": "85.400000",
        "year": "1942-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "11",
        ":@computed_region_nnqa_25f4": "1994",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -103.4,
        36.21667
            )
        ,
        "id": "18110",
        "mass": "5100",
        "name": "Pasamonte",
        "nametype": "Valid",
        "recclass": "Eucrite-pmict",
        "reclat": "36.216670",
        "reclong": "-103.400000",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                82.05,
        20.93694
            )
        ,
        "id": "18112",
        "mass": "4375",
        "name": "Patora",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "20.936940",
        "reclong": "82.050000",
        "year": "1969-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -48.56667,
        -19.53333
            )
        ,
        "id": "18116",
        "mass": "2121",
        "name": "Patrimonio",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-19.533330",
        "reclong": "-48.566670",
        "year": "1950-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                14.96667,
        38.13333
            )
        ,
        "id": "18118",
        "mass": "12",
        "name": "Patti",
        "nametype": "Valid",
        "recclass": "Iron",
        "reclat": "38.133330",
        "reclong": "14.966670",
        "year": "1922-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                91.18333,
        23.15
            )
        ,
        "id": "18171",
        "mass": "37350",
        "name": "Patwar",
        "nametype": "Valid",
        "recclass": "Mesosiderite-A1",
        "reclat": "23.150000",
        "reclong": "91.183330",
        "year": "1935-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                25.51667,
        43.46667
            )
        ,
        "id": "18173",
        "mass": "2968",
        "name": "Pavel",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "43.466670",
        "reclong": "25.516670",
        "year": "1966-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                77.03333,
        52.3
            )
        ,
        "id": "18175",
        "mass": "142.5",
        "name": "Pavlodar st_make_point(stone)",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "52.300000",
        "reclong": "77.033330",
        "year": "1938-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                35.98333,
        48.53333
            )
        ,
        "id": "18176",
        "mass": "40000",
        "name": "Pavlograd",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "48.533330",
        "reclong": "35.983330",
        "year": "1826-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                43,
        52.03333
            )
        ,
        "id": "18177",
        "mass": "2000",
        "name": "Pavlovka",
        "nametype": "Valid",
        "recclass": "Howardite",
        "reclat": "52.033330",
        "reclong": "43.000000",
        "year": "1882-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -3.54217,
        11.33367
            )
        ,
        "id": "18179",
        "name": "Pê",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "11.333670",
        "reclong": "-3.542170",
        "year": "1989-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -117.93333,
        56.13333
            )
        ,
        "id": "18180",
        "mass": "45760",
        "name": "Peace River",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "56.133330",
        "reclong": "-117.933330",
        "year": "1963-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                9.25,
        51.66667
            )
        ,
        "id": "18181",
        "mass": "117.8",
        "name": "Peckelsheim",
        "nametype": "Valid",
        "recclass": "Diogenite-pm",
        "reclat": "51.666670",
        "reclong": "9.250000",
        "year": "1953-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "47",
        ":@computed_region_nnqa_25f4": "2185",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -73.91667,
        41.28333
            )
        ,
        "id": "18782",
        "mass": "12570",
        "name": "Peekskill",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "41.283330",
        "reclong": "-73.916670",
        "year": "1992-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "23",
        ":@computed_region_nnqa_25f4": "3062",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -103.11667,
        30.125
            )
        ,
        "id": "18786",
        "mass": "70000",
        "name": "Peña Blanca Spring",
        "nametype": "Valid",
        "recclass": "Aubrite",
        "reclat": "30.125000",
        "reclong": "-103.116670",
        "year": "1946-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                35.5,
        -10.66667
            )
        ,
        "id": "18792",
        "mass": "165",
        "name": "Peramiho",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "-10.666670",
        "reclong": "35.500000",
        "year": "1899-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                91,
        23.325
            )
        ,
        "id": "18793",
        "mass": "23474",
        "name": "Perpeti",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "23.325000",
        "reclong": "91.000000",
        "year": "1935-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -3.43333,
        56.4
            )
        ,
        "id": "18797",
        "mass": "2",
        "name": "Perth",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "56.400000",
        "reclong": "-3.433330",
        "year": "1830-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                39.43333,
        56.63333
            )
        ,
        "id": "18798",
        "mass": "66000",
        "name": "Pervomaisky",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "56.633330",
        "reclong": "39.433330",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                66.08333,
        55.5
            )
        ,
        "id": "18799",
        "mass": "3393",
        "name": "Pesyanoe",
        "nametype": "Valid",
        "recclass": "Aubrite",
        "reclat": "55.500000",
        "reclong": "66.083330",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.42,
        14.052
            )
        ,
        "id": "18800",
        "mass": "189",
        "name": "Pétèlkolé",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "14.052000",
        "reclong": "0.420000",
        "year": "1995-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "39",
        ":@computed_region_nnqa_25f4": "2017",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -86.63333,
        35.3
            )
        ,
        "id": "18801",
        "mass": "1800",
        "name": "Petersburg",
        "nametype": "Valid",
        "recclass": "Eucrite-pmict",
        "reclat": "35.300000",
        "reclong": "-86.633330",
        "year": "1855-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -7.33333,
        53.53333
            )
        ,
        "id": "18804",
        "name": "Pettiswood",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "53.533330",
        "reclong": "-7.333330",
        "year": "1779-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "17",
        ":@computed_region_nnqa_25f4": "1255",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -99.25,
        40
            )
        ,
        "id": "18808",
        "mass": "57900",
        "name": "Phillips County st_make_point(stone)",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "40.000000",
        "reclong": "-99.250000",
        "year": "1901-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                108.58333,
        11.25
            )
        ,
        "id": "18809",
        "mass": "500",
        "name": "Phu Hong",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "11.250000",
        "reclong": "108.583330",
        "year": "1887-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                105.48333,
        12
            )
        ,
        "id": "18811",
        "mass": "7800",
        "name": "Phum Sambo",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "12.000000",
        "reclong": "105.483330",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                108.1,
        15.71667
            )
        ,
        "id": "18812",
        "mass": "11000",
        "name": "Phuoc-Binh",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "15.716670",
        "reclong": "108.100000",
        "year": "1941-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                11.50222,
        44.24417
            )
        ,
        "id": "18813",
        "mass": "13.1",
        "name": "Piancaldoli",
        "nametype": "Valid",
        "recclass": "LL3.4",
        "reclat": "44.244170",
        "reclong": "11.502220",
        "year": "1968-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -6.23333,
        41.36667
            )
        ,
        "id": "18816",
        "name": "Picote",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "41.366670",
        "reclong": "-6.233330",
        "year": "1843-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                25.73333,
        58.66667
            )
        ,
        "id": "18822",
        "mass": "23250",
        "name": "Pillistfer",
        "nametype": "Valid",
        "recclass": "EL6",
        "reclat": "58.666670",
        "reclong": "25.733330",
        "year": "1863-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                73.94167,
        26.03472
            )
        ,
        "id": "18831",
        "mass": "42000",
        "name": "Piplia Kalan",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "26.034720",
        "reclong": "73.941670",
        "year": "1996-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                18.71667,
        -32.86667
            )
        ,
        "id": "18832",
        "mass": "37",
        "name": "Piquetberg",
        "nametype": "Valid",
        "recclass": "H",
        "reclat": "-32.866670",
        "reclong": "18.716670",
        "year": "1881-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                88.45,
        25.8
            )
        ,
        "id": "18834",
        "mass": "842",
        "name": "Pirgunje",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "25.800000",
        "reclong": "88.450000",
        "year": "1882-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76,
        29.58333
            )
        ,
        "id": "18835",
        "mass": "1161",
        "name": "Pirthalla",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "29.583330",
        "reclong": "76.000000",
        "year": "1884-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "31",
        ":@computed_region_nnqa_25f4": "207",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -83.51667,
        31.95
            )
        ,
        "id": "18837",
        "mass": "3760",
        "name": "Pitts",
        "nametype": "Valid",
        "recclass": "Iron, IAB-ung",
        "reclat": "31.950000",
        "reclong": "-83.516670",
        "year": "1921-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "23",
        ":@computed_region_nnqa_25f4": "2018",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -96.11667,
        30.7
            )
        ,
        "id": "18846",
        "mass": "2085",
        "name": "Plantersville",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "30.700000",
        "reclong": "-96.116670",
        "year": "1930-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                26.70972,
        45.275
            )
        ,
        "id": "51706",
        "mass": "6913",
        "name": "Pleşcoi",
        "nametype": "Valid",
        "recclass": "L5-6",
        "reclat": "45.275000",
        "reclong": "26.709720",
        "year": "2008-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                14.11667,
        50.53333
            )
        ,
        "id": "18849",
        "mass": "39",
        "name": "Ploschkovitz",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "50.533330",
        "reclong": "14.116670",
        "year": "1723-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                104.91667,
        11.58333
            )
        ,
        "id": "18851",
        "mass": "96",
        "name": "Pnompehn",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "11.583330",
        "reclong": "104.916670",
        "year": "1868-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Found",
        "id": "32592",
        "mass": "290.89999999999998",
        "name": "Dominion Range 03240",
        "nametype": "Valid",
        "recclass": "LL5",
        "year": "2002-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                12.13333,
        50.93333
            )
        ,
        "id": "18853",
        "mass": "3000",
        "name": "Pohlitz",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "50.933330",
        "reclong": "12.133330",
        "year": "1819-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                82.66667,
        26.71667
            )
        ,
        "id": "18858",
        "mass": "350",
        "name": "Pokhra",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "26.716670",
        "reclong": "82.666670",
        "year": "1866-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                14.015,
        66.34833
            )
        ,
        "id": "18860",
        "mass": "253.6",
        "name": "Pollen",
        "nametype": "Valid",
        "recclass": "CM2",
        "reclat": "66.348330",
        "reclong": "14.015000",
        "year": "1942-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -4.31944,
        53.03639
            )
        ,
        "id": "18865",
        "mass": "157",
        "name": "Pontlyfni",
        "nametype": "Valid",
        "recclass": "Winonaite",
        "reclat": "53.036390",
        "reclong": "-4.319440",
        "year": "1931-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "11",
        ":@computed_region_nnqa_25f4": "1987",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -103.295,
        34.175
            )
        ,
        "id": "18874",
        "mass": "71400",
        "name": "Portales Valley",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "34.175000",
        "reclong": "-103.295000",
        "year": "1998-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -8,
        38.5
            )
        ,
        "id": "18876",
        "mass": "4500",
        "name": "Portugal",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "38.500000",
        "reclong": "-8.000000",
        "year": "1796-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                118.5,
        31.41667
            )
        ,
        "id": "18879",
        "mass": "665",
        "name": "Po-wang Chen",
        "nametype": "Valid",
        "recclass": "LL",
        "reclat": "31.416670",
        "reclong": "118.500000",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                13.94083,
        48.3025
            )
        ,
        "id": "18883",
        "mass": "2125",
        "name": "Prambachkirchen",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "48.302500",
        "reclong": "13.940830",
        "year": "1932-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                14.03333,
        49.66667
            )
        ,
        "id": "18887",
        "mass": "5555",
        "name": "Pribram",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "49.666670",
        "reclong": "14.033330",
        "year": "1959-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "38",
        ":@computed_region_nnqa_25f4": "2566",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -83.85,
        39.11667
            )
        ,
        "id": "18888",
        "mass": "900",
        "name": "Pricetown",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "39.116670",
        "reclong": "-83.850000",
        "year": "1893-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -3.51667,
        39.35
            )
        ,
        "id": "45984",
        "mass": "500",
        "name": "Puerto Lápice",
        "nametype": "Valid",
        "recclass": "Eucrite-br",
        "reclat": "39.350000",
        "reclong": "-3.516670",
        "year": "2007-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                75.18333,
        23.36667
            )
        ,
        "id": "18899",
        "mass": "560",
        "name": "Pulsora",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "23.366670",
        "reclong": "75.183330",
        "year": "1863-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                21.26667,
        52.76667
            )
        ,
        "id": "18901",
        "mass": "250000",
        "name": "Pultusk",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "52.766670",
        "reclong": "21.266670",
        "year": "1868-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.95,
        13.33333
            )
        ,
        "id": "18902",
        "mass": "100",
        "name": "Punganaru",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "13.333330",
        "reclong": "78.950000",
        "year": "1811-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -53.05,
        -29.03333
            )
        ,
        "id": "18905",
        "mass": "300000",
        "name": "Putinga",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-29.033330",
        "reclong": "-53.050000",
        "year": "1937-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                121.5,
        32.08333
            )
        ,
        "id": "18907",
        "mass": "1275",
        "name": "Qidong",
        "nametype": "Valid",
        "recclass": "L/LL5",
        "reclat": "32.083330",
        "reclong": "121.500000",
        "year": "1982-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                106.46667,
        26.53333
            )
        ,
        "id": "18908",
        "mass": "2600",
        "name": "Qingzhen",
        "nametype": "Valid",
        "recclass": "EH3",
        "reclat": "26.533330",
        "reclong": "106.466670",
        "year": "1976-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                28.7,
        -30.11667
            )
        ,
        "id": "22357",
        "mass": "7000",
        "name": "Queen's Mercy",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "-30.116670",
        "reclong": "28.700000",
        "year": "1925-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                95.18333,
        17.76667
            )
        ,
        "id": "22358",
        "mass": "6045",
        "name": "Quenggouk",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "17.766670",
        "reclong": "95.183330",
        "year": "1857-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -0.66667,
        39
            )
        ,
        "id": "22360",
        "mass": "10750",
        "name": "Quesa",
        "nametype": "Valid",
        "recclass": "Iron, IAB-ung",
        "reclat": "39.000000",
        "reclong": "-0.666670",
        "year": "1898-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                126.13333,
        44.61667
            )
        ,
        "id": "22361",
        "mass": "17450",
        "name": "Quija",
        "nametype": "Valid",
        "recclass": "H",
        "reclat": "44.616670",
        "reclong": "126.133330",
        "year": "1990-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.25,
        46.6
            )
        ,
        "id": "22363",
        "mass": "65",
        "name": "Quincay",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "46.600000",
        "reclong": "0.250000",
        "year": "1851-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -65.45,
        -26.66667
            )
        ,
        "id": "22368",
        "mass": "5000",
        "name": "Raco",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-26.666670",
        "reclong": "-65.450000",
        "year": "1957-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.465,
        27.72528
            )
        ,
        "id": "22371",
        "mass": "10200",
        "name": "Raghunathpura",
        "nametype": "Valid",
        "recclass": "Iron, IIAB",
        "reclat": "27.725280",
        "reclong": "76.465000",
        "year": "1986-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                70.2,
        28.225
            )
        ,
        "id": "31302",
        "mass": "67225",
        "name": "Rahimyar Khan",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "28.225000",
        "reclong": "70.200000",
        "year": "1983-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                37.03333,
        52.98333
            )
        ,
        "id": "22376",
        "mass": "9000",
        "name": "Rakovka",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "52.983330",
        "reclong": "37.033330",
        "year": "1878-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                82.9,
        26.45
            )
        ,
        "id": "22384",
        "mass": "3766",
        "name": "Ramnagar",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "26.450000",
        "reclong": "82.900000",
        "year": "1940-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                87.76667,
        24.16667
            )
        ,
        "id": "22385",
        "mass": "100",
        "name": "Rampurhat",
        "nametype": "Valid",
        "recclass": "LL",
        "reclat": "24.166670",
        "reclong": "87.766670",
        "year": "1916-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                6.93333,
        51.88333
            )
        ,
        "id": "22386",
        "mass": "4682",
        "name": "Ramsdorf",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "51.883330",
        "reclong": "6.933330",
        "year": "1958-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                87.08333,
        23.98333
            )
        ,
        "id": "22387",
        "mass": "290.39999999999998",
        "name": "Ranchapur",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "23.983330",
        "reclong": "87.083330",
        "year": "1917-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -100.81667,
        19.86667
            )
        ,
        "id": "22390",
        "mass": "300",
        "name": "Rancho de la Presa",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "19.866670",
        "reclong": "-100.816670",
        "year": "1899-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                72.01667,
        25.38333
            )
        ,
        "id": "22392",
        "mass": "3224.5",
        "name": "Rangala",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "25.383330",
        "reclong": "72.016670",
        "year": "1937-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                115.7,
        38.2
            )
        ,
        "id": "22394",
        "mass": "4910",
        "name": "Raoyang",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "38.200000",
        "reclong": "115.700000",
        "year": "1919-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                50.15,
        26.66667
            )
        ,
        "id": "22395",
        "mass": "6.1",
        "name": "Ras Tanura",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "26.666670",
        "reclong": "50.150000",
        "year": "1961-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                26.53333,
        43.5
            )
        ,
        "id": "22396",
        "mass": "24700",
        "name": "Rasgrad",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "43.500000",
        "reclong": "26.533330",
        "year": "1740-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                17.98333,
        52.2
            )
        ,
        "id": "22398",
        "mass": "910",
        "name": "Ratyn",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "52.200000",
        "reclong": "17.983330",
        "year": "1880-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "8",
        ":@computed_region_nnqa_25f4": "1391",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -119.75812,
        38.13742
            )
        ,
        "id": "53502",
        "mass": "18.41",
        "name": "Red Canyon Lake",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "38.137420",
        "reclong": "-119.758120",
        "year": "2007-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -5.33333,
        42.475
            )
        ,
        "id": "22584",
        "mass": "17300",
        "name": "Reliegos",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "42.475000",
        "reclong": "-5.333330",
        "year": "1947-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                111.36667,
        -6.73333
            )
        ,
        "id": "22585",
        "mass": "10000",
        "name": "Rembang",
        "nametype": "Valid",
        "recclass": "Iron, IVA",
        "reclat": "-6.733330",
        "reclong": "111.366670",
        "year": "1919-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                11.28333,
        44.76667
            )
        ,
        "id": "22586",
        "mass": "1000",
        "name": "Renazzo",
        "nametype": "Valid",
        "recclass": "CR2",
        "reclat": "44.766670",
        "reclong": "11.283330",
        "year": "1824-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -65.28333,
        -32.75
            )
        ,
        "id": "22587",
        "mass": "300",
        "name": "Renca",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "-32.750000",
        "reclong": "-65.283330",
        "year": "1925-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                116.13333,
        38.66667
            )
        ,
        "id": "22589",
        "mass": "355",
        "name": "Renqiu",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "38.666670",
        "reclong": "116.133330",
        "year": "1916-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                45.66667,
        48.6
            )
        ,
        "id": "22590",
        "mass": "7000",
        "name": "Repeev Khutor",
        "nametype": "Valid",
        "recclass": "Iron, IIF",
        "reclat": "48.600000",
        "reclong": "45.666670",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -118.95,
        51.33333
            )
        ,
        "id": "22592",
        "mass": "1",
        "name": "Revelstoke",
        "nametype": "Valid",
        "recclass": "CI1",
        "reclat": "51.333330",
        "reclong": "-118.950000",
        "year": "1965-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                76.66667,
        28.2
            )
        ,
        "id": "22593",
        "mass": "3332",
        "name": "Rewari",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "28.200000",
        "reclong": "76.666670",
        "year": "1929-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "37",
        ":@computed_region_nnqa_25f4": "2388",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -83.03333,
        35.03333
            )
        ,
        "id": "22597",
        "mass": "668",
        "name": "Rich Mountain",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "35.033330",
        "reclong": "-83.033330",
        "year": "1903-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -66.15,
        -44.11667
            )
        ,
        "id": "24140",
        "mass": "20000",
        "name": "Uzcudun",
        "nametype": "Valid",
        "recclass": "L",
        "reclat": "-44.116670",
        "reclong": "-66.150000",
        "year": "1948-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "3",
        ":@computed_region_nnqa_25f4": "569",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -102.31667,
        46.88333
            )
        ,
        "id": "22599",
        "mass": "90000",
        "name": "Richardton",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "46.883330",
        "reclong": "-102.316670",
        "year": "1918-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "23",
        ":@computed_region_nnqa_25f4": "2885",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -99.03333,
        31.25
            )
        ,
        "id": "22602",
        "mass": "1900",
        "name": "Richland Springs",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "31.250000",
        "reclong": "-99.033330",
        "year": "1980-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "40",
        ":@computed_region_nnqa_25f4": "2764",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -77.5,
        37.46667
            )
        ,
        "id": "22603",
        "mass": "1800",
        "name": "Richmond",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "37.466670",
        "reclong": "-77.500000",
        "year": "1828-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -49.8,
        -26.1
            )
        ,
        "id": "22611",
        "mass": "1310",
        "name": "Rio Negro",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "-26.100000",
        "reclong": "-49.800000",
        "year": "1934-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                9.51667,
        45.48333
            )
        ,
        "id": "22614",
        "mass": "103.3",
        "name": "Rivolta de Bassi",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "45.483330",
        "reclong": "9.516670",
        "year": "1491-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "35",
        ":@computed_region_nnqa_25f4": "150",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -86.28333,
        41.08333
            )
        ,
        "id": "22637",
        "mass": "340",
        "name": "Rochester",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "41.083330",
        "reclong": "-86.283330",
        "year": "1876-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                150.51667,
        -23.38333
            )
        ,
        "id": "22640",
        "mass": "1641",
        "name": "Rockhampton",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "-23.383330",
        "reclong": "150.516670",
        "year": "1895-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.55,
        42.3
            )
        ,
        "id": "22641",
        "mass": "400",
        "name": "Roda",
        "nametype": "Valid",
        "recclass": "Diogenite",
        "reclat": "42.300000",
        "reclong": "0.550000",
        "year": "1871-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                10.8,
        50.35
            )
        ,
        "id": "22642",
        "mass": "2900",
        "name": "Rodach",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "50.350000",
        "reclong": "10.800000",
        "year": "1775-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "50",
        ":@computed_region_nnqa_25f4": "361",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -83.95,
        44.51667
            )
        ,
        "id": "22766",
        "mass": "10600",
        "name": "Rose City",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "44.516670",
        "reclong": "-83.950000",
        "year": "1921-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -2.51667,
        52.76667
            )
        ,
        "id": "22773",
        "mass": "3500",
        "name": "Rowton",
        "nametype": "Valid",
        "recclass": "Iron, IIIAB",
        "reclat": "52.766670",
        "reclong": "-2.516670",
        "year": "1876-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                29.83333,
        -1.45
            )
        ,
        "id": "22780",
        "mass": "465.5",
        "name": "Ruhobobo",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-1.450000",
        "reclong": "29.833330",
        "year": "1976-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                36.53333,
        0.26667
            )
        ,
        "id": "22782",
        "mass": "67",
        "name": "Rumuruti",
        "nametype": "Valid",
        "recclass": "R3.8-6",
        "reclat": "0.266670",
        "reclong": "36.533330",
        "year": "1934-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                38.76667,
        -10.26667
            )
        ,
        "id": "22783",
        "mass": "6000",
        "name": "Rupota",
        "nametype": "Valid",
        "recclass": "L4-6",
        "reclat": "-10.266670",
        "reclong": "38.766670",
        "year": "1949-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                34.5,
        51.13333
            )
        ,
        "id": "22791",
        "mass": "13000",
        "name": "Ryechki",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "51.133330",
        "reclong": "34.500000",
        "year": "1914-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                82.08333,
        27.43333
            )
        ,
        "id": "22792",
        "mass": "1250",
        "name": "Sabetmahet",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "27.433330",
        "reclong": "82.083330",
        "year": "1855-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                91.66667,
        23.08333
            )
        ,
        "id": "22793",
        "mass": "478",
        "name": "Sabrum",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "23.083330",
        "reclong": "91.666670",
        "year": "1999-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                14.88333,
        51.53333
            )
        ,
        "id": "22796",
        "name": "Sagan",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "51.533330",
        "reclong": "14.883330",
        "year": "1636-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                1.38333,
        43.73333
            )
        ,
        "id": "23101",
        "mass": "14000",
        "name": "Saint-Sauveur",
        "nametype": "Valid",
        "recclass": "EH5",
        "reclat": "43.733330",
        "reclong": "1.383330",
        "year": "1914-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.23333,
        45.3
            )
        ,
        "id": "23102",
        "mass": "271000",
        "name": "Saint-Séverin",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "45.300000",
        "reclong": "0.233330",
        "year": "1966-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                136.3,
        35.66667
            )
        ,
        "id": "23103",
        "mass": "4180",
        "name": "Sakauchi",
        "nametype": "Valid",
        "recclass": "Iron",
        "reclat": "35.666670",
        "reclong": "136.300000",
        "year": "1913-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "12",
        ":@computed_region_nnqa_25f4": "2409",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -122.96944,
        44.97917
            )
        ,
        "id": "23107",
        "mass": "61.4",
        "name": "Salem",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "44.979170",
        "reclong": "-122.969440",
        "year": "1981-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                4.63333,
        46.05
            )
        ,
        "id": "23111",
        "mass": "9000",
        "name": "Salles",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "46.050000",
        "reclong": "4.633330",
        "year": "1798-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                11.05,
        52.75
            )
        ,
        "id": "23114",
        "mass": "43",
        "name": "Salzwedel",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "52.750000",
        "reclong": "11.050000",
        "year": "1985-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                74.86667,
        25.66667
            )
        ,
        "id": "23115",
        "mass": "2462",
        "name": "Samelia",
        "nametype": "Valid",
        "recclass": "Iron, IIIAB",
        "reclat": "25.666670",
        "reclong": "74.866670",
        "year": "1921-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "8",
        ":@computed_region_nnqa_25f4": "1174",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -117.6625,
        33.48472
            )
        ,
        "id": "23128",
        "mass": "56",
        "name": "San Juan Capistrano",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "33.484720",
        "reclong": "-117.662500",
        "year": "1973-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                13,
        43.66667
            )
        ,
        "id": "31315",
        "mass": "237",
        "name": "San Michele",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "43.666670",
        "reclong": "13.000000",
        "year": "2002-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -71.4,
        -31.01667
            )
        ,
        "id": "23130",
        "mass": "282",
        "name": "San Pedro de Quiles",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-31.016670",
        "reclong": "-71.400000",
        "year": "1956-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -100.65,
        19.76667
            )
        ,
        "id": "34063",
        "mass": "460",
        "name": "San Pedro Jacuaro",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "19.766670",
        "reclong": "-100.650000",
        "year": "1968-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -51.86667,
        -29.2
            )
        ,
        "id": "23161",
        "mass": "400",
        "name": "Santa Barbara",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "-29.200000",
        "reclong": "-51.866670",
        "year": "1873-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -99.33333,
        24.16667
            )
        ,
        "id": "23164",
        "mass": "60",
        "name": "Santa Cruz",
        "nametype": "Valid",
        "recclass": "CM2",
        "reclat": "24.166670",
        "reclong": "-99.333330",
        "year": "1939-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -61.7,
        -33.9
            )
        ,
        "id": "23165",
        "mass": "5500",
        "name": "Santa Isabel",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-33.900000",
        "reclong": "-61.700000",
        "year": "1924-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -68.489444,
        -31.535556
            )
        ,
        "id": "50909",
        "mass": "4000",
        "name": "Santa Lucia st_make_point(2008)",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-31.535556",
        "reclong": "-68.489444",
        "year": "2008-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -49.38056,
        -20.81
            )
        ,
        "id": "23171",
        "mass": "927",
        "name": "São Jose do Rio Preto",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "-20.810000",
        "reclong": "-49.380560",
        "year": "1962-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                46.55,
        52.55
            )
        ,
        "id": "23176",
        "mass": "200000",
        "name": "Saratov",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "52.550000",
        "reclong": "46.550000",
        "year": "1918-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                137.78333,
        34.71667
            )
        ,
        "id": "23187",
        "mass": "695",
        "name": "Sasagase",
        "nametype": "Valid",
        "recclass": "H",
        "reclat": "34.716670",
        "reclong": "137.783330",
        "year": "1688-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -0.85,
        43.15
            )
        ,
        "id": "23188",
        "mass": "4000",
        "name": "Sauguis",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "43.150000",
        "reclong": "-0.850000",
        "year": "1868-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                29.86667,
        47.21667
            )
        ,
        "id": "23190",
        "mass": "2500",
        "name": "Savtschenskoje",
        "nametype": "Valid",
        "recclass": "LL4",
        "reclat": "47.216670",
        "reclong": "29.866670",
        "year": "1894-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                139.4,
        35.86667
            )
        ,
        "id": "23192",
        "mass": "430",
        "name": "Sayama",
        "nametype": "Valid",
        "recclass": "CM2",
        "reclat": "35.866670",
        "reclong": "139.400000",
        "year": "1986-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                17.56667,
        49.23333
            )
        ,
        "id": "23455",
        "mass": "412",
        "name": "Sazovice",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "49.233330",
        "reclong": "17.566670",
        "year": "1934-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                15.05,
        53.35
            )
        ,
        "id": "23457",
        "mass": "7000",
        "name": "Schellin",
        "nametype": "Valid",
        "recclass": "L",
        "reclat": "53.350000",
        "reclong": "15.050000",
        "year": "1715-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "47",
        ":@computed_region_nnqa_25f4": "2142",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -73.95028,
        42.86083
            )
        ,
        "id": "23458",
        "mass": "283.3",
        "name": "Schenectady",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "42.860830",
        "reclong": "-73.950280",
        "year": "1968-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                10.46667,
        48.11667
            )
        ,
        "id": "23460",
        "mass": "8000",
        "name": "Schönenberg",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "48.116670",
        "reclong": "10.466670",
        "year": "1846-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "49",
        ":@computed_region_nnqa_25f4": "1727",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -69.2,
        44.36667
            )
        ,
        "id": "23472",
        "mass": "5400",
        "name": "Searsmont",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "44.366670",
        "reclong": "-69.200000",
        "year": "1871-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                27.13333,
        38.3
            )
        ,
        "id": "23473",
        "mass": "240",
        "name": "Sediköy",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "38.300000",
        "reclong": "27.133330",
        "year": "1917-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                84.78333,
        26.75
            )
        ,
        "id": "23476",
        "mass": "6930",
        "name": "Segowlie",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "26.750000",
        "reclong": "84.783330",
        "year": "1853-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                107.33333,
        -7.23333
            )
        ,
        "id": "23481",
        "mass": "1590",
        "name": "Selakopi",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "-7.233330",
        "reclong": "107.333330",
        "year": "1939-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                4.98333,
        22.83333
            )
        ,
        "id": "23483",
        "mass": "150",
        "name": "Seldebourak",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "22.833330",
        "reclong": "4.983330",
        "year": "1947-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                79,
        22.25
            )
        ,
        "id": "23487",
        "mass": "691",
        "name": "Semarkona",
        "nametype": "Valid",
        "recclass": "LL3.00",
        "reclat": "22.250000",
        "reclong": "79.000000",
        "year": "1940-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -0.05,
        41.71667
            )
        ,
        "id": "23495",
        "mass": "4000",
        "name": "Sena",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "41.716670",
        "reclong": "-0.050000",
        "year": "1773-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                140.51167,
        39.43833
            )
        ,
        "id": "23496",
        "mass": "866",
        "name": "Senboku",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "39.438330",
        "reclong": "140.511670",
        "year": "1993-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                79.50083,
        21.68389
            )
        ,
        "id": "23500",
        "mass": "20000",
        "name": "Seoni",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "21.683890",
        "reclong": "79.500830",
        "year": "1966-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                23.56667,
        41.05
            )
        ,
        "id": "23501",
        "mass": "8500",
        "name": "Seres",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "41.050000",
        "reclong": "23.566670",
        "year": "1818-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -36.76667,
        -8.38333
            )
        ,
        "id": "23502",
        "mass": "1800",
        "name": "Serra de Magé",
        "nametype": "Valid",
        "recclass": "Eucrite-cm",
        "reclat": "-8.383330",
        "reclong": "-36.766670",
        "year": "1923-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -44.21667,
        -19.46667
            )
        ,
        "id": "23504",
        "mass": "350",
        "name": "Sete Lagoas",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "-19.466670",
        "reclong": "-44.216670",
        "year": "1908-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -6,
        37.41667
            )
        ,
        "id": "23508",
        "mass": "180",
        "name": "Sevilla",
        "nametype": "Valid",
        "recclass": "LL4",
        "reclat": "37.416670",
        "reclong": "-6.000000",
        "year": "1862-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                36.6,
        50.61667
            )
        ,
        "id": "23509",
        "mass": "101000",
        "name": "Sevrukovo",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "50.616670",
        "reclong": "36.600000",
        "year": "1874-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                10.71667,
        34.75
            )
        ,
        "id": "23512",
        "mass": "7000",
        "name": "Sfax",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "34.750000",
        "reclong": "10.716670",
        "year": "1989-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                87.3,
        23.1
            )
        ,
        "id": "23521",
        "mass": "4000",
        "name": "Shalka",
        "nametype": "Valid",
        "recclass": "Diogenite",
        "reclat": "23.100000",
        "reclong": "87.300000",
        "year": "1850-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "40",
        ":@computed_region_nnqa_25f4": "921",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -76.7,
        37.83333
            )
        ,
        "id": "23525",
        "mass": "1265",
        "name": "Sharps",
        "nametype": "Valid",
        "recclass": "H3.4",
        "reclat": "37.833330",
        "reclong": "-76.700000",
        "year": "1921-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -80.16667,
        44.05
            )
        ,
        "id": "23529",
        "mass": "18600",
        "name": "Shelburne",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "44.050000",
        "reclong": "-80.166670",
        "year": "1904-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                84.83333,
        24.55
            )
        ,
        "id": "23530",
        "mass": "5000",
        "name": "Shergotty",
        "nametype": "Valid",
        "recclass": "Martian st_make_point(shergottite)",
        "reclat": "24.550000",
        "reclong": "84.833330",
        "year": "1865-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                120.06667,
        33.65
            )
        ,
        "id": "23531",
        "mass": "605",
        "name": "Sheyang",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "33.650000",
        "reclong": "120.066670",
        "year": "1976-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                87.5775,
        25.85
            )
        ,
        "id": "23534",
        "mass": "3679.7",
        "name": "Shikarpur",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "25.850000",
        "reclong": "87.577500",
        "year": "1921-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                125.66667,
        43.5
            )
        ,
        "id": "23582",
        "mass": "3900",
        "name": "Shuangyang",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "43.500000",
        "reclong": "125.666670",
        "year": "1971-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                74.83333,
        33.71667
            )
        ,
        "id": "23583",
        "mass": "5000",
        "name": "Shupiyan",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "33.716670",
        "reclong": "74.833330",
        "year": "1912-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                90.16667,
        24.33333
            )
        ,
        "id": "23584",
        "mass": "3200",
        "name": "Shytal",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "24.333330",
        "reclong": "90.166670",
        "year": "1863-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                11.6,
        43.11667
            )
        ,
        "id": "23586",
        "mass": "3700",
        "name": "Siena",
        "nametype": "Valid",
        "recclass": "LL5",
        "reclat": "43.116670",
        "reclong": "11.600000",
        "year": "1794-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                134.65333,
        46.16
            )
        ,
        "id": "23593",
        "mass": "23000000",
        "name": "Sikhote-Alin",
        "nametype": "Valid",
        "recclass": "Iron, IIAB",
        "reclat": "46.160000",
        "reclong": "134.653330",
        "year": "1947-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -101.38333,
        20.93333
            )
        ,
        "id": "23594",
        "mass": "1710",
        "name": "Silao",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "20.933330",
        "reclong": "-101.383330",
        "year": "1995-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                27.26667,
        44.11667
            )
        ,
        "id": "55584",
        "mass": "0.15",
        "name": "Silistra",
        "nametype": "Valid",
        "recclass": "Achondrite-ung",
        "reclat": "44.116670",
        "reclong": "27.266670",
        "year": "1917-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                7.53333,
        49.98333
            )
        ,
        "id": "23603",
        "mass": "1222",
        "name": "Simmern",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "49.983330",
        "reclong": "7.533330",
        "year": "1920-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                32.48333,
        30.9
            )
        ,
        "id": "23606",
        "mass": "1455",
        "name": "Sinai",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "30.900000",
        "reclong": "32.483330",
        "year": "1916-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                69.55,
        26.21667
            )
        ,
        "id": "23611",
        "mass": "8400",
        "name": "Sindhri",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "26.216670",
        "reclong": "69.550000",
        "year": "1901-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                9.2,
        39.3
            )
        ,
        "id": "23613",
        "mass": "2000",
        "name": "Sinnai",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "39.300000",
        "reclong": "9.200000",
        "year": "1956-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "19",
        ":@computed_region_nnqa_25f4": "2351",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -103.66667,
        42.58333
            )
        ,
        "id": "23614",
        "mass": "4100",
        "name": "Sioux County",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "42.583330",
        "reclong": "-103.666670",
        "year": "1933-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                82.58333,
        20.91667
            )
        ,
        "id": "23616",
        "mass": "1600",
        "name": "Sitathali",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "20.916670",
        "reclong": "82.583330",
        "year": "1875-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                36.13583,
        39.82467
            )
        ,
        "id": "23617",
        "mass": "40000",
        "name": "Sivas",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "39.824670",
        "reclong": "36.135830",
        "year": "1989-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                119.86667,
        32.43333
            )
        ,
        "id": "23619",
        "mass": "630",
        "name": "Sixiangkou",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "32.433330",
        "reclong": "119.866670",
        "year": "1989-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                10.86667,
        59.73333
            )
        ,
        "id": "23621",
        "mass": "850",
        "name": "Ski",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "59.733330",
        "reclong": "10.866670",
        "year": "1848-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                15.6,
        45.68333
            )
        ,
        "id": "23626",
        "mass": "1708",
        "name": "Slavetic",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "45.683330",
        "reclong": "15.600000",
        "year": "1868-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                35,
        55
            )
        ,
        "id": "23645",
        "mass": "2750",
        "name": "Slobodka",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "55.000000",
        "reclong": "35.000000",
        "year": "1818-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                84.06667,
        27.13333
            )
        ,
        "id": "23660",
        "mass": "72.900000000000006",
        "name": "Soheria",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "27.133330",
        "reclong": "84.066670",
        "year": "1960-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                21.86667,
        43.66667
            )
        ,
        "id": "23661",
        "mass": "80000",
        "name": "Soko-Banja",
        "nametype": "Valid",
        "recclass": "LL4",
        "reclat": "43.666670",
        "reclong": "21.866670",
        "year": "1877-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                1.73333,
        47.36667
            )
        ,
        "id": "23663",
        "mass": "54",
        "name": "Sologne",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "47.366670",
        "reclong": "1.733330",
        "year": "1860-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                22.005,
        54.00883
            )
        ,
        "id": "53829",
        "mass": "1066",
        "name": "Sołtmany",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "54.008830",
        "reclong": "22.005000",
        "year": "2011-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                135.33333,
        35.16667
            )
        ,
        "id": "23667",
        "mass": "17100",
        "name": "Sone",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "35.166670",
        "reclong": "135.333330",
        "year": "1866-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                125,
        45.25
            )
        ,
        "id": "23668",
        "mass": "36900",
        "name": "Songyuan",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "45.250000",
        "reclong": "125.000000",
        "year": "1993-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                23.5,
        44.41667
            )
        ,
        "id": "23670",
        "mass": "958",
        "name": "Sopot",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "44.416670",
        "reclong": "23.500000",
        "year": "1927-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                33.63333,
        1.7
            )
        ,
        "id": "23671",
        "mass": "2050",
        "name": "Soroti",
        "nametype": "Valid",
        "recclass": "Iron, ungrouped",
        "reclat": "1.700000",
        "reclong": "33.633330",
        "year": "1945-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                0.05,
        44.75
            )
        ,
        "id": "23081",
        "mass": "360",
        "name": "St. Caprais-de-Quinsac",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "44.750000",
        "reclong": "0.050000",
        "year": "1883-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -1.5,
        46.95
            )
        ,
        "id": "23082",
        "mass": "5500",
        "name": "St. Christophe-la-Chartreuse",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "46.950000",
        "reclong": "-1.500000",
        "year": "1841-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                3.75,
        51.05
            )
        ,
        "id": "23083",
        "mass": "700",
        "name": "St. Denis Westrem",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "51.050000",
        "reclong": "3.750000",
        "year": "1855-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -1.15,
        48.01667
            )
        ,
        "id": "23087",
        "mass": "4000",
        "name": "St. Germain-du-Pinel",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "48.016670",
        "reclong": "-1.150000",
        "year": "1890-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "18",
        ":@computed_region_nnqa_25f4": "2223",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -90.23333,
        38.7
            )
        ,
        "id": "23089",
        "mass": "1000",
        "name": "St. Louis",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "38.700000",
        "reclong": "-90.233330",
        "year": "1950-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                27.41667,
        -32.01667
            )
        ,
        "id": "23090",
        "mass": "13780",
        "name": "St. Mark's",
        "nametype": "Valid",
        "recclass": "EH5",
        "reclat": "-32.016670",
        "reclong": "27.416670",
        "year": "1903-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "45",
        ":@computed_region_nnqa_25f4": "424",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -76.38333,
        38.16667
            )
        ,
        "id": "23091",
        "mass": "24.3",
        "name": "St. Mary's County",
        "nametype": "Valid",
        "recclass": "LL3.3",
        "reclat": "38.166670",
        "reclong": "-76.383330",
        "year": "1919-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                3.93333,
        48.45
            )
        ,
        "id": "23092",
        "mass": "8300",
        "name": "St. Mesmin",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "48.450000",
        "reclong": "3.933330",
        "year": "1866-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                27.2,
        61.65
            )
        ,
        "id": "23093",
        "mass": "17000",
        "name": "St. Michel",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "61.650000",
        "reclong": "27.200000",
        "year": "1910-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                2.95,
        43.43333
            )
        ,
        "id": "23097",
        "mass": "134.30000000000001",
        "name": "St.-Chinian",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "43.433330",
        "reclong": "2.950000",
        "year": "1959-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                14.95,
        59.93333
            )
        ,
        "id": "23712",
        "mass": "34000",
        "name": "Ställdalen",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "59.933330",
        "reclong": "14.950000",
        "year": "1876-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                15.56667,
        49.28333
            )
        ,
        "id": "23713",
        "mass": "52000",
        "name": "Stannern",
        "nametype": "Valid",
        "recclass": "Eucrite-mmict",
        "reclat": "49.283330",
        "reclong": "15.566670",
        "year": "1808-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                41.98333,
        45.05
            )
        ,
        "id": "23717",
        "mass": "1500",
        "name": "Stavropol",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "45.050000",
        "reclong": "41.983330",
        "year": "1857-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                3,
        50.76667
            )
        ,
        "id": "23099",
        "mass": "4960",
        "name": "Ste. Marguerite",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "50.766670",
        "reclong": "3.000000",
        "year": "1962-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                55.98333,
        53.66667
            )
        ,
        "id": "23724",
        "mass": "325000",
        "name": "Sterlitamak",
        "nametype": "Valid",
        "recclass": "Iron, IIIAB",
        "reclat": "53.666670",
        "reclong": "55.983330",
        "year": "1990-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                9.05,
        52.53333
            )
        ,
        "id": "23726",
        "name": "Stolzenau",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "52.533330",
        "reclong": "9.050000",
        "year": "1647-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "24",
        ":@computed_region_nnqa_25f4": "1040",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -73.13333,
        41.2
            )
        ,
        "id": "23728",
        "mass": "50",
        "name": "Stratford",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "41.200000",
        "reclong": "-73.133330",
        "year": "1974-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -3.25,
        56.58333
            )
        ,
        "id": "23729",
        "mass": "13400",
        "name": "Strathmore",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "56.583330",
        "reclong": "-3.250000",
        "year": "1917-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -3.95,
        50.38333
            )
        ,
        "id": "23732",
        "mass": "10400",
        "name": "Stretchleigh",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "50.383330",
        "reclong": "-3.950000",
        "year": "1623-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -72.97806,
        45.96861
            )
        ,
        "id": "23733",
        "mass": "25400",
        "name": "St-Robert",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "45.968610",
        "reclong": "-72.978060",
        "year": "1994-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "15",
        ":@computed_region_nnqa_25f4": "955",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -90.66667,
        36.48333
            )
        ,
        "id": "23736",
        "mass": "3500",
        "name": "Success",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "36.483330",
        "reclong": "-90.666670",
        "year": "1924-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                16.26333,
        50.53806
            )
        ,
        "id": "23737",
        "mass": "815.3",
        "name": "Suchy Dul",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "50.538060",
        "reclong": "16.263330",
        "year": "1969-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                113.46667,
        31.61667
            )
        ,
        "id": "23738",
        "mass": "260000",
        "name": "Suizhou",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "31.616670",
        "reclong": "113.466670",
        "year": "1986-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                78.03333,
        12.66667
            )
        ,
        "id": "48951",
        "mass": "110000",
        "name": "Sulagiri",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "12.666670",
        "reclong": "78.033330",
        "year": "2008-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                84.28333,
        25.93333
            )
        ,
        "id": "23741",
        "mass": "1710.5",
        "name": "Sultanpur",
        "nametype": "Valid",
        "recclass": "L/LL6",
        "reclat": "25.933330",
        "reclong": "84.283330",
        "year": "1916-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                133.16667,
        44.86667
            )
        ,
        "id": "23745",
        "mass": "637",
        "name": "Sungach",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "44.866670",
        "reclong": "133.166670",
        "year": "1935-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                84.21667,
        26.71667
            )
        ,
        "id": "23760",
        "mass": "7235",
        "name": "Supuhee",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "26.716670",
        "reclong": "84.216670",
        "year": "1865-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "8",
        ":@computed_region_nnqa_25f4": "1187",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -120.90806,
        38.80389
            )
        ,
        "id": "55529",
        "mass": "992.5",
        "name": "Sutter's Mill",
        "nametype": "Valid",
        "recclass": "C",
        "reclat": "38.803890",
        "reclong": "-120.908060",
        "year": "2012-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "29",
        ":@computed_region_nnqa_25f4": "1637",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -86.2945,
        33.18836
            )
        ,
        "id": "23773",
        "mass": "5560",
        "name": "Sylacauga",
        "nametype": "Valid",
        "recclass": "H4",
        "reclat": "33.188360",
        "reclong": "-86.294500",
        "year": "1954-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                14.65,
        49.4
            )
        ,
        "id": "23776",
        "mass": "7540",
        "name": "Tabor",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "49.400000",
        "reclong": "14.650000",
        "year": "1753-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                5.41667,
        36.18333
            )
        ,
        "id": "23778",
        "mass": "9000",
        "name": "Tadjera",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "36.183330",
        "reclong": "5.416670",
        "year": "1867-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -134.20139,
        59.70444
            )
        ,
        "id": "23782",
        "mass": "10000",
        "name": "Tagish Lake",
        "nametype": "Valid",
        "recclass": "C2-ung",
        "reclat": "59.704440",
        "reclong": "-134.201390",
        "year": "2000-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                137.305,
        34.72
            )
        ,
        "id": "23784",
        "mass": "1000",
        "name": "Tahara",
        "nametype": "Valid",
        "recclass": "H4/5",
        "reclat": "34.720000",
        "reclong": "137.305000",
        "year": "1991-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                134.9,
        35.38333
            )
        ,
        "id": "23789",
        "mass": "720",
        "name": "Takenouchi",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "35.383330",
        "reclong": "134.900000",
        "year": "1880-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "id": "23791",
        "mass": "1421",
        "name": "Talampaya",
        "nametype": "Valid",
        "recclass": "Eucrite-cm",
        "year": "1995-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                112.76667,
        -7.75
            )
        ,
        "id": "23795",
        "mass": "10500",
        "name": "Tambakwatu",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-7.750000",
        "reclong": "112.766670",
        "year": "1975-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -7.015,
        31.16333
            )
        ,
        "id": "48691",
        "mass": "100000",
        "name": "Tamdakht",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "31.163330",
        "reclong": "-7.015000",
        "year": "2008-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                136.23333,
        35.43333
            )
        ,
        "id": "23801",
        "mass": "905",
        "name": "Tané",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "35.433330",
        "reclong": "136.233330",
        "year": "1918-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                122.9,
        45.4
            )
        ,
        "id": "23873",
        "mass": "3850",
        "name": "Taonan",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "45.400000",
        "reclong": "122.900000",
        "year": "1965-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                10.41667,
        32.95
            )
        ,
        "id": "23884",
        "mass": "12000",
        "name": "Tatahouine",
        "nametype": "Valid",
        "recclass": "Diogenite",
        "reclat": "32.950000",
        "reclong": "10.416670",
        "year": "1931-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                43.73333,
        19.38333
            )
        ,
        "id": "23885",
        "mass": "2500",
        "name": "Tathlith",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "19.383330",
        "reclong": "43.733330",
        "year": "1967-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                44.45,
        35.13333
            )
        ,
        "id": "23887",
        "mass": "6000",
        "name": "Tauk",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "35.133330",
        "reclong": "44.450000",
        "year": "1929-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                23.5,
        46.71667
            )
        ,
        "id": "23888",
        "mass": "21000",
        "name": "Tauti",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "46.716670",
        "reclong": "23.500000",
        "year": "1937-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                142.95,
        -25.73333
            )
        ,
        "id": "23897",
        "mass": "160000",
        "name": "Tenham",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-25.733330",
        "reclong": "142.950000",
        "year": "1879-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                26.95,
        58.03333
            )
        ,
        "id": "23898",
        "mass": "28500",
        "name": "Tennasilm",
        "nametype": "Valid",
        "recclass": "L4",
        "reclat": "58.033330",
        "reclong": "26.950000",
        "year": "1872-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                70.6,
        33.4
            )
        ,
        "id": "23908",
        "mass": "342",
        "name": "Thal",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "33.400000",
        "reclong": "70.600000",
        "year": "1950-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                37.15028,
        -1.00278
            )
        ,
        "id": "54493",
        "mass": "14200",
        "name": "Thika",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-1.002780",
        "reclong": "37.150280",
        "year": "2011-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                27.58333,
        -29.33333
            )
        ,
        "id": "23976",
        "mass": "45300",
        "name": "Thuathe",
        "nametype": "Valid",
        "recclass": "H4/5",
        "reclat": "-29.333330",
        "reclong": "27.583330",
        "year": "2002-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                118.99,
        32.94667
            )
        ,
        "id": "23984",
        "mass": "2232",
        "name": "Tianzhang",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "32.946670",
        "reclong": "118.990000",
        "year": "1986-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                17.11667,
        49.6
            )
        ,
        "id": "23989",
        "mass": "28000",
        "name": "Tieschitz",
        "nametype": "Valid",
        "recclass": "H/L3.6",
        "reclat": "49.600000",
        "reclong": "17.116670",
        "year": "1878-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        ":@computed_region_cbhk_fwbd": "34",
        ":@computed_region_nnqa_25f4": "1762",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -89.68333,
        38.2
            )
        ,
        "id": "23998",
        "mass": "74800",
        "name": "Tilden",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "38.200000",
        "reclong": "-89.683330",
        "year": "1927-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                1.53333,
        14.25
            )
        ,
        "id": "23999",
        "mass": "3000",
        "name": "Tillaberi",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "14.250000",
        "reclong": "1.533330",
        "year": "1970-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                35.2,
        54.5
            )
        ,
        "id": "24004",
        "mass": "65500",
        "name": "Timochin",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "54.500000",
        "reclong": "35.200000",
        "year": "1807-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                79.41667,
        13.63333
            )
        ,
        "id": "24009",
        "mass": "230",
        "name": "Tirupati",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "13.633330",
        "reclong": "79.416670",
        "year": "1934-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                -7.61123,
        29.48195
            )
        ,
        "id": "54823",
        "mass": "7000",
        "name": "Tissint",
        "nametype": "Valid",
        "recclass": "Martian st_make_point(shergottite)",
        "reclat": "29.481950",
        "reclong": "-7.611230",
        "year": "2011-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                111.53333,
        -7.08333
            )
        ,
        "id": "24011",
        "mass": "20000",
        "name": "Tjabe",
        "nametype": "Valid",
        "recclass": "H6",
        "reclat": "-7.083330",
        "reclong": "111.533330",
        "year": "1869-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                106.58333,
        -6.66667
            )
        ,
        "id": "24012",
        "mass": "16500",
        "name": "Tjerebon",
        "nametype": "Valid",
        "recclass": "L5",
        "reclat": "-6.666670",
        "reclong": "106.583330",
        "year": "1922-01-01T00:00:00.000"
    },
    {
        "created_at": "2019-01-27T09:30:28.334+0100",
        "fall": "Fell",
        "geolocation": 
            
            st_make_point(
                34.76667,
        47.85
            )
        ,
        "id": "24019",
        "mass": "600",
        "name": "Tomakovka",
        "nametype": "Valid",
        "recclass": "LL6",
        "reclat": "47.850000",
        "reclong": "34.766670",
        "year": "1905-01-01T00:00:00.000"
    }
]
);

EOF

# #[ -f ./script/meteorites.adm.gz ] || { echo "Downloading the data...";  ./script/getSampleMeteoritesFromGDrive.sh; }

# echo "Start ingestion ..." 
# gunzip -c ./meteorites.adm.gz | ./fileFeed.sh 127.0.0.1 10001
# echo "Ingested sample meteorites."

# cat <<'EOF' | curl -XPOST --data-binary @- $host
# use meteorites; 
# stop feed MeteoFeed; 
# drop feed MeteoFeed; 
# EOF
