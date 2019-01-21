set -o nounset   # Treat unset variables as an error

# ddl to register the meteorites dataset
host=${1:-'http://localhost:19002/query/service'}
nc=${2:-"asterix_nc1"}
cat <<EOF | curl -XPOST --data-binary @- $host 
create dataverse meteorites if not exists;
use meteorites;

create type meteo if not exists as open {
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -8.25,
        38.01667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                13.35,
        43.26667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                1.9625,
        43.39056
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                1.58333,
        47.63333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                27.35,
        -15.96667
            ),
        "id": "16733",
        "name": "Monze",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "-15.966670",
        "reclong": "27.350000",
        "year": "1950-01-01T00:00:00.000"
    },
    {
        ":@computed_region_cbhk_fwbd": "37",
        ":@computed_region_nnqa_25f4": "2431",
        "fall": "Fell",
        "geolocation": st_make_point(
                -79.38333,
        35.41667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -8.33333,
        52.45
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                145.6,
        -40.975
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                78.83333,
        28.78333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                18.53333,
        49.6
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                5.13333,
        44.6
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                10.7,
        59.43333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                77.33333,
        26.83333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                8.5,
        45.2
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                141.7,
        -29.8
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                4.8,
        18.7
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                6.86667,
        44.08333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                33.5,
        -11.5
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                77.01667,
        12.63333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                80.83333,
        9.33333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                90.21667,
        24.5
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                145.2,
        -36.61667
            ),
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
        ":@computed_region_cbhk_fwbd": "36",
        ":@computed_region_nnqa_25f4": "237",
        "fall": "Fell",
        "geolocation": st_make_point(
                -88.1,
        36.6
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                85.53333,
        26.13333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                72.63333,
        23.05
            ),
        "id": "16887",
        "name": "Myhee Caunta",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "23.050000",
        "reclong": "72.633330",
        "year": "1842-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                1,
        12
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                140.06167,
        38.12167
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                78.21667,
        26.98333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                19.5,
        49.16667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                30.35,
        31.31667
            ),
        "id": "16898",
        "mass": "10000",
        "name": "Nakhla",
        "nametype": "Valid",
        "recclass": "Martian st_make_point(nakhlite),",
        "reclat": "31.316670",
        "reclong": "30.350000",
        "year": "1911-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                100.08333,
        13.73333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                79.2,
        12.28333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                103.5,
        35.66667
            ),
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
        ":@computed_region_cbhk_fwbd": "45",
        ":@computed_region_nnqa_25f4": "419",
        "fall": "Fell",
        "geolocation": st_make_point(
                -77.16667,
        38.41667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                121.8,
        32.11667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                77,
        19.25
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                51.5,
        33.75
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                150.68889,
        -34.05
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                12.51667,
        42.51667
            ),
        "id": "16914",
        "name": "Narni",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "42.516670",
        "reclong": "12.516670",
        "year": "0921-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                165.9,
        -21.73333
            ),
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
        "fall": "Fell",
        "id": "16923",
        "mass": "1.4",
        "name": "Natal",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "year": "1973-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                83.66667,
        21.25
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                136.46528,
        36.44917
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                83.48333,
        18.68333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                35.33333,
        9.5
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                21.5,
        56.5
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                10.80833,
        47.525
            ),
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
        ":@computed_region_cbhk_fwbd": "38",
        ":@computed_region_nnqa_25f4": "2615",
        "fall": "Fell",
        "geolocation": st_make_point(
                -81.76667,
        40
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                35.68333,
        15.36667
            ),
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
        ":@computed_region_cbhk_fwbd": "22",
        ":@computed_region_nnqa_25f4": "1667",
        "fall": "Fell",
        "geolocation": st_make_point(
                -90.10976,
        29.94718
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                111.41667,
        -7.45
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -4.38333,
        13.85
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -1.43333,
        49.03333
            ),
        "id": "16970",
        "name": "Nicorps",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "49.033330",
        "reclong": "-1.433330",
        "year": "1750-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "id": "16974",
        "mass": "3.3",
        "name": "Niger st_make_point(L6),",
        "nametype": "Valid",
        "recclass": "L6",
        "year": "1967-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "id": "16975",
        "mass": "3.3",
        "name": "Niger st_make_point(LL6),",
        "nametype": "Valid",
        "recclass": "LL6",
        "year": "1967-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                78.63333,
        52.45
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                37.33333,
        56.11667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                121.48333,
        29.86667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                105.90667,
        32.925
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                131.56667,
        34.2
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                30.7,
        -28.56667
            ),
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
        ":@computed_region_cbhk_fwbd": "49",
        ":@computed_region_nnqa_25f4": "1683",
        "fall": "Fell",
        "geolocation": st_make_point(
                -69.48333,
        44.08333
            ),
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
        ":@computed_region_cbhk_fwbd": "35",
        ":@computed_region_nnqa_25f4": "2238",
        "fall": "Fell",
        "geolocation": st_make_point(
                -86.055,
        40.08528
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                130.75,
        33.725
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -59.83333,
        -32.36667
            ),
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
        ":@computed_region_cbhk_fwbd": "15",
        ":@computed_region_nnqa_25f4": "10",
        "fall": "Fell",
        "geolocation": st_make_point(
                -92.26667,
        36.21667
            ),
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
        ":@computed_region_cbhk_fwbd": "17",
        ":@computed_region_nnqa_25f4": "1252",
        "fall": "Fell",
        "geolocation": st_make_point(
                -99.86667,
        39.68333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                11.52722,
        45.29167
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                46,
        54.81667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                31.33333,
        58.55
            ),
        "id": "17934",
        "name": "Novy-Ergi",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "58.550000",
        "reclong": "31.333330",
        "year": "1662-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                22,
        56
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                102.46667,
        42.91667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -102.13333,
        24.3
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                0.75,
        41.63333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                141.86667,
        43.33333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                94.91667,
        21.20833
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                22.025,
        47.55
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                55.26667,
        57.78333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                8.05,
        52.28333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                23,
        58.5
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                22.03333,
        47.88333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                130.2,
        33.28333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                23.58333,
        46.06667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                8.5,
        6.75
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -5.4,
        38.18333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                139.21667,
        36.18333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                135.2,
        35.08333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                25.5,
        50.83333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                8.16667,
        52.95
            ),
        "id": "18009",
        "mass": "16570",
        "name": "Oldenburg st_make_point(1930),",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "52.950000",
        "reclong": "8.166670",
        "year": "1930-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                -0.03333,
        39
            ),
        "id": "18012",
        "name": "Oliva-Gandia",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "39.000000",
        "reclong": "-0.033330",
        "year": "1520-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                -7.06667,
        38.71667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -2.1,
        39.56667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                161.80833,
        64.02
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                1.38333,
        43.88333
            ),
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
        ":@computed_region_cbhk_fwbd": "30",
        ":@computed_region_nnqa_25f4": "1078",
        "fall": "Fell",
        "geolocation": st_make_point(
                -81.36222,
        28.5475
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                6.15,
        47.11667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                8,
        48.5
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                12.93333,
        42.13333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                9.4,
        58.88333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                140.35,
        38.4
            ),
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
        ":@computed_region_cbhk_fwbd": "17",
        ":@computed_region_nnqa_25f4": "1947",
        "fall": "Fell",
        "geolocation": st_make_point(
                -95.21667,
        38.6
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                0.08,
        12.9
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -6.57717,
        30.18
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -13.1,
        24.3
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -8.28,
        37.60833
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                16,
        -18
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -5.86667,
        43.4
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                28.83333,
        51.33333
            ),
        "id": "18062",
        "name": "Owrucz",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "51.333330",
        "reclong": "28.833330",
        "year": "1775-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                -99.3,
        21.05
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                25,
        55.66667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                120.45583,
        17.74333
            ),
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
        ":@computed_region_cbhk_fwbd": "32",
        ":@computed_region_nnqa_25f4": "503",
        "fall": "Fell",
        "geolocation": st_make_point(
                -89.71667,
        32.31667
            ),
        "id": "18073",
        "name": "Palahatchie",
        "nametype": "Valid",
        "recclass": "OC",
        "reclat": "32.316670",
        "reclong": "-89.716670",
        "year": "1910-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                -65.1,
        -23.11667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                118.61667,
        43.48333
            ),
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
        ":@computed_region_cbhk_fwbd": "18",
        ":@computed_region_nnqa_25f4": "2122",
        "fall": "Fell",
        "geolocation": st_make_point(
                -91.5,
        39.8
            ),
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
        ":@computed_region_cbhk_fwbd": "4",
        ":@computed_region_nnqa_25f4": "1657",
        "fall": "Fell",
        "geolocation": st_make_point(
                -157.78333,
        21.3
            ),
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
        "fall": "Found",
        "id": "32591",
        "mass": "69.5",
        "name": "Dominion Range 03239",
        "nametype": "Valid",
        "recclass": "L6",
        "year": "2002-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                120.7,
        15.08333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                124.28333,
        8.06667
            ),
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
        ":@computed_region_cbhk_fwbd": "15",
        ":@computed_region_nnqa_25f4": "1023",
        "fall": "Fell",
        "geolocation": st_make_point(
                -90.5,
        36.06667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -40.7,
        -6.23333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -51.66667,
        -19.13333
            ),
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
        ":@computed_region_cbhk_fwbd": "34",
        ":@computed_region_nnqa_25f4": "1863",
        "fall": "Fell",
        "geolocation": st_make_point(
                -87.67917,
        41.48472
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                78.35,
        9.23333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                85.4,
        26.2
            ),
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
        ":@computed_region_cbhk_fwbd": "11",
        ":@computed_region_nnqa_25f4": "1994",
        "fall": "Fell",
        "geolocation": st_make_point(
                -103.4,
        36.21667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                82.05,
        20.93694
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -48.56667,
        -19.53333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                14.96667,
        38.13333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                91.18333,
        23.15
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                25.51667,
        43.46667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                77.03333,
        52.3
            ),
        "id": "18175",
        "mass": "142.5",
        "name": "Pavlodar st_make_point(stone),",
        "nametype": "Valid",
        "recclass": "H5",
        "reclat": "52.300000",
        "reclong": "77.033330",
        "year": "1938-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                35.98333,
        48.53333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                43,
        52.03333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -3.54217,
        11.33367
            ),
        "id": "18179",
        "name": "Pê",
        "nametype": "Valid",
        "recclass": "L6",
        "reclat": "11.333670",
        "reclong": "-3.542170",
        "year": "1989-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                -117.93333,
        56.13333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                9.25,
        51.66667
            ),
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
        ":@computed_region_cbhk_fwbd": "47",
        ":@computed_region_nnqa_25f4": "2185",
        "fall": "Fell",
        "geolocation": st_make_point(
                -73.91667,
        41.28333
            ),
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
        ":@computed_region_cbhk_fwbd": "23",
        ":@computed_region_nnqa_25f4": "3062",
        "fall": "Fell",
        "geolocation": st_make_point(
                -103.11667,
        30.125
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                35.5,
        -10.66667
            ),
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
        ":@computed_region_cbhk_fwbd": "47",
        ":@computed_region_nnqa_25f4": "2142",
        "fall": "Fell",
        "geolocation": st_make_point(
                -73.95028,
        42.86083
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                10.46667,
        48.11667
            ),
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
        ":@computed_region_cbhk_fwbd": "49",
        ":@computed_region_nnqa_25f4": "1727",
        "fall": "Fell",
        "geolocation": st_make_point(
                -69.2,
        44.36667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                27.13333,
        38.3
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                84.78333,
        26.75
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                107.33333,
        -7.23333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                4.98333,
        22.83333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                79,
        22.25
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -0.05,
        41.71667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                140.51167,
        39.43833
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                79.50083,
        21.68389
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                23.56667,
        41.05
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -36.76667,
        -8.38333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -44.21667,
        -19.46667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -6,
        37.41667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                36.6,
        50.61667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                10.71667,
        34.75
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                87.3,
        23.1
            ),
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
        ":@computed_region_cbhk_fwbd": "40",
        ":@computed_region_nnqa_25f4": "921",
        "fall": "Fell",
        "geolocation": st_make_point(
                -76.7,
        37.83333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -80.16667,
        44.05
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                84.83333,
        24.55
            ),
        "id": "23530",
        "mass": "5000",
        "name": "Shergotty",
        "nametype": "Valid",
        "recclass": "Martian st_make_point(shergottite),",
        "reclat": "24.550000",
        "reclong": "84.833330",
        "year": "1865-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                120.06667,
        33.65
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                87.5775,
        25.85
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                125.66667,
        43.5
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                74.83333,
        33.71667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                90.16667,
        24.33333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                11.6,
        43.11667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                134.65333,
        46.16
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -101.38333,
        20.93333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                27.26667,
        44.11667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                7.53333,
        49.98333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                32.48333,
        30.9
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                69.55,
        26.21667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                9.2,
        39.3
            ),
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
        ":@computed_region_cbhk_fwbd": "19",
        ":@computed_region_nnqa_25f4": "2351",
        "fall": "Fell",
        "geolocation": st_make_point(
                -103.66667,
        42.58333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                82.58333,
        20.91667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                36.13583,
        39.82467
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                119.86667,
        32.43333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                10.86667,
        59.73333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                15.6,
        45.68333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                35,
        55
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                84.06667,
        27.13333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                21.86667,
        43.66667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                1.73333,
        47.36667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                22.005,
        54.00883
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                135.33333,
        35.16667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                125,
        45.25
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                23.5,
        44.41667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                33.63333,
        1.7
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                0.05,
        44.75
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -1.5,
        46.95
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                3.75,
        51.05
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -1.15,
        48.01667
            ),
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
        ":@computed_region_cbhk_fwbd": "18",
        ":@computed_region_nnqa_25f4": "2223",
        "fall": "Fell",
        "geolocation": st_make_point(
                -90.23333,
        38.7
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                27.41667,
        -32.01667
            ),
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
        ":@computed_region_cbhk_fwbd": "45",
        ":@computed_region_nnqa_25f4": "424",
        "fall": "Fell",
        "geolocation": st_make_point(
                -76.38333,
        38.16667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                3.93333,
        48.45
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                27.2,
        61.65
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                2.95,
        43.43333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                14.95,
        59.93333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                15.56667,
        49.28333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                41.98333,
        45.05
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                3,
        50.76667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                55.98333,
        53.66667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                9.05,
        52.53333
            ),
        "id": "23726",
        "name": "Stolzenau",
        "nametype": "Valid",
        "recclass": "Stone-uncl",
        "reclat": "52.533330",
        "reclong": "9.050000",
        "year": "1647-01-01T00:00:00.000"
    },
    {
        ":@computed_region_cbhk_fwbd": "24",
        ":@computed_region_nnqa_25f4": "1040",
        "fall": "Fell",
        "geolocation": st_make_point(
                -73.13333,
        41.2
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -3.25,
        56.58333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -3.95,
        50.38333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -72.97806,
        45.96861
            ),
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
        ":@computed_region_cbhk_fwbd": "15",
        ":@computed_region_nnqa_25f4": "955",
        "fall": "Fell",
        "geolocation": st_make_point(
                -90.66667,
        36.48333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                16.26333,
        50.53806
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                113.46667,
        31.61667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                78.03333,
        12.66667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                84.28333,
        25.93333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                133.16667,
        44.86667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                84.21667,
        26.71667
            ),
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
        ":@computed_region_cbhk_fwbd": "8",
        ":@computed_region_nnqa_25f4": "1187",
        "fall": "Fell",
        "geolocation": st_make_point(
                -120.90806,
        38.80389
            ),
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
        ":@computed_region_cbhk_fwbd": "29",
        ":@computed_region_nnqa_25f4": "1637",
        "fall": "Fell",
        "geolocation": st_make_point(
                -86.2945,
        33.18836
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                14.65,
        49.4
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                5.41667,
        36.18333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -134.20139,
        59.70444
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                137.305,
        34.72
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                134.9,
        35.38333
            ),
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
        "fall": "Fell",
        "id": "23791",
        "mass": "1421",
        "name": "Talampaya",
        "nametype": "Valid",
        "recclass": "Eucrite-cm",
        "year": "1995-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                112.76667,
        -7.75
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -7.015,
        31.16333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                136.23333,
        35.43333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                122.9,
        45.4
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                10.41667,
        32.95
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                43.73333,
        19.38333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                44.45,
        35.13333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                23.5,
        46.71667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                142.95,
        -25.73333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                26.95,
        58.03333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                70.6,
        33.4
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                37.15028,
        -1.00278
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                27.58333,
        -29.33333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                118.99,
        32.94667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                17.11667,
        49.6
            ),
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
        ":@computed_region_cbhk_fwbd": "34",
        ":@computed_region_nnqa_25f4": "1762",
        "fall": "Fell",
        "geolocation": st_make_point(
                -89.68333,
        38.2
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                1.53333,
        14.25
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                35.2,
        54.5
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                79.41667,
        13.63333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                -7.61123,
        29.48195
            ),
        "id": "54823",
        "mass": "7000",
        "name": "Tissint",
        "nametype": "Valid",
        "recclass": "Martian st_make_point(shergottite),",
        "reclat": "29.481950",
        "reclong": "-7.611230",
        "year": "2011-01-01T00:00:00.000"
    },
    {
        "fall": "Fell",
        "geolocation": st_make_point(
                111.53333,
        -7.08333
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                106.58333,
        -6.66667
            ),
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
        "fall": "Fell",
        "geolocation": st_make_point(
                34.76667,
        47.85
            ),
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