--
-- PostgreSQL database dump
--



-- Dumped from database version 17.7
-- Dumped by pg_dump version 17.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET search_path = public;
--SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_updated_at_column() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: citas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.citas (
    id integer NOT NULL,
    id_cita_publico character varying(50),
    nombre_contacto character varying(100),
    telefono_contacto character varying(20),
    email_contacto character varying(100),
    fecha date NOT NULL,
    hora_inicio time without time zone NOT NULL,
    motivo text DEFAULT 'Visita Web'::text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    hora_fin time without time zone,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.citas OWNER TO postgres;

--
-- Name: citas2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.citas2 (
    id integer NOT NULL,
    cliente_nombre text NOT NULL,
    cliente_correo text NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    propiedad_id integer,
    estado text DEFAULT 'programada'::text
);


ALTER TABLE public.citas2 OWNER TO postgres;

--
-- Name: citas2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.citas2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.citas2_id_seq OWNER TO postgres;

--
-- Name: citas2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.citas2_id_seq OWNED BY public.citas2.id;


--
-- Name: citas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.citas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.citas_id_seq OWNER TO postgres;

--
-- Name: citas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.citas_id_seq OWNED BY public.citas.id;


--
-- Name: historias_exito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historias_exito (
    id integer NOT NULL,
    nombre_cliente character varying(100) NOT NULL,
    titulo_historia character varying(150),
    servicio_realizado character varying(50),
    testimonio text NOT NULL,
    valoracion integer DEFAULT 5,
    foto_url character varying(255),
    estado character varying(20) DEFAULT 'pendiente'::character varying,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.historias_exito OWNER TO postgres;

--
-- Name: historias_exito_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historias_exito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historias_exito_id_seq OWNER TO postgres;

--
-- Name: historias_exito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historias_exito_id_seq OWNED BY public.historias_exito.id;


--
-- Name: lead_documentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lead_documentos (
    id integer NOT NULL,
    lead_id integer,
    tipo_documento character varying(100),
    nombre_archivo character varying(255),
    url_archivo text,
    fecha_subida timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.lead_documentos OWNER TO postgres;

--
-- Name: lead_documentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lead_documentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lead_documentos_id_seq OWNER TO postgres;

--
-- Name: lead_documentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lead_documentos_id_seq OWNED BY public.lead_documentos.id;


--
-- Name: leads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leads (
    id integer NOT NULL,
    nombre_completo character varying(100),
    telefono character varying(20),
    email character varying(100),
    origen character varying(50),
    interes character varying(255),
    comuna character varying(50),
    estado character varying(20) DEFAULT 'NUEVO'::character varying,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.leads OWNER TO postgres;

--
-- Name: leads2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leads2 (
    id integer NOT NULL,
    nombre_completo character varying(100) NOT NULL,
    telefono character varying(20),
    email character varying(100),
    comuna character varying(50),
    consumo_mensual character varying(50),
    origen character varying(50) DEFAULT 'Manual'::character varying,
    estado character varying(20) DEFAULT 'NUEVO'::character varying,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.leads2 OWNER TO postgres;

--
-- Name: leads2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.leads2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.leads2_id_seq OWNER TO postgres;

--
-- Name: leads2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.leads2_id_seq OWNED BY public.leads2.id;


--
-- Name: leads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.leads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.leads_id_seq OWNER TO postgres;

--
-- Name: leads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.leads_id_seq OWNED BY public.leads.id;


--
-- Name: mensajes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mensajes (
    id integer NOT NULL,
    nombre character varying(100),
    email character varying(100),
    telefono character varying(20),
    mensaje text,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.mensajes OWNER TO postgres;

--
-- Name: mensajes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mensajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mensajes_id_seq OWNER TO postgres;

--
-- Name: mensajes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mensajes_id_seq OWNED BY public.mensajes.id;


--
-- Name: propiedad_bitacora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propiedad_bitacora (
    id integer NOT NULL,
    propiedad_id integer,
    usuario character varying(150) DEFAULT 'Sistema'::character varying,
    accion character varying(50),
    detalle text,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.propiedad_bitacora OWNER TO postgres;

--
-- Name: propiedad_bitacora_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.propiedad_bitacora_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.propiedad_bitacora_id_seq OWNER TO postgres;

--
-- Name: propiedad_bitacora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.propiedad_bitacora_id_seq OWNED BY public.propiedad_bitacora.id;


--
-- Name: propiedad_documentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propiedad_documentos (
    id integer NOT NULL,
    propiedad_id integer,
    tipo_documento character varying(100),
    nombre_archivo character varying(255),
    url_archivo text NOT NULL,
    fecha_subida timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    estado character varying(50) DEFAULT 'Vigente'::character varying
);


ALTER TABLE public.propiedad_documentos OWNER TO postgres;

--
-- Name: propiedad_documentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.propiedad_documentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.propiedad_documentos_id_seq OWNER TO postgres;

--
-- Name: propiedad_documentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.propiedad_documentos_id_seq OWNED BY public.propiedad_documentos.id;


--
-- Name: propiedad_imagenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propiedad_imagenes (
    id integer NOT NULL,
    propiedad_id integer,
    url_imagen text NOT NULL,
    es_portada boolean DEFAULT false,
    fecha_subida timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.propiedad_imagenes OWNER TO postgres;

--
-- Name: propiedad_imagenes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.propiedad_imagenes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.propiedad_imagenes_id_seq OWNER TO postgres;

--
-- Name: propiedad_imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.propiedad_imagenes_id_seq OWNED BY public.propiedad_imagenes.id;


--
-- Name: propiedad_informes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propiedad_informes (
    id integer NOT NULL,
    propiedad_id integer,
    titulo character varying(255),
    fecha_generacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    estado character varying(50) DEFAULT 'Pendiente'::character varying,
    configuracion jsonb
);


ALTER TABLE public.propiedad_informes OWNER TO postgres;

--
-- Name: propiedad_informes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.propiedad_informes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.propiedad_informes_id_seq OWNER TO postgres;

--
-- Name: propiedad_informes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.propiedad_informes_id_seq OWNED BY public.propiedad_informes.id;


--
-- Name: propiedades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propiedades (
    id integer NOT NULL,
    titulo character varying(200) NOT NULL,
    descripcion text,
    tipo_operacion character varying(50) NOT NULL,
    tipo_propiedad character varying(50) DEFAULT 'Casa'::character varying,
    precio numeric(12,0) DEFAULT 0,
    moneda character varying(10) DEFAULT 'UF'::character varying,
    gastos_comunes numeric(10,0) DEFAULT 0,
    dormitorios integer DEFAULT 0,
    banos integer DEFAULT 0,
    m2_utiles integer DEFAULT 0,
    m2_totales integer DEFAULT 0,
    comuna character varying(100),
    direccion character varying(200),
    imagen_url text,
    active boolean DEFAULT true,
    fecha_publicacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    estacionamientos integer DEFAULT 0,
    piscina boolean DEFAULT false,
    ascensor boolean DEFAULT false,
    quincho boolean DEFAULT false,
    estado character varying(20) DEFAULT 'Activa'::character varying,
    galeria jsonb DEFAULT '[]'::jsonb,
    CONSTRAINT check_estado CHECK (((estado)::text = ANY ((ARRAY['Activa'::character varying, 'Pausada'::character varying, 'Finalizada'::character varying])::text[])))
);


ALTER TABLE public.propiedades OWNER TO postgres;

--
-- Name: propiedades2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propiedades2 (
    id integer NOT NULL,
    propietario_id integer,
    tipo_propiedad character varying(50),
    rol_sii character varying(50),
    exclusividad boolean,
    operacion_venta boolean,
    precio_venta numeric,
    moneda_venta character varying(10),
    operacion_arriendo boolean,
    precio_arriendo numeric,
    moneda_arriendo character varying(10),
    gastos_comunes numeric,
    contribuciones numeric,
    canje boolean,
    region character varying(100),
    comuna character varying(100),
    sector character varying(100),
    direccion_calle character varying(200),
    direccion_numero character varying(50),
    direccion_unidad character varying(50),
    dormitorios integer,
    banos integer,
    suites integer,
    superficie_util numeric,
    superficie_total numeric,
    estacionamientos integer,
    bodegas integer,
    detalles_json jsonb,
    titulo_publicacion character varying(255),
    descripcion_publica text,
    observaciones_internas text,
    forma_visita text,
    estado_publicacion character varying(50) DEFAULT 'BORRADOR'::character varying,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    imagen_principal text,
    ejecutivo_asignado character varying(150),
    publicar_internet boolean DEFAULT true,
    es_destacada boolean DEFAULT false,
    es_vendida boolean DEFAULT false,
    es_arrendada boolean DEFAULT false,
    portales_json jsonb DEFAULT '{}'::jsonb,
    fecha_publicacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_venta timestamp without time zone
);


ALTER TABLE public.propiedades2 OWNER TO postgres;

--
-- Name: propiedades2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.propiedades2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.propiedades2_id_seq OWNER TO postgres;

--
-- Name: propiedades2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.propiedades2_id_seq OWNED BY public.propiedades2.id;


--
-- Name: propiedades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.propiedades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.propiedades_id_seq OWNER TO postgres;

--
-- Name: propiedades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.propiedades_id_seq OWNED BY public.propiedades.id;


--
-- Name: propietarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propietarios (
    id integer NOT NULL,
    rut character varying(20) NOT NULL,
    nombre_completo character varying(255),
    email character varying(150),
    telefono character varying(50),
    tipo_documento character varying(20),
    es_activo boolean DEFAULT true,
    rating integer,
    comentarios text,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.propietarios OWNER TO postgres;

--
-- Name: propietarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.propietarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.propietarios_id_seq OWNER TO postgres;

--
-- Name: propietarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.propietarios_id_seq OWNED BY public.propietarios.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre_completo character varying(100),
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(100),
    telefono character varying(20),
    rol character varying(20) DEFAULT 'cliente'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    temp_password_hash character varying(255) DEFAULT NULL::character varying,
    temp_password_expires timestamp without time zone
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: visitas_web; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visitas_web (
    id integer NOT NULL,
    fecha date DEFAULT CURRENT_DATE,
    contador integer DEFAULT 1
);


ALTER TABLE public.visitas_web OWNER TO postgres;

--
-- Name: visitas_web_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visitas_web_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.visitas_web_id_seq OWNER TO postgres;

--
-- Name: visitas_web_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visitas_web_id_seq OWNED BY public.visitas_web.id;


--
-- Name: citas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas ALTER COLUMN id SET DEFAULT nextval('public.citas_id_seq'::regclass);


--
-- Name: citas2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas2 ALTER COLUMN id SET DEFAULT nextval('public.citas2_id_seq'::regclass);


--
-- Name: historias_exito id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historias_exito ALTER COLUMN id SET DEFAULT nextval('public.historias_exito_id_seq'::regclass);


--
-- Name: lead_documentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lead_documentos ALTER COLUMN id SET DEFAULT nextval('public.lead_documentos_id_seq'::regclass);


--
-- Name: leads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leads ALTER COLUMN id SET DEFAULT nextval('public.leads_id_seq'::regclass);


--
-- Name: leads2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leads2 ALTER COLUMN id SET DEFAULT nextval('public.leads2_id_seq'::regclass);


--
-- Name: mensajes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajes ALTER COLUMN id SET DEFAULT nextval('public.mensajes_id_seq'::regclass);


--
-- Name: propiedad_bitacora id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedad_bitacora ALTER COLUMN id SET DEFAULT nextval('public.propiedad_bitacora_id_seq'::regclass);


--
-- Name: propiedad_documentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedad_documentos ALTER COLUMN id SET DEFAULT nextval('public.propiedad_documentos_id_seq'::regclass);


--
-- Name: propiedad_imagenes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedad_imagenes ALTER COLUMN id SET DEFAULT nextval('public.propiedad_imagenes_id_seq'::regclass);


--
-- Name: propiedad_informes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedad_informes ALTER COLUMN id SET DEFAULT nextval('public.propiedad_informes_id_seq'::regclass);


--
-- Name: propiedades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedades ALTER COLUMN id SET DEFAULT nextval('public.propiedades_id_seq'::regclass);


--
-- Name: propiedades2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedades2 ALTER COLUMN id SET DEFAULT nextval('public.propiedades2_id_seq'::regclass);


--
-- Name: propietarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propietarios ALTER COLUMN id SET DEFAULT nextval('public.propietarios_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Name: visitas_web id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitas_web ALTER COLUMN id SET DEFAULT nextval('public.visitas_web_id_seq'::regclass);


--
-- Data for Name: citas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('1', '4AR5M8', 'Cliente Postman', '+56911112222', 'test@postman.com', '2026-05-20', '10:00:00', 'Quiero ver la casa piloto', '2025-12-26 11:14:01.839518', '11:00:00', '2026-01-08 18:12:03.27744');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('3', '6E5WP1', 'Juan M├╝ller', '+ 56 9 5980 1912', 'ignacio.ojedaci@mayor.cl', '2026-02-11', '10:00:00', 'Inter├®s en: Loft Industrial en Santiago Centro', '2025-12-29 13:13:21.675849', '11:00:00', '2026-01-08 18:12:03.27744');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('8', 'DK32A0', 'Jennifer Korbee', '+56 9 5980 1912', 'ignacio.puchu2002@gmail.com', '2026-05-12', '13:00:00', 'Inter├®s en: Casa Familiar en La Reina', '2025-12-29 16:27:26.298881', '14:00:00', '2026-01-08 18:12:03.27744');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('10', 'N0MIK5', 'Camilo P├®rez', '+56 9 5980 1912', 'ignacio.puchu2002@gmail.com', '2026-01-13', '13:00:00', 'Inter├®s en: Casa Familiar en La Reina', '2025-12-29 17:23:41.458084', '14:00:00', '2026-01-08 18:12:03.27744');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('7', '57U2TT', 'Ernesto M├╝ller', '+56 9 5980 1912', 'ignacio.ojeda2002@gmail.com', '2027-03-10', '14:00:00', 'Inter├®s en: Oficina Habilitada en Providencia', '2025-12-29 15:30:36.26329', '15:00:00', '2026-01-08 18:12:03.27744');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('11', 'Z89MGJ', 'Camila Fischer', '+56 9 4011 4617', 'ignacio.ojeda2002@gmail.com', '2026-11-10', '17:00:00', 'Inter├®s en: Depto Nuevo Vista Despejada - Metro Chile Espa├▒a', '2025-12-29 18:44:45.370462', '18:00:00', '2026-01-08 18:12:03.27744');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('12', '8NA7G2', 'Juan P├®rez ', '+56 95980 1912', 'ignacio.ojeda2002@gmail.com', '2026-02-10', '13:00:00', 'Inter├®s en: GALPON', '2026-01-05 15:10:17.571897', '14:00:00', '2026-01-08 18:12:03.27744');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('14', 'VS5AXS', 'Juan M├║ller', '+56 9 5980 1912', 'ignacio.ojedaci@mayor.cl', '2026-02-11', '17:00:00', 'Inter├®s en: Casa Mediterr├ínea en Condominio Exclusivo', '2026-01-05 15:19:46.860265', '18:00:00', '2026-01-08 18:12:03.27744');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('13', 'CA8SBO', 'Juan P├®rez ', '+56 95980 1912', 'ignacio.ojeda2002@gmail.com', '2026-02-13', '17:00:00', 'Inter├®s en: GALPON', '2026-01-05 15:10:19.147307', '18:00:00', '2026-01-08 18:12:03.27744');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('15', 'F7XZXO', 'Mar├¡a P├®rez', '+56 9 5980 1912', 'ignacio.ojeda2002@gmail.com', '2028-01-10', '11:00:00', 'Inter├®s en: GALPON', '2026-01-08 11:06:13.889323', '12:00:00', '2026-01-08 18:12:03.27744');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('17', 'B2RV2R', 'Ignacio Ojeda', '+56959801912', 'ignacio.puchu2002@gmail.com', '2026-05-15', '10:00:00', 'Solicitado por Chatbot', '2026-01-08 17:45:25.882631', '11:00:00', '2026-01-08 18:12:03.27744');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('16', 'OE5UIM', 'Ignacio', '+56 9 5980 1912', 'ignacio.ojeda2002@gmail.com', '2027-01-25', '11:00:00', 'Inter├®s en: GALPON', '2026-01-08 11:14:36.492448', '12:00:00', '2026-01-08 18:12:03.27744');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('18', 'X0E90I', 'Ignacio', '+56 9 5980 1912', 'ignacio.ojedaci@mayor.cl', '2026-09-25', '12:00:00', 'Solicitado por Chatbot', '2026-01-09 09:42:20.878634', '13:00:00', '2026-01-09 09:42:20.878634');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('19', 'NNXTP8', 'Ignacio Ojeda', '+56959801912', 'ignacio.puchu2002@gmail.com', '2026-05-25', '11:00:00', 'Solicitado por Chatbot', '2026-01-09 12:13:43.570551', '12:00:00', '2026-01-09 12:13:43.570551');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('20', 'QN9SOT', 'Ignacio Ojeda', '+56959801912', 'ignacio.puchu2002@gmail.com', '2027-06-03', '12:30:00', 'Solicitado por Chatbot', '2026-01-09 12:27:43.993548', '13:30:00', '2026-01-09 12:27:43.993548');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('21', '9UIHPA', 'Ignacio Ojeda', '+56959801912', 'ignacio.puchu2002@gmail.com', '2027-06-10', '10:00:00', 'Solicitado por Chatbot', '2026-01-09 12:47:41.733921', '11:00:00', '2026-01-09 12:47:41.733921');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('22', 'C8ZEAN', 'Ignacio Ojeda', '+56959801912', 'ignacio.puchu2002@gmail.com', '2027-06-17', '12:00:00', 'Solicitado por Chatbot', '2026-01-09 12:51:52.30949', '13:00:00', '2026-01-09 12:51:52.30949');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('23', 'Y4TWFZ', 'Ignacio Ojeda', '+56 9 5980 1912', 'ignacio.puchu2002@gmail.com', '2027-06-24', '15:00:00', 'Solicitado por Chatbot', '2026-01-09 12:59:10.619713', '16:00:00', '2026-01-09 12:59:10.619713');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('24', '9NEKCM', 'Ignacio', '+56959801912', 'ignacio.puchu2002@gmail.com', '2027-07-01', '10:00:00', 'Solicitado por Chatbot', '2026-01-09 13:05:55.062872', '11:00:00', '2026-01-09 13:05:55.062872');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('25', 'CBKN2E', 'Ignacio', '999888777', 'ignacio.puchu2002@gmail.com', '2027-10-20', '15:00:00', 'Solicitado por Chatbot', '2026-01-09 13:19:40.291081', '16:00:00', '2026-01-09 13:19:40.291081');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('26', 'DRK3DW', 'Ignacio', '999888777', 'ignacio.puchu2002@gmail.com', '2028-10-20', '15:00:00', 'Solicitado por Chatbot', '2026-01-09 13:23:05.69929', '16:00:00', '2026-01-09 13:23:05.69929');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('27', 'I9LTU5', 'Ignacio', '999888777', 'ignacio.puchu2002@gmail.com', '2027-10-21', '15:00:00', 'Solicitado por Chatbot', '2026-01-09 13:28:25.735814', '16:00:00', '2026-01-09 13:28:25.735814');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('28', 'ZXO8AK', 'Ignacio', '999888777', 'ignacio.puchu2002@gmail.com', '2027-11-19', '15:00:00', 'Solicitado por Chatbot', '2026-01-09 15:28:03.131027', '16:00:00', '2026-01-09 15:28:03.131027');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('29', 'KM5UIV', 'Ignacio', '999888777', 'ignacio.puchu2002@gmail.com', '2027-11-26', '15:00:00', 'Solicitado por Chatbot', '2026-01-09 15:28:51.26836', '16:00:00', '2026-01-09 15:28:51.26836');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('30', '6H08PS', 'Ignacio', '999888777', 'ignacio.ojedaci@mayor.cl', '2027-01-29', '10:00:00', 'Solicitado por Chatbot', '2026-01-09 15:36:57.721313', '11:00:00', '2026-01-09 15:36:57.721313');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('31', 'X0MZMV', 'Ignacio', '999888777', 'ignacio.ojedaci@mayor.cl', '2027-02-05', '10:00:00', 'Solicitado por Chatbot', '2026-01-09 15:37:40.421386', '11:00:00', '2026-01-09 15:37:40.421386');
INSERT INTO public.citas (id, id_cita_publico, nombre_contacto, telefono_contacto, email_contacto, fecha, hora_inicio, motivo, created_at, hora_fin, updated_at) VALUES ('32', '8YR2B2', 'Ignacio', '999888777', 'ignacio.ojedaci@mayor.cl', '2027-02-12', '10:00:00', 'Solicitado por Chatbot', '2026-01-09 15:54:16.142173', '11:00:00', '2026-01-09 15:54:16.142173');


--
-- Data for Name: citas2; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.citas2 (id, cliente_nombre, cliente_correo, fecha, hora, propiedad_id, estado) VALUES ('1', 'Ignacio', 'ignacio.puchu2002@gmail.com', '2026-02-20', '16:00:00', NULL, 'programada');
INSERT INTO public.citas2 (id, cliente_nombre, cliente_correo, fecha, hora, propiedad_id, estado) VALUES ('3', 'Ignacio', 'ignacio.ojeda2002@icloud.com', '2026-06-01', '10:00:00', NULL, 'programada');


--
-- Data for Name: historias_exito; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.historias_exito (id, nombre_cliente, titulo_historia, servicio_realizado, testimonio, valoracion, foto_url, estado, fecha_creacion) VALUES ('1', 'Familia P├®rez Soto', 'Encontramos paz en Rinconada', 'Compra', 'Llev├íbamos meses buscando y nada nos convenc├¡a. Marlen entendi├│ que no busc├íbamos una casa, sino un cambio de vida.', '5', NULL, 'aprobado', '2026-02-11 16:02:42.483015');
INSERT INTO public.historias_exito (id, nombre_cliente, titulo_historia, servicio_realizado, testimonio, valoracion, foto_url, estado, fecha_creacion) VALUES ('2', 'Carlos M.', 'Gesti├│n r├ípida y transparente', 'Venta', 'Necesitaba vender mi parcela urgente por traslado laboral. El equipo se encarg├│ de todo el papeleo legal.', '5', NULL, 'aprobado', '2026-02-11 16:02:42.483015');


--
-- Data for Name: lead_documentos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.leads (id, nombre_completo, telefono, email, origen, interes, comuna, estado, fecha_creacion) VALUES ('1', 'Roberto G├│mez', NULL, NULL, 'Web', 'Casa Barrio Italia', NULL, 'NUEVO', '2026-01-26 19:34:21.642739');
INSERT INTO public.leads (id, nombre_completo, telefono, email, origen, interes, comuna, estado, fecha_creacion) VALUES ('2', 'Ana Mar├¡a Silva', NULL, NULL, 'Portal', 'Depto Independencia', NULL, 'NUEVO', '2026-01-26 19:34:21.642739');
INSERT INTO public.leads (id, nombre_completo, telefono, email, origen, interes, comuna, estado, fecha_creacion) VALUES ('3', 'Felipe Osorio', NULL, NULL, 'Instagram', 'Parcela San Felipe', NULL, 'CONTACTADO', '2026-01-26 19:34:21.642739');
INSERT INTO public.leads (id, nombre_completo, telefono, email, origen, interes, comuna, estado, fecha_creacion) VALUES ('4', 'Carolina Mendez', NULL, NULL, 'Llamada', 'Casa Los Andes', NULL, 'VISITA', '2026-01-26 19:34:21.642739');
INSERT INTO public.leads (id, nombre_completo, telefono, email, origen, interes, comuna, estado, fecha_creacion) VALUES ('5', 'Roberto G├│mez', '+56911111111', 'ignacio.puchu2002@gmail.com', 'Web', NULL, 'Los Andes', 'NUEVO', '2026-01-26 19:45:50.81554');
INSERT INTO public.leads (id, nombre_completo, telefono, email, origen, interes, comuna, estado, fecha_creacion) VALUES ('6', 'Felipe Osorio', '+56922222222', 'ignacio.ojeda2002@gmail.com', 'Instagram', NULL, 'San Felipe', 'CONTACTADO', '2026-01-26 19:45:50.81554');


--
-- Data for Name: leads2; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.leads2 (id, nombre_completo, telefono, email, comuna, consumo_mensual, origen, estado, fecha_creacion) VALUES ('2', 'Felipe Osorio', '+56922222222', 'ignacio.ojeda2002@gmail.com', 'San Felipe', NULL, 'Instagram', 'CONTACTADO', '2026-01-26 19:52:55.661514');
INSERT INTO public.leads2 (id, nombre_completo, telefono, email, comuna, consumo_mensual, origen, estado, fecha_creacion) VALUES ('1', 'Roberto G├│mez', '+56911111111', 'ignacio.puchu2002@gmail.com', 'Los Andes', NULL, 'Web', 'VISITA', '2026-01-26 19:52:55.661514');
INSERT INTO public.leads2 (id, nombre_completo, telefono, email, comuna, consumo_mensual, origen, estado, fecha_creacion) VALUES ('3', 'Camilo M├╝ller', '+56959801912', 'ignacio.puchu2002@gmail.com', 'Independencia', 'Medio', 'Manual', 'CERRADO', '2026-01-27 12:06:18.062813');


--
-- Data for Name: mensajes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: propiedad_bitacora; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.propiedad_bitacora (id, propiedad_id, usuario, accion, detalle, fecha) VALUES ('1', '2', 'Marlen Teresita', 'Comentario', 'Cliente llam├│ interesado, agendamos visita para ma├▒ana.', '2026-01-29 17:18:25.300774');
INSERT INTO public.propiedad_bitacora (id, propiedad_id, usuario, accion, detalle, fecha) VALUES ('2', '2', 'Marlen Teresita', 'Comentario', 'Cliente llam├│ interesado, agendamos visita para pasado ma├▒ana.', '2026-01-29 17:19:02.234235');


--
-- Data for Name: propiedad_documentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.propiedad_documentos (id, propiedad_id, tipo_documento, nombre_archivo, url_archivo, fecha_subida, estado) VALUES ('1', '2', 'Contrato', 'Contrato Arriendo depto HOLANDA 2025.pdf', '/uploads/1769634308901-407311353.pdf', '2026-01-28 18:05:09.126502', 'Vigente');
INSERT INTO public.propiedad_documentos (id, propiedad_id, tipo_documento, nombre_archivo, url_archivo, fecha_subida, estado) VALUES ('2', '2', 'Contrato', 'BORRADOR  PDF MODIFICADO 1 Contrato de Arriendo Base casa y dpto (Con Codeudor Solidario).pdf', '/uploads/1769634653416-724201733.pdf', '2026-01-28 18:10:53.850022', 'Vigente');


--
-- Data for Name: propiedad_imagenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('78', '2', '/uploads/1769632129212-935179621.jpeg', 't', '2026-01-28 17:28:49.590366');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('91', '3', '/uploads/1770048755704-870700358.jpeg', 't', '2026-02-02 13:12:35.855965');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('92', '3', '/uploads/1770048763420-763737832.jpeg', 'f', '2026-02-02 13:12:43.66544');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('93', '3', '/uploads/1770048763539-988184199.jpeg', 'f', '2026-02-02 13:12:43.66544');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('94', '3', '/uploads/1770048763556-780279633.jpeg', 'f', '2026-02-02 13:12:43.66544');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('95', '3', '/uploads/1770048763570-894946321.jpeg', 'f', '2026-02-02 13:12:43.66544');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('96', '3', '/uploads/1770048763583-186863309.jpeg', 'f', '2026-02-02 13:12:43.66544');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('97', '3', '/uploads/1770048763630-229793780.jpeg', 'f', '2026-02-02 13:12:43.66544');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('98', '3', '/uploads/1770048763649-308089895.jpeg', 'f', '2026-02-02 13:12:43.66544');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('100', '4', '/uploads/1770384695258-342870448.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('101', '4', '/uploads/1770384695273-515291490.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('102', '4', '/uploads/1770384695281-987442393.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('103', '4', '/uploads/1770384695287-790723408.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('104', '4', '/uploads/1770384695294-345056466.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('105', '4', '/uploads/1770384695306-854656969.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('106', '4', '/uploads/1770384695309-140611604.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('107', '4', '/uploads/1770384695313-631261032.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('108', '4', '/uploads/1770384695324-195206487.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('109', '4', '/uploads/1770384695330-994566969.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('110', '4', '/uploads/1770384695331-3838517.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('111', '4', '/uploads/1770384695337-187311151.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('112', '4', '/uploads/1770384695346-300522970.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('113', '4', '/uploads/1770384695347-315622950.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('114', '4', '/uploads/1770384695352-677017771.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('40', '2', '/uploads/1769627524110-525635202.jpeg', 'f', '2026-01-28 16:12:04.192283');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('41', '2', '/uploads/1769627524114-800118375.jpeg', 'f', '2026-01-28 16:12:04.207202');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('42', '2', '/uploads/1769627524120-503639077.jpeg', 'f', '2026-01-28 16:12:04.20815');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('43', '2', '/uploads/1769627524124-746909612.jpeg', 'f', '2026-01-28 16:12:04.209128');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('44', '2', '/uploads/1769627524132-457327162.jpeg', 'f', '2026-01-28 16:12:04.210092');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('45', '2', '/uploads/1769627524143-813382519.jpeg', 'f', '2026-01-28 16:12:04.211134');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('46', '2', '/uploads/1769627524148-416294791.jpeg', 'f', '2026-01-28 16:12:04.212086');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('47', '2', '/uploads/1769627524150-106212334.jpeg', 'f', '2026-01-28 16:12:04.213172');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('48', '2', '/uploads/1769627524159-632222034.jpeg', 'f', '2026-01-28 16:12:04.214024');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('49', '2', '/uploads/1769627524163-332207911.jpeg', 'f', '2026-01-28 16:12:04.214912');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('50', '2', '/uploads/1769627524166-285456388.jpeg', 'f', '2026-01-28 16:12:04.215825');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('51', '2', '/uploads/1769627524176-224916118.jpeg', 'f', '2026-01-28 16:12:04.216809');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('53', '1', '/uploads/1769628168466-818704471.jpeg', 'f', '2026-01-28 16:22:48.638485');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('54', '1', '/uploads/1769628168475-484547692.jpeg', 'f', '2026-01-28 16:22:48.654997');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('55', '1', '/uploads/1769628168487-316369652.jpeg', 'f', '2026-01-28 16:22:48.658007');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('56', '1', '/uploads/1769628168494-609013523.jpeg', 'f', '2026-01-28 16:22:48.659516');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('57', '1', '/uploads/1769628168497-699640688.jpeg', 'f', '2026-01-28 16:22:48.660962');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('58', '1', '/uploads/1769628168503-986091594.jpeg', 'f', '2026-01-28 16:22:48.662257');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('59', '1', '/uploads/1769628168508-462445405.jpeg', 'f', '2026-01-28 16:22:48.663933');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('60', '1', '/uploads/1769628168511-328200324.jpeg', 'f', '2026-01-28 16:22:48.666276');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('61', '1', '/uploads/1769628168515-256052064.jpeg', 'f', '2026-01-28 16:22:48.667448');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('62', '1', '/uploads/1769628168521-590342583.jpeg', 'f', '2026-01-28 16:22:48.668348');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('63', '1', '/uploads/1769628168533-949153440.jpeg', 'f', '2026-01-28 16:22:48.669308');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('64', '1', '/uploads/1769628168536-613485214.jpeg', 'f', '2026-01-28 16:22:48.670621');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('115', '4', '/uploads/1770384695356-158564428.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('116', '4', '/uploads/1770384695360-740670469.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('117', '4', '/uploads/1770384695361-406497954.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('118', '4', '/uploads/1770384695366-188143599.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('119', '4', '/uploads/1770384695370-572560524.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('120', '4', '/uploads/1770384695375-348526833.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('121', '4', '/uploads/1770384695380-337695911.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('122', '4', '/uploads/1770384695381-755907751.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('123', '4', '/uploads/1770384695385-411582589.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('124', '4', '/uploads/1770384695392-714974657.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('125', '4', '/uploads/1770384695397-114541502.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('126', '4', '/uploads/1770384695401-330767154.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('127', '4', '/uploads/1770384695405-283152581.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('128', '4', '/uploads/1770384695410-654514042.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('129', '4', '/uploads/1770384695415-620370202.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('130', '4', '/uploads/1770384695417-129946481.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('131', '4', '/uploads/1770384695427-294709320.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('132', '4', '/uploads/1770384695427-946835946.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('133', '4', '/uploads/1770384695432-837804012.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('134', '4', '/uploads/1770384695441-683559363.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('135', '4', '/uploads/1770384695448-38851672.jpeg', 'f', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('99', '4', '/uploads/1770384695251-608481801.jpeg', 't', '2026-02-06 10:31:35.456136');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('136', '5', '/uploads/1770384695258-342870448.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('137', '5', '/uploads/1770384695273-515291490.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('138', '5', '/uploads/1770384695281-987442393.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('139', '5', '/uploads/1770384695287-790723408.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('140', '5', '/uploads/1770384695294-345056466.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('141', '5', '/uploads/1770384695306-854656969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('142', '5', '/uploads/1770384695309-140611604.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('143', '5', '/uploads/1770384695313-631261032.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('144', '5', '/uploads/1770384695324-195206487.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('145', '5', '/uploads/1770384695330-994566969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('146', '5', '/uploads/1770384695331-3838517.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('147', '5', '/uploads/1770384695337-187311151.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('148', '5', '/uploads/1770384695346-300522970.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('149', '5', '/uploads/1770384695347-315622950.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('150', '5', '/uploads/1770384695352-677017771.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('151', '5', '/uploads/1770384695356-158564428.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('152', '5', '/uploads/1770384695360-740670469.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('153', '5', '/uploads/1770384695361-406497954.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('154', '5', '/uploads/1770384695366-188143599.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('155', '5', '/uploads/1770384695370-572560524.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('156', '5', '/uploads/1770384695375-348526833.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('157', '5', '/uploads/1770384695380-337695911.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('158', '5', '/uploads/1770384695381-755907751.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('159', '5', '/uploads/1770384695385-411582589.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('160', '5', '/uploads/1770384695392-714974657.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('161', '5', '/uploads/1770384695397-114541502.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('162', '5', '/uploads/1770384695401-330767154.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('163', '5', '/uploads/1770384695405-283152581.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('164', '5', '/uploads/1770384695410-654514042.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('165', '5', '/uploads/1770384695415-620370202.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('166', '5', '/uploads/1770384695417-129946481.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('167', '5', '/uploads/1770384695427-294709320.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('168', '5', '/uploads/1770384695427-946835946.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('169', '5', '/uploads/1770384695432-837804012.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('170', '5', '/uploads/1770384695441-683559363.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('171', '5', '/uploads/1770384695448-38851672.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('172', '5', '/uploads/1770384695251-608481801.jpeg', 't', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('173', '6', '/uploads/1770384695258-342870448.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('174', '6', '/uploads/1770384695273-515291490.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('175', '6', '/uploads/1770384695281-987442393.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('176', '6', '/uploads/1770384695287-790723408.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('177', '6', '/uploads/1770384695294-345056466.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('178', '6', '/uploads/1770384695306-854656969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('179', '6', '/uploads/1770384695309-140611604.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('180', '6', '/uploads/1770384695313-631261032.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('181', '6', '/uploads/1770384695324-195206487.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('182', '6', '/uploads/1770384695330-994566969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('183', '6', '/uploads/1770384695331-3838517.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('184', '6', '/uploads/1770384695337-187311151.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('185', '6', '/uploads/1770384695346-300522970.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('186', '6', '/uploads/1770384695347-315622950.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('187', '6', '/uploads/1770384695352-677017771.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('188', '6', '/uploads/1770384695356-158564428.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('189', '6', '/uploads/1770384695360-740670469.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('190', '6', '/uploads/1770384695361-406497954.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('191', '6', '/uploads/1770384695366-188143599.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('192', '6', '/uploads/1770384695370-572560524.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('193', '6', '/uploads/1770384695375-348526833.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('194', '6', '/uploads/1770384695380-337695911.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('195', '6', '/uploads/1770384695381-755907751.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('196', '6', '/uploads/1770384695385-411582589.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('197', '6', '/uploads/1770384695392-714974657.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('198', '6', '/uploads/1770384695397-114541502.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('199', '6', '/uploads/1770384695401-330767154.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('200', '6', '/uploads/1770384695405-283152581.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('201', '6', '/uploads/1770384695410-654514042.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('202', '6', '/uploads/1770384695415-620370202.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('203', '6', '/uploads/1770384695417-129946481.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('204', '6', '/uploads/1770384695427-294709320.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('205', '6', '/uploads/1770384695427-946835946.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('206', '6', '/uploads/1770384695432-837804012.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('207', '6', '/uploads/1770384695441-683559363.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('208', '6', '/uploads/1770384695448-38851672.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('209', '6', '/uploads/1770384695251-608481801.jpeg', 't', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('210', '7', '/uploads/1770384695258-342870448.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('211', '7', '/uploads/1770384695273-515291490.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('212', '7', '/uploads/1770384695281-987442393.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('213', '7', '/uploads/1770384695287-790723408.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('214', '7', '/uploads/1770384695294-345056466.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('215', '7', '/uploads/1770384695306-854656969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('216', '7', '/uploads/1770384695309-140611604.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('217', '7', '/uploads/1770384695313-631261032.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('218', '7', '/uploads/1770384695324-195206487.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('219', '7', '/uploads/1770384695330-994566969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('220', '7', '/uploads/1770384695331-3838517.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('221', '7', '/uploads/1770384695337-187311151.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('222', '7', '/uploads/1770384695346-300522970.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('223', '7', '/uploads/1770384695347-315622950.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('224', '7', '/uploads/1770384695352-677017771.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('225', '7', '/uploads/1770384695356-158564428.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('226', '7', '/uploads/1770384695360-740670469.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('227', '7', '/uploads/1770384695361-406497954.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('228', '7', '/uploads/1770384695366-188143599.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('229', '7', '/uploads/1770384695370-572560524.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('230', '7', '/uploads/1770384695375-348526833.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('231', '7', '/uploads/1770384695380-337695911.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('232', '7', '/uploads/1770384695381-755907751.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('233', '7', '/uploads/1770384695385-411582589.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('234', '7', '/uploads/1770384695392-714974657.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('235', '7', '/uploads/1770384695397-114541502.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('236', '7', '/uploads/1770384695401-330767154.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('237', '7', '/uploads/1770384695405-283152581.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('238', '7', '/uploads/1770384695410-654514042.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('239', '7', '/uploads/1770384695415-620370202.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('240', '7', '/uploads/1770384695417-129946481.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('241', '7', '/uploads/1770384695427-294709320.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('242', '7', '/uploads/1770384695427-946835946.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('243', '7', '/uploads/1770384695432-837804012.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('244', '7', '/uploads/1770384695441-683559363.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('245', '7', '/uploads/1770384695448-38851672.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('246', '7', '/uploads/1770384695251-608481801.jpeg', 't', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('247', '8', '/uploads/1770384695258-342870448.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('248', '8', '/uploads/1770384695273-515291490.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('249', '8', '/uploads/1770384695281-987442393.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('250', '8', '/uploads/1770384695287-790723408.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('251', '8', '/uploads/1770384695294-345056466.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('252', '8', '/uploads/1770384695306-854656969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('253', '8', '/uploads/1770384695309-140611604.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('254', '8', '/uploads/1770384695313-631261032.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('255', '8', '/uploads/1770384695324-195206487.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('256', '8', '/uploads/1770384695330-994566969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('257', '8', '/uploads/1770384695331-3838517.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('258', '8', '/uploads/1770384695337-187311151.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('259', '8', '/uploads/1770384695346-300522970.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('260', '8', '/uploads/1770384695347-315622950.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('261', '8', '/uploads/1770384695352-677017771.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('262', '8', '/uploads/1770384695356-158564428.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('263', '8', '/uploads/1770384695360-740670469.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('264', '8', '/uploads/1770384695361-406497954.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('265', '8', '/uploads/1770384695366-188143599.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('266', '8', '/uploads/1770384695370-572560524.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('267', '8', '/uploads/1770384695375-348526833.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('268', '8', '/uploads/1770384695380-337695911.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('269', '8', '/uploads/1770384695381-755907751.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('270', '8', '/uploads/1770384695385-411582589.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('271', '8', '/uploads/1770384695392-714974657.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('272', '8', '/uploads/1770384695397-114541502.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('273', '8', '/uploads/1770384695401-330767154.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('274', '8', '/uploads/1770384695405-283152581.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('275', '8', '/uploads/1770384695410-654514042.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('276', '8', '/uploads/1770384695415-620370202.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('277', '8', '/uploads/1770384695417-129946481.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('278', '8', '/uploads/1770384695427-294709320.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('279', '8', '/uploads/1770384695427-946835946.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('280', '8', '/uploads/1770384695432-837804012.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('281', '8', '/uploads/1770384695441-683559363.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('282', '8', '/uploads/1770384695448-38851672.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('283', '8', '/uploads/1770384695251-608481801.jpeg', 't', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('284', '9', '/uploads/1770384695258-342870448.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('285', '9', '/uploads/1770384695273-515291490.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('286', '9', '/uploads/1770384695281-987442393.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('287', '9', '/uploads/1770384695287-790723408.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('288', '9', '/uploads/1770384695294-345056466.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('289', '9', '/uploads/1770384695306-854656969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('290', '9', '/uploads/1770384695309-140611604.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('291', '9', '/uploads/1770384695313-631261032.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('292', '9', '/uploads/1770384695324-195206487.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('293', '9', '/uploads/1770384695330-994566969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('294', '9', '/uploads/1770384695331-3838517.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('295', '9', '/uploads/1770384695337-187311151.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('296', '9', '/uploads/1770384695346-300522970.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('297', '9', '/uploads/1770384695347-315622950.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('298', '9', '/uploads/1770384695352-677017771.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('299', '9', '/uploads/1770384695356-158564428.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('300', '9', '/uploads/1770384695360-740670469.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('301', '9', '/uploads/1770384695361-406497954.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('302', '9', '/uploads/1770384695366-188143599.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('303', '9', '/uploads/1770384695370-572560524.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('304', '9', '/uploads/1770384695375-348526833.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('305', '9', '/uploads/1770384695380-337695911.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('306', '9', '/uploads/1770384695381-755907751.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('307', '9', '/uploads/1770384695385-411582589.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('308', '9', '/uploads/1770384695392-714974657.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('309', '9', '/uploads/1770384695397-114541502.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('310', '9', '/uploads/1770384695401-330767154.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('311', '9', '/uploads/1770384695405-283152581.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('312', '9', '/uploads/1770384695410-654514042.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('313', '9', '/uploads/1770384695415-620370202.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('314', '9', '/uploads/1770384695417-129946481.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('315', '9', '/uploads/1770384695427-294709320.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('316', '9', '/uploads/1770384695427-946835946.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('317', '9', '/uploads/1770384695432-837804012.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('318', '9', '/uploads/1770384695441-683559363.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('319', '9', '/uploads/1770384695448-38851672.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('320', '9', '/uploads/1770384695251-608481801.jpeg', 't', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('321', '10', '/uploads/1770384695258-342870448.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('322', '10', '/uploads/1770384695273-515291490.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('323', '10', '/uploads/1770384695281-987442393.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('324', '10', '/uploads/1770384695287-790723408.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('325', '10', '/uploads/1770384695294-345056466.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('326', '10', '/uploads/1770384695306-854656969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('327', '10', '/uploads/1770384695309-140611604.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('328', '10', '/uploads/1770384695313-631261032.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('329', '10', '/uploads/1770384695324-195206487.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('330', '10', '/uploads/1770384695330-994566969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('331', '10', '/uploads/1770384695331-3838517.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('332', '10', '/uploads/1770384695337-187311151.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('333', '10', '/uploads/1770384695346-300522970.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('334', '10', '/uploads/1770384695347-315622950.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('335', '10', '/uploads/1770384695352-677017771.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('336', '10', '/uploads/1770384695356-158564428.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('337', '10', '/uploads/1770384695360-740670469.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('338', '10', '/uploads/1770384695361-406497954.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('339', '10', '/uploads/1770384695366-188143599.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('340', '10', '/uploads/1770384695370-572560524.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('341', '10', '/uploads/1770384695375-348526833.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('342', '10', '/uploads/1770384695380-337695911.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('343', '10', '/uploads/1770384695381-755907751.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('344', '10', '/uploads/1770384695385-411582589.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('345', '10', '/uploads/1770384695392-714974657.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('346', '10', '/uploads/1770384695397-114541502.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('347', '10', '/uploads/1770384695401-330767154.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('348', '10', '/uploads/1770384695405-283152581.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('349', '10', '/uploads/1770384695410-654514042.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('350', '10', '/uploads/1770384695415-620370202.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('351', '10', '/uploads/1770384695417-129946481.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('352', '10', '/uploads/1770384695427-294709320.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('353', '10', '/uploads/1770384695427-946835946.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('354', '10', '/uploads/1770384695432-837804012.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('355', '10', '/uploads/1770384695441-683559363.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('356', '10', '/uploads/1770384695448-38851672.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('357', '10', '/uploads/1770384695251-608481801.jpeg', 't', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('358', '11', '/uploads/1770384695258-342870448.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('359', '11', '/uploads/1770384695273-515291490.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('360', '11', '/uploads/1770384695281-987442393.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('361', '11', '/uploads/1770384695287-790723408.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('362', '11', '/uploads/1770384695294-345056466.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('363', '11', '/uploads/1770384695306-854656969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('364', '11', '/uploads/1770384695309-140611604.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('365', '11', '/uploads/1770384695313-631261032.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('366', '11', '/uploads/1770384695324-195206487.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('367', '11', '/uploads/1770384695330-994566969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('368', '11', '/uploads/1770384695331-3838517.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('369', '11', '/uploads/1770384695337-187311151.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('370', '11', '/uploads/1770384695346-300522970.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('371', '11', '/uploads/1770384695347-315622950.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('372', '11', '/uploads/1770384695352-677017771.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('373', '11', '/uploads/1770384695356-158564428.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('374', '11', '/uploads/1770384695360-740670469.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('375', '11', '/uploads/1770384695361-406497954.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('376', '11', '/uploads/1770384695366-188143599.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('377', '11', '/uploads/1770384695370-572560524.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('378', '11', '/uploads/1770384695375-348526833.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('379', '11', '/uploads/1770384695380-337695911.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('380', '11', '/uploads/1770384695381-755907751.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('381', '11', '/uploads/1770384695385-411582589.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('382', '11', '/uploads/1770384695392-714974657.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('383', '11', '/uploads/1770384695397-114541502.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('384', '11', '/uploads/1770384695401-330767154.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('385', '11', '/uploads/1770384695405-283152581.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('386', '11', '/uploads/1770384695410-654514042.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('387', '11', '/uploads/1770384695415-620370202.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('388', '11', '/uploads/1770384695417-129946481.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('389', '11', '/uploads/1770384695427-294709320.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('390', '11', '/uploads/1770384695427-946835946.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('391', '11', '/uploads/1770384695432-837804012.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('392', '11', '/uploads/1770384695441-683559363.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('393', '11', '/uploads/1770384695448-38851672.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('394', '11', '/uploads/1770384695251-608481801.jpeg', 't', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('395', '12', '/uploads/1770384695258-342870448.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('396', '12', '/uploads/1770384695273-515291490.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('397', '12', '/uploads/1770384695281-987442393.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('398', '12', '/uploads/1770384695287-790723408.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('399', '12', '/uploads/1770384695294-345056466.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('400', '12', '/uploads/1770384695306-854656969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('401', '12', '/uploads/1770384695309-140611604.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('402', '12', '/uploads/1770384695313-631261032.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('403', '12', '/uploads/1770384695324-195206487.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('404', '12', '/uploads/1770384695330-994566969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('405', '12', '/uploads/1770384695331-3838517.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('406', '12', '/uploads/1770384695337-187311151.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('407', '12', '/uploads/1770384695346-300522970.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('408', '12', '/uploads/1770384695347-315622950.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('409', '12', '/uploads/1770384695352-677017771.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('410', '12', '/uploads/1770384695356-158564428.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('411', '12', '/uploads/1770384695360-740670469.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('412', '12', '/uploads/1770384695361-406497954.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('413', '12', '/uploads/1770384695366-188143599.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('414', '12', '/uploads/1770384695370-572560524.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('415', '12', '/uploads/1770384695375-348526833.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('416', '12', '/uploads/1770384695380-337695911.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('417', '12', '/uploads/1770384695381-755907751.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('418', '12', '/uploads/1770384695385-411582589.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('419', '12', '/uploads/1770384695392-714974657.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('420', '12', '/uploads/1770384695397-114541502.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('421', '12', '/uploads/1770384695401-330767154.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('422', '12', '/uploads/1770384695405-283152581.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('423', '12', '/uploads/1770384695410-654514042.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('424', '12', '/uploads/1770384695415-620370202.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('425', '12', '/uploads/1770384695417-129946481.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('426', '12', '/uploads/1770384695427-294709320.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('427', '12', '/uploads/1770384695427-946835946.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('428', '12', '/uploads/1770384695432-837804012.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('429', '12', '/uploads/1770384695441-683559363.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('430', '12', '/uploads/1770384695448-38851672.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('431', '12', '/uploads/1770384695251-608481801.jpeg', 't', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('432', '13', '/uploads/1770384695258-342870448.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('433', '13', '/uploads/1770384695273-515291490.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('434', '13', '/uploads/1770384695281-987442393.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('435', '13', '/uploads/1770384695287-790723408.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('436', '13', '/uploads/1770384695294-345056466.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('437', '13', '/uploads/1770384695306-854656969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('438', '13', '/uploads/1770384695309-140611604.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('439', '13', '/uploads/1770384695313-631261032.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('440', '13', '/uploads/1770384695324-195206487.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('441', '13', '/uploads/1770384695330-994566969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('442', '13', '/uploads/1770384695331-3838517.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('443', '13', '/uploads/1770384695337-187311151.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('444', '13', '/uploads/1770384695346-300522970.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('445', '13', '/uploads/1770384695347-315622950.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('446', '13', '/uploads/1770384695352-677017771.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('447', '13', '/uploads/1770384695356-158564428.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('448', '13', '/uploads/1770384695360-740670469.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('449', '13', '/uploads/1770384695361-406497954.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('450', '13', '/uploads/1770384695366-188143599.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('451', '13', '/uploads/1770384695370-572560524.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('452', '13', '/uploads/1770384695375-348526833.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('453', '13', '/uploads/1770384695380-337695911.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('454', '13', '/uploads/1770384695381-755907751.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('455', '13', '/uploads/1770384695385-411582589.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('456', '13', '/uploads/1770384695392-714974657.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('457', '13', '/uploads/1770384695397-114541502.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('458', '13', '/uploads/1770384695401-330767154.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('459', '13', '/uploads/1770384695405-283152581.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('460', '13', '/uploads/1770384695410-654514042.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('461', '13', '/uploads/1770384695415-620370202.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('462', '13', '/uploads/1770384695417-129946481.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('463', '13', '/uploads/1770384695427-294709320.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('464', '13', '/uploads/1770384695427-946835946.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('465', '13', '/uploads/1770384695432-837804012.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('466', '13', '/uploads/1770384695441-683559363.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('467', '13', '/uploads/1770384695448-38851672.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('468', '13', '/uploads/1770384695251-608481801.jpeg', 't', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('469', '14', '/uploads/1770384695258-342870448.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('470', '14', '/uploads/1770384695273-515291490.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('471', '14', '/uploads/1770384695281-987442393.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('472', '14', '/uploads/1770384695287-790723408.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('473', '14', '/uploads/1770384695294-345056466.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('474', '14', '/uploads/1770384695306-854656969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('475', '14', '/uploads/1770384695309-140611604.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('476', '14', '/uploads/1770384695313-631261032.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('477', '14', '/uploads/1770384695324-195206487.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('478', '14', '/uploads/1770384695330-994566969.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('479', '14', '/uploads/1770384695331-3838517.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('480', '14', '/uploads/1770384695337-187311151.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('481', '14', '/uploads/1770384695346-300522970.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('482', '14', '/uploads/1770384695347-315622950.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('483', '14', '/uploads/1770384695352-677017771.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('484', '14', '/uploads/1770384695356-158564428.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('485', '14', '/uploads/1770384695360-740670469.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('486', '14', '/uploads/1770384695361-406497954.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('487', '14', '/uploads/1770384695366-188143599.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('488', '14', '/uploads/1770384695370-572560524.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('489', '14', '/uploads/1770384695375-348526833.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('490', '14', '/uploads/1770384695380-337695911.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('491', '14', '/uploads/1770384695381-755907751.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('492', '14', '/uploads/1770384695385-411582589.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('493', '14', '/uploads/1770384695392-714974657.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('494', '14', '/uploads/1770384695397-114541502.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('495', '14', '/uploads/1770384695401-330767154.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('496', '14', '/uploads/1770384695405-283152581.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('497', '14', '/uploads/1770384695410-654514042.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('498', '14', '/uploads/1770384695415-620370202.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('499', '14', '/uploads/1770384695417-129946481.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('500', '14', '/uploads/1770384695427-294709320.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('501', '14', '/uploads/1770384695427-946835946.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('502', '14', '/uploads/1770384695432-837804012.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('503', '14', '/uploads/1770384695441-683559363.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('504', '14', '/uploads/1770384695448-38851672.jpeg', 'f', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('505', '14', '/uploads/1770384695251-608481801.jpeg', 't', '2026-02-06 11:40:16.656064');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('507', '15', '/uploads/1770735732096-900698400.jpg', 'f', '2026-02-10 12:02:13.147144');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('508', '15', '/uploads/1770735732174-397129357.jpg', 'f', '2026-02-10 12:02:13.147144');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('509', '15', '/uploads/1770735732277-828809183.jpg', 'f', '2026-02-10 12:02:13.147144');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('510', '15', '/uploads/1770735732466-441559762.jpg', 'f', '2026-02-10 12:02:13.147144');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('511', '15', '/uploads/1770735732531-248529387.jpg', 'f', '2026-02-10 12:02:13.147144');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('512', '15', '/uploads/1770735732639-712134000.jpg', 'f', '2026-02-10 12:02:13.147144');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('513', '15', '/uploads/1770735732802-426638948.jpg', 'f', '2026-02-10 12:02:13.147144');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('514', '15', '/uploads/1770735732919-663609081.jpg', 'f', '2026-02-10 12:02:13.147144');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('506', '15', '/uploads/1770735731934-987845191.jpg', 't', '2026-02-10 12:02:13.147144');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('516', '16', '/uploads/1770839735011-768975734.jpg', 'f', '2026-02-11 16:55:42.94807');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('517', '16', '/uploads/1770839736164-83700701.jpg', 'f', '2026-02-11 16:55:42.94807');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('518', '16', '/uploads/1770839737277-991375348.jpg', 'f', '2026-02-11 16:55:42.94807');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('519', '16', '/uploads/1770839738337-727663317.jpg', 'f', '2026-02-11 16:55:42.94807');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('520', '16', '/uploads/1770839739684-171828201.jpg', 'f', '2026-02-11 16:55:42.94807');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('521', '16', '/uploads/1770839740477-414587376.jpg', 'f', '2026-02-11 16:55:42.94807');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('522', '16', '/uploads/1770839741399-978429405.jpg', 'f', '2026-02-11 16:55:42.94807');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('523', '16', '/uploads/1770839742138-928353249.jpg', 'f', '2026-02-11 16:55:42.94807');
INSERT INTO public.propiedad_imagenes (id, propiedad_id, url_imagen, es_portada, fecha_subida) VALUES ('515', '16', '/uploads/1770839733113-558842659.jpg', 't', '2026-02-11 16:55:42.94807');


--
-- Data for Name: propiedad_informes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.propiedad_informes (id, propiedad_id, titulo, fecha_generacion, estado, configuracion) VALUES ('1', '2', 'Informe Gesti├│n Marzo 2026', '2026-02-03 17:42:22.582799', 'Pendiente', '{}');


--
-- Data for Name: propiedades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('1', 'Casa Piloto Los Andes', 'Hermosa casa de prueba con vista a la cordillera', 'Venta', 'Casa', '5000', 'UF', '0', '3', '2', '0', '0', 'Los Andes', NULL, 'https://images.unsplash.com/photo-1580587771525-78b9dba3b91d?auto=format&fit=crop&w=800&q=80', 't', '2025-12-26 10:53:16.831117', '0', 'f', 'f', 'f', 'Activa', '[]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('2', 'Departamento Nuevo en Vi├▒a', 'Departamento con vista al mar, primera linea.', 'Venta', 'Departamento', '4500', 'UF', '120000', '2', '2', '0', '0', 'Vi├▒a del Mar', NULL, 'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?auto=format&fit=crop&w=800&q=80', 't', '2025-12-26 11:11:02.293051', '0', 'f', 'f', 'f', 'Activa', '[]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('3', 'Casa Moderna en Los Andes', 'Excelente propiedad ubicada en sector residencial tranquilo, con gran conectividad y acabados de lujo.', 'Arriendo', 'Casa', '5500', 'UF', '120000', '3', '2', '0', '0', 'Los Andes, Regi├│n de Valpara├¡so', NULL, 'https://images.adsttc.com/media/images/5127/d195/b3fc/4b11/a700/29c7/large_jpg/1260988652-1855682237-los-andes-house-6.jpg?1361564053', 't', '2025-12-26 12:16:58.877469', '0', 'f', 'f', 'f', 'Activa', '[]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('4', 'Moderno Departamento Amoblado - Centro Los Andes', 'Departamento totalmente equipado para estancias cortas. Cuenta con Wifi de alta velocidad, TV cable y excelente ubicaci├│n cerca de comercios.', 'Arriendo Temporal', 'Departamento', '45000', 'CLP', '0', '2', '1', '0', '0', 'Calle Esmeralda, Los Andes', NULL, 'https://http2.mlstatic.com/D_NQ_NP_2X_855039-MLC88656919226_072025-N-cumbres-de-los-andes.webp', 't', '2025-12-26 12:22:43.882907', '0', 'f', 'f', 'f', 'Activa', '[]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('5', 'Casa Mediterr├ínea en Condominio Exclusivo', 'Hermosa casa estilo mediterr├íneo, no perimetral. Amplios espacios, quincho formado y jard├¡n consolidado. Seguridad 24/7.', 'Arriendo', 'Casa', '1500000', 'CLP', '180000', '4', '3', '140', '350', 'Piedra Roja, Chicureo', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZtmP0BBOxGGX1S8aR497hh9_4aK1h2lOI8A&s', 't', '2025-12-26 15:13:28.926408', '1', 't', 'f', 'f', 'Activa', '[]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('6', 'Casa Mediterr├ínea en Condominio Exclusivo', 'Hermosa casa estilo mediterr├íneo, no perimetral. Amplios espacios, quincho formado y jard├¡n consolidado. Seguridad 24/7.', 'Arriendo', 'Casa', '1500000', 'CLP', '180000', '4', '3', '140', '350', 'Chicureo', NULL, 'https://images.unsplash.com/photo-1600596542815-e328d4de4bf7', 't', '2025-12-26 15:16:29.938456', '1', 't', 'f', 't', 'Activa', '[]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('7', 'Departamento Moderno en Las Condes', 'Espectacular departamento con vista despejada, finas terminaciones, cercano a metro y parques.', 'Venta', 'Departamento', '12500', 'UF', '250000', '3', '2', '95', '110', 'Las Condes', NULL, 'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00', 't', '2025-12-26 15:16:29.945367', '1', 't', 't', 't', 'Activa', '[]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('8', 'Oficina Habilitada en Providencia', 'Oficina lista para ocupar, planta libre con 2 privados, climatizada, excelente conectividad.', 'Arriendo', 'Oficina', '45', 'UF', '120000', '0', '2', '60', '60', 'Providencia', NULL, 'https://images.unsplash.com/photo-1497366216548-37526070297c', 't', '2025-12-26 15:16:29.947251', '1', 'f', 't', 'f', 'Activa', '[]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('9', 'Casa Familiar en La Reina', 'Acogedora casa en barrio tranquilo, gran patio, cerca de colegios y comercio.', 'Venta', 'Casa', '18000', 'UF', '0', '5', '4', '220', '600', 'La Reina', NULL, 'https://images.unsplash.com/photo-1568605114967-8130f3a36994', 't', '2025-12-26 15:16:29.948522', '1', 't', 'f', 't', 'Activa', '[]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('10', 'Loft Industrial en Santiago Centro', 'Estiloso loft de doble altura, ideal para profesionales j├│venes, edificio patrimonial remodelado.', 'Arriendo Temporal', 'Departamento', '650000', 'CLP', '80000', '1', '1', '50', '50', 'Santiago', NULL, 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688', 't', '2025-12-26 15:16:29.949886', '0', 'f', 't', 't', 'Activa', '[]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('11', 'Casa Mediterr├ínea en Condominio Exclusivo', 'Hermosa casa estilo mediterr├íneo, no perimetral. Amplios espacios, quincho formado y jard├¡n consolidado. Seguridad 24/7.', 'Arriendo', 'Casa', '1500000', 'CLP', '180000', '4', '3', '140', '350', 'Chicureo', NULL, 'https://images.unsplash.com/photo-1600596542815-e328d4de4bf7', 't', '2025-12-26 15:16:30.707064', '1', 't', 'f', 't', 'Activa', '[]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('12', 'Departamento Moderno en Las Condes', 'Espectacular departamento con vista despejada, finas terminaciones, cercano a metro y parques.', 'Venta', 'Departamento', '12500', 'UF', '250000', '3', '2', '95', '110', 'Las Condes', NULL, 'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00', 't', '2025-12-26 15:16:30.712684', '1', 't', 't', 't', 'Activa', '[]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('13', 'Oficina Habilitada en Providencia', 'Oficina lista para ocupar, planta libre con 2 privados, climatizada, excelente conectividad.', 'Arriendo', 'Oficina', '45', 'UF', '120000', '0', '2', '60', '60', 'Providencia', NULL, 'https://images.unsplash.com/photo-1497366216548-37526070297c', 't', '2025-12-26 15:16:30.714068', '1', 'f', 't', 'f', 'Activa', '[]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('14', 'Casa Familiar en La Reina', 'Acogedora casa en barrio tranquilo, gran patio, cerca de colegios y comercio.', 'Venta', 'Casa', '18000', 'UF', '0', '5', '4', '220', '600', 'La Reina', NULL, 'https://images.unsplash.com/photo-1568605114967-8130f3a36994', 't', '2025-12-26 15:16:30.715175', '1', 't', 'f', 't', 'Activa', '[]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('17', 'CONDOMINIO CUMBRES DE AUCO', 'Caracter├¡sticas de la propiedad; \r\n­ƒøÅ´©Å 3 dormitorios \r\n­ƒÜ¢ 3  ba├▒o \r\nLiving \r\nComedor \r\n­ƒì│ Cocina \r\nEstacionamiento para 3 autos.\r\nLogia \r\nPiscina \r\nSala de estar \r\n133 Metros construidos\r\n560 metros totales \r\nValor de gastos comunes: $150.000\r\nValor de venta $297.000.000\r\n 2% honorarios\r\n', 'Venta', 'Casa', '297000000', 'CLP', '150000', '3', '3', '133', '560', 'Rinconada, Regi├│n de Valpara├¡so', NULL, 'uploads/1767111266960-450057743.jpg', 't', '2025-12-30 13:14:27.66231', '1', 't', 'f', 't', 'Activa', '["uploads/1767111266960-450057743.jpg", "uploads/1767111267367-955925904.jpg", "uploads/1767111267398-602275385.jpg", "uploads/1767111267420-85309801.jpg", "uploads/1767111267439-509462721.jpg", "uploads/1767111267455-606592661.jpg", "uploads/1767111267491-44845947.jpg", "uploads/1767111267509-945897267.jpg", "uploads/1767111267523-520462929.jpg", "uploads/1767111267533-399954804.jpg", "uploads/1767111267539-369408338.jpg", "uploads/1767111267584-192966942.jpg"]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('16', 'Depto Nuevo Vista Despejada - Metro Chile Espa├▒a', 'Departamento moderno a pasos del metro. Cocina americana, conexi├│n a lavadora y terraza amplia. Edificio con gimnasio y piscina.', 'Arriendo', 'Departamento', '650000', 'CLP', '100000', '2', '2', '54', '58', '├æu├▒oa, Regi├│n Metropolitana', NULL, 'https://via.placeholder.com/400', 't', '2025-12-26 16:28:29.340021', '1', 't', 't', 't', 'Finalizada', '[]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('18', 'GALPON', 'Terreno de 5000 M2, ubicado en sector Las Bandurrias, Rinconada de Los Andes, Regi├│n de Valpara├¡so\r\nGalp├│n de 450 M2\r\nRomana PESAMATIC para 60 toneladas\r\nLosa de lavado industrial\r\nCaba├▒a de 80 M2\r\nOficina principal de 27 M2\r\nOficina de operaci├│n de Romana de 13 M2\r\n2 bodega con un total de 54 M.\r\n1 bodega de Herramientas manuales 13 M2\r\nPort├│n de acceso para camiones de todo tama├▒o de 6 metros de ancho\r\nSistema de monitoreo de c├ímara\r\nSensores de Humo\r\nAutorizaci├│n del SEREMI DE SALUD para almacenar 300 toneladas de producto qu├¡mico\r\nAutorizaci├│n del SEREMI DE SALUD para sistema particular de aguas servidas\r\nAutorizaci├│n de la DGMN (Direcci├│n General de Movilizaci├│n Nacional, control de armas y explosivos) para almacenar 115 toneladas de materia prima para explosivo\r\nAutorizaci├│n municipal para almacenar productos qu├¡micos y sometidos a control Certificado de bomberos que acredita que la instalaci├│n cumple con medidas para mitigar incendios\r\n', 'Venta', 'Oficina', '298000000', 'CLP', '0', '4', '0', '100', '102', 'sector Las Bandurrias, Rinconada de Los Andes, Regi├│n de Valpara├¡so', NULL, 'uploads/1767118634044-330995178.jpg', 't', '2025-12-30 15:17:14.347629', '1', 'f', 'f', 'f', 'Activa', '["uploads/1767118634044-330995178.jpg", "uploads/1767118634069-563081352.jpg", "uploads/1767118634091-789386041.jpg", "uploads/1767118634132-97550542.jpg", "uploads/1767118634174-201337085.jpg", "uploads/1767118634197-329883396.jpg", "uploads/1767118634229-462043413.jpg", "uploads/1767118634264-721860958.jpg"]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('19', 'CONDOMINIO TABOLANGO 2 RINCONADA', 'UBICACI├ôN :  CALLE NUEVA  CONDOMINIO TABOLANGO 2 RINCONADA \r\n\r\nCaracter├¡sticas de la propiedad :\r\n5 dormitorios (2 en suite, principal con walk-in closet)\r\nLiving amplio con bosca  comedor independiente\r\ncocina equipada en silestone mas comedor diario\r\nsala de estar. \r\nbalcon con vista \r\ntermopanel  en todas las ventanas m├ís rollers incluidos\r\n\r\nExteriores: \r\nTerraza Techada ideal para reuniones \r\npiscina con jacuzzi \r\nQuincho completamente equipado \r\nJuegos infantiles de madera\r\nBodega \r\n5 estacionamiento  \r\n4 ba├▒os \r\n\r\n390 metros construidos \r\n1000 metros totales \r\n\r\nSe pagan contribuciones\r\n\r\nValor de Venta $460.000.000', 'Venta', 'Casa', '460000000', 'CLP', '0', '5', '4', '390', '1000', 'Rinconada, Regi├│n de Valpara├¡so', NULL, 'uploads/1767359135248-497719344.jpeg', 't', '2026-01-02 10:05:35.59764', '1', 'f', 'f', 't', 'Finalizada', '["uploads/1767359135248-497719344.jpeg", "uploads/1767359135356-76525246.jpeg", "uploads/1767359135375-917295905.jpeg", "uploads/1767359135403-532315903.jpeg", "uploads/1767359135422-13168738.jpeg", "uploads/1767359135433-383635630.jpeg", "uploads/1767359135441-476321470.jpeg", "uploads/1767359135469-316052591.jpeg", "uploads/1767359135476-469410815.jpeg"]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('20', 'CALLE NUEVA  CONDOMINIO TABOLANGO 2 RINCONADA ', 'Caracter├¡sticas de la propiedad :\r\n5 dormitorios (2 en suite, principal con walk-in closet)\r\nLiving amplio con bosca  comedor independiente\r\ncocina equipada en silestone mas comedor diario\r\nsala de estar. \r\nbalcon con vista \r\ntermopanel  en todas las ventanas m├ís rollers incluidos\r\n\r\nExteriores: \r\nTerraza Techada ideal para reuniones \r\npiscina con jacuzzi \r\nQuincho completamente equipado \r\nJuegos infantiles de madera\r\nBodega \r\n5 estacionamiento  \r\n4 ba├▒os \r\n\r\n390 metros construidos \r\n1000 metros totales \r\n\r\nSe pagan contribuciones\r\n\r\nValor de Venta $460.000.000', 'Arriendo', 'Casa', '470000000', 'CLP', '0', '5', '4', '390', '1000', 'Rinconada, Quinta Regi├│n', NULL, 'uploads/1767638700372-668236627.jpeg', 't', '2026-01-05 15:45:11.900131', '1', 't', 'f', 't', 'Activa', '["uploads/1767638700372-668236627.jpeg", "uploads/1767638700469-353859672.jpeg", "uploads/1767638700774-905104647.jpeg", "uploads/1767638700829-223031582.jpeg", "uploads/1767638701732-368850410.jpeg", "uploads/1767638702064-901269973.jpeg", "uploads/1767638703603-295309776.jpeg", "uploads/1767638704538-366446846.jpeg", "uploads/1767638705766-667731373.jpeg", "uploads/1767638706676-150191762.jpeg", "uploads/1767638708019-737912558.jpeg", "uploads/1767638709126-417245977.jpeg", "uploads/1767638710484-490779122.jpeg", "uploads/1767638711133-792801483.jpeg", "uploads/1767638711684-582254545.jpeg"]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('21', 'Departamento Moderno en Providencia', 'UBICACI├ôN :  CALLE NUEVA  CONDOMINIO TABOLANGO 2 RINCONADA \r\n\r\nCaracter├¡sticas de la propiedad :\r\n5 dormitorios (2 en suite, principal con walk-in closet)\r\nLiving amplio con bosca  comedor independiente\r\ncocina equipada en silestone mas comedor diario\r\nsala de estar. \r\nbalcon con vista \r\ntermopanel  en todas las ventanas m├ís rollers incluidos\r\n\r\nExteriores: \r\nTerraza Techada ideal para reuniones \r\npiscina con jacuzzi \r\nQuincho completamente equipado \r\nJuegos infantiles de madera\r\nBodega \r\n5 estacionamiento  \r\n4 ba├▒os \r\n\r\n390 metros construidos \r\n1000 metros totales \r\n\r\nSe pagan contribuciones\r\n\r\nValor de Venta $460.000.000', 'Venta', 'Parcela', '298000000', 'CLP', '0', '5', '4', '0', '0', 'RINCONADA, QUINTA REGION', NULL, 'uploads/1767648719116-581145155.jpeg', 't', '2026-01-05 18:32:00.765995', '1', 't', 'f', 't', 'Activa', '["uploads/1767648719116-581145155.jpeg", "uploads/1767648719272-218100665.jpeg", "uploads/1767648719435-387693614.jpeg", "uploads/1767648719510-943987327.jpeg", "uploads/1767648719566-201606229.jpeg", "uploads/1767648719925-202722424.jpeg", "uploads/1767648720194-628325180.jpeg", "uploads/1767648720399-634817743.jpeg", "uploads/1767648720433-124651923.jpeg", "uploads/1767648720499-133140400.jpeg", "uploads/1767648720613-583931525.jpeg"]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('22', 'Propiedad PRUEBA N8N', 'UBICACI├ôN :  CALLE NUEVA  CONDOMINIO TABOLANGO 2 RINCONADA \r\n\r\nCaracter├¡sticas de la propiedad :\r\n5 dormitorios (2 en suite, principal con walk-in closet)\r\nLiving amplio con bosca  comedor independiente\r\ncocina equipada en silestone mas comedor diario\r\nsala de estar. \r\nbalcon con vista \r\ntermopanel  en todas las ventanas m├ís rollers incluidos\r\n\r\nExteriores: \r\nTerraza Techada ideal para reuniones \r\npiscina con jacuzzi \r\nQuincho completamente equipado \r\nJuegos infantiles de madera\r\nBodega \r\n5 estacionamiento  \r\n4 ba├▒os \r\n\r\n390 metros construidos \r\n1000 metros totales \r\n\r\nSe pagan contribuciones\r\n\r\nValor de ARRIENDO $1.000.000', 'Arriendo', 'Casa', '1000000', 'CLP', '0', '3', '2', '97', '100', '├æU├æOA, SANTIAGO CHILE', NULL, 'uploads/1767649215712-388185341.jpeg', 't', '2026-01-05 18:40:18.811328', '1', 't', 't', 't', 'Activa', '["uploads/1767649215712-388185341.jpeg", "uploads/1767649216017-194113012.jpeg", "uploads/1767649216307-564498873.jpeg", "uploads/1767649216482-535913724.jpeg", "uploads/1767649216602-253805679.jpeg", "uploads/1767649217700-104859808.jpeg", "uploads/1767649217966-386033085.jpeg", "uploads/1767649218186-149213239.jpeg", "uploads/1767649218201-416213772.jpeg", "uploads/1767649218353-707814214.jpeg", "uploads/1767649218576-489821987.jpeg"]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('23', 'Propiedad PRUEBA N8N', 'UBICACI├ôN :  CALLE NUEVA  CONDOMINIO TABOLANGO 2 RINCONADA \r\n\r\nCaracter├¡sticas de la propiedad :\r\n5 dormitorios (2 en suite, principal con walk-in closet)\r\nLiving amplio con bosca  comedor independiente\r\ncocina equipada en silestone mas comedor diario\r\nsala de estar. \r\nbalcon con vista \r\ntermopanel  en todas las ventanas m├ís rollers incluidos\r\n\r\nExteriores: \r\nTerraza Techada ideal para reuniones \r\npiscina con jacuzzi \r\nQuincho completamente equipado \r\nJuegos infantiles de madera\r\nBodega \r\n5 estacionamiento  \r\n4 ba├▒os \r\n\r\n390 metros construidos \r\n1000 metros totales \r\n\r\nSe pagan contribuciones\r\n\r\nValor de ARRIENDO $1.000.000', 'Arriendo', 'Casa', '1000000', 'CLP', '0', '3', '2', '97', '100', '├æU├æOA, SANTIAGO CHILE', NULL, 'uploads/1767649227057-476402961.jpeg', 't', '2026-01-05 18:40:29.331024', '1', 't', 't', 't', 'Activa', '["uploads/1767649227057-476402961.jpeg", "uploads/1767649227173-939645881.jpeg", "uploads/1767649227250-827193302.jpeg", "uploads/1767649227450-60907504.jpeg", "uploads/1767649227452-219330179.jpeg", "uploads/1767649228323-459094436.jpeg", "uploads/1767649228765-179712342.jpeg", "uploads/1767649228898-182969267.jpeg", "uploads/1767649228991-728902784.jpeg", "uploads/1767649229053-466919767.jpeg", "uploads/1767649229259-483976092.jpeg"]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('24', 'Propiedad PRUEBA N8N', 'UBICACI├ôN :  CALLE NUEVA  CONDOMINIO TABOLANGO 2 RINCONADA \r\n\r\nCaracter├¡sticas de la propiedad :\r\n5 dormitorios (2 en suite, principal con walk-in closet)\r\nLiving amplio con bosca  comedor independiente\r\ncocina equipada en silestone mas comedor diario\r\nsala de estar. \r\nbalcon con vista \r\ntermopanel  en todas las ventanas m├ís rollers incluidos\r\n\r\nExteriores: \r\nTerraza Techada ideal para reuniones \r\npiscina con jacuzzi \r\nQuincho completamente equipado \r\nJuegos infantiles de madera\r\nBodega \r\n5 estacionamiento  \r\n4 ba├▒os \r\n\r\n390 metros construidos \r\n1000 metros totales \r\n\r\nSe pagan contribuciones\r\n\r\nValor de ARRIENDO $1.000.000', 'Arriendo', 'Casa', '1000000', 'CLP', '0', '3', '2', '97', '100', '├æU├æOA, SANTIAGO CHILE', NULL, 'uploads/1767649367335-316926930.jpeg', 't', '2026-01-05 18:42:49.821972', '1', 't', 't', 't', 'Activa', '["uploads/1767649367335-316926930.jpeg", "uploads/1767649367388-802733683.jpeg", "uploads/1767649367567-276223165.jpeg", "uploads/1767649368191-628247520.jpeg", "uploads/1767649368296-621483621.jpeg", "uploads/1767649368990-785551186.jpeg", "uploads/1767649369007-723510019.jpeg", "uploads/1767649369267-652195315.jpeg", "uploads/1767649369390-897091267.jpeg", "uploads/1767649369466-79951804.jpeg", "uploads/1767649369642-779197361.jpeg"]');
INSERT INTO public.propiedades (id, titulo, descripcion, tipo_operacion, tipo_propiedad, precio, moneda, gastos_comunes, dormitorios, banos, m2_utiles, m2_totales, comuna, direccion, imagen_url, active, fecha_publicacion, estacionamientos, piscina, ascensor, quincho, estado, galeria) VALUES ('25', 'Casa 1', 'Descubre tu pr├│ximo cap├¡tulo en Rinconada, Los Andes. Esta excepcional casa en venta ofrece el santuario perfecto para tu familia. Con 5 amplias habitaciones, cada una dise├▒ada para el confort y la privacidad, y 4 ba├▒os completos, la comodidad est├í garantizada en cada rinc├│n. Sus 144 m2 totales se distribuyen inteligentemente para maximizar el espacio, creando ambientes acogedores y funcionales, ideales para el descanso, el trabajo o el entretenimiento. Vive la tranquilidad de un entorno privilegiado, rodeado de naturaleza y con la serenidad que siempre has buscado. Esta es la oportunidad de construir la vida que mereces. Transforma tus sue├▒os en realidad.', 'Venta', 'Casa', '175000000', 'CLP', '0', '5', '4', '123', '144', 'Rinconada, Los Andes', NULL, 'uploads/1767887823245-156741747.jpeg', 't', '2026-01-08 12:57:04.867825', '1', 'f', 'f', 'f', 'Activa', '["uploads/1767887823245-156741747.jpeg", "uploads/1767887823289-506825989.jpeg", "uploads/1767887823397-264344801.jpeg", "uploads/1767887823437-258052409.jpeg", "uploads/1767887823471-325273791.jpeg", "uploads/1767887823962-410814818.jpeg", "uploads/1767887824115-667756267.jpeg", "uploads/1767887824399-849821222.jpeg", "uploads/1767887824452-632536509.jpeg", "uploads/1767887824521-587126843.jpeg", "uploads/1767887824665-781245820.jpeg"]');


--
-- Data for Name: propiedades2; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('16', '6', 'Casa', '00000-00000', 'f', 'f', '0', 'UF', 't', '1200000', '$', '0', '0', 't', 'Valpara├¡so', 'Los Andes', '', 'Esmeralda ', '1097', '', '3', '3', '0', '180', '300', '2', '0', '{"pisos": {"banos": "Cer├ímica", "cocina": "Cer├ímica", "dormitorios": "Cer├ímica"}, "jacuzzi": "No", "piscina": "No", "quincho": "No", "ventanas": "", "calefaccion": "", "riego_automatico": "No", "porton_automatico": "No"}', 'Arriendo Casa en Los Andes 3D 3B', '┬íGran Oportunidad en Los Andes! Arriendo de Casa.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 3 amplios dormitorios y 3 ba├▒os, ideal para la comodidad que buscas. Son 180 m┬▓ construidos perfectamente distribuidos.\n\n┬┐Buscas calidad de vida?  \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', '+56959801912', 'PUBLICADA', '2026-02-11 16:54:34.214378', '/uploads/1770839733113-558842659.jpg', NULL, 't', 'f', 'f', 'f', '{}', '2026-02-11 16:54:34.214378', NULL);
INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('1', '1', 'Casa', '00161-0032', 'f', 't', '460000000', '$', 'f', '0', '$', '0', '0', 't', 'Valpara├¡so', 'Rinconada', '', 'E-845', '1593', '', '3', '2', '0', '153', '143', '0', '0', '{"pisos": {"banos": "Seleccione...", "cocina": "Seleccione...", "dormitorios": "Seleccione..."}, "jacuzzi": "No", "piscina": "No", "quincho": "No", "ventanas": "Seleccione...", "calefaccion": "Seleccione...", "riego_automatico": "No", "porton_automatico": "No"}', 'Venta Casa en Rinconada 3D 2B', '┬íGran Oportunidad en Rinconada! Venta de Casa.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 3 amplios dormitorios y 2 ba├▒os, ideal para la comodidad que buscas. Son  perfectamente distribuidos.\n\n┬┐Buscas calidad de vida?  \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', '+56959801912', 'PUBLICADA', '2026-01-16 15:30:21.033811', NULL, NULL, 't', 'f', 'f', 'f', '{}', '2026-02-03 16:16:56.067607', NULL);
INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('3', '3', 'Casa', '00000-00000', 'f', 't', '169959724', '$', 'f', '0', '$', '0', '0', 't', 'Valpara├¡so', 'Los Andes', '', 'Rep├║blica Argentina', '799', '', '3', '2', '0', '0', '0', '0', '0', '{"pisos": {"banos": "Cer├ímica", "cocina": "Cer├ímica", "dormitorios": "Cer├ímica"}, "jacuzzi": "No", "piscina": "No", "quincho": "Si", "ventanas": "", "calefaccion": "", "riego_automatico": "No", "porton_automatico": "No"}', 'Venta Casa en Los Andes 3D 2B', '┬íGran Oportunidad en Los Andes! Venta de Casa.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 3 amplios dormitorios y 2 ba├▒os, ideal para la comodidad que buscas. Son  perfectamente distribuidos.\n\n┬┐Buscas calidad de vida? Aqu├¡ podr├ís disfrutar de: quincho. \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', '+56 9 5228 6689', 'PUBLICADA', '2026-02-02 13:10:16.865496', '/uploads/1770048755704-870700358.jpeg', NULL, 't', 'f', 'f', 'f', '{}', '2026-02-03 16:16:56.067607', NULL);
INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('2', '2', 'Sitio', '00000-00000', 't', 't', '96000000', '$', 'f', '0', '$', '61000', '34000', 'f', 'Valpara├¡so', 'Los Andes', '', 'Pasaje Celia Carmona', '88', '', '3', '2', '0', '108', '77', '0', '0', '{"pisos": {"banos": "Cer├ímica", "cocina": "Cer├ímica", "dormitorios": "Alfombra"}, "loggia": "No", "piscina": "No", "quincho": "No", "riego_automatico": "No", "porton_automatico": "No"}', 'Venta Casa en Los Andes 3D 2B', '┬íGran Oportunidad en Los Andes! Venta de Casa.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 3 amplios dormitorios y 2 ba├▒os, ideal para la comodidad que buscas. Son 108 m┬▓ construidos perfectamente distribuidos.\n\n┬┐Buscas calidad de vida?  \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', NULL, 'PUBLICADA', '2026-01-19 11:36:41.208468', '/uploads/1769632129212-935179621.jpeg', 'Marlen Teresita Guzman', 't', 't', 't', 't', '{"yapo": true, "doomos": true, "enlace": true, "icasas": true, "toctoc": true, "goplaceit": true, "pi_solicitud": true, "portal_terreno": true, "portal_inmobiliario": true}', '2026-02-03 16:16:56.067607', '2026-02-03 16:16:56.067607');
INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('4', '4', 'Departamento', '00000-00000', 'f', 't', '2100', 'UF', 'f', '0', '$', '137000', '0', 't', 'Metropolitana', 'Independencia', '', 'Ferm├¡n Vivaceta ', '1702', '', '1', '1', '0', '0', '0', '0', '1', '{"pisos": {"banos": "Cer├ímica", "cocina": "Cer├ímica", "dormitorios": "Piso Flotante"}, "jacuzzi": "No", "piscina": "Si", "quincho": "Si", "ventanas": "", "calefaccion": "", "riego_automatico": "Si", "porton_automatico": "Si"}', 'Venta Departamento en Independencia 1D 1B', '┬íGran Oportunidad en Independencia! Venta de Departamento.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 1 amplios dormitorios y 1 ba├▒os, ideal para la comodidad que buscas. Son  perfectamente distribuidos.\n\n┬┐Buscas calidad de vida? Aqu├¡ podr├ís disfrutar de: piscina, quincho, terraza, riego autom├ítico, port├│n autom├ítico. \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', '+56959801012', 'PUBLICADA', '2026-02-02 16:47:14.849368', '/uploads/1770384695251-608481801.jpeg', NULL, 't', 'f', 'f', 'f', '{}', '2026-02-03 16:16:56.067607', NULL);
INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('5', '4', 'Departamento', '00000-00000', 'f', 't', '2100', 'UF', 'f', '0', '$', '137000', '0', 't', 'Metropolitana', 'Independencia', '', 'Ferm├¡n Vivaceta ', '1702', '', '1', '1', '0', '0', '0', '0', '1', '{"pisos": {"banos": "Cer├ímica", "cocina": "Cer├ímica", "dormitorios": "Piso Flotante"}, "jacuzzi": "No", "piscina": "Si", "quincho": "Si", "ventanas": "", "calefaccion": "", "riego_automatico": "Si", "porton_automatico": "Si"}', 'Venta Departamento en Independencia 1D 1B', '┬íGran Oportunidad en Independencia! Venta de Departamento.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 1 amplios dormitorios y 1 ba├▒os, ideal para la comodidad que buscas. Son  perfectamente distribuidos.\n\n┬┐Buscas calidad de vida? Aqu├¡ podr├ís disfrutar de: piscina, quincho, terraza, riego autom├ítico, port├│n autom├ítico. \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', '+56959801012', 'PUBLICADA', '2026-02-06 11:40:16.656064', '/uploads/1770384695251-608481801.jpeg', NULL, 't', 'f', 'f', 'f', '{}', '2026-02-06 11:40:16.656064', NULL);
INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('6', '4', 'Departamento', '00000-00000', 'f', 't', '2100', 'UF', 'f', '0', '$', '137000', '0', 't', 'Metropolitana', 'Independencia', '', 'Ferm├¡n Vivaceta ', '1702', '', '1', '1', '0', '0', '0', '0', '1', '{"pisos": {"banos": "Cer├ímica", "cocina": "Cer├ímica", "dormitorios": "Piso Flotante"}, "jacuzzi": "No", "piscina": "Si", "quincho": "Si", "ventanas": "", "calefaccion": "", "riego_automatico": "Si", "porton_automatico": "Si"}', 'Venta Departamento en Independencia 1D 1B', '┬íGran Oportunidad en Independencia! Venta de Departamento.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 1 amplios dormitorios y 1 ba├▒os, ideal para la comodidad que buscas. Son  perfectamente distribuidos.\n\n┬┐Buscas calidad de vida? Aqu├¡ podr├ís disfrutar de: piscina, quincho, terraza, riego autom├ítico, port├│n autom├ítico. \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', '+56959801012', 'PUBLICADA', '2026-02-06 11:40:16.656064', '/uploads/1770384695251-608481801.jpeg', NULL, 't', 'f', 'f', 'f', '{}', '2026-02-06 11:40:16.656064', NULL);
INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('7', '4', 'Departamento', '00000-00000', 'f', 't', '2100', 'UF', 'f', '0', '$', '137000', '0', 't', 'Metropolitana', 'Independencia', '', 'Ferm├¡n Vivaceta ', '1702', '', '1', '1', '0', '0', '0', '0', '1', '{"pisos": {"banos": "Cer├ímica", "cocina": "Cer├ímica", "dormitorios": "Piso Flotante"}, "jacuzzi": "No", "piscina": "Si", "quincho": "Si", "ventanas": "", "calefaccion": "", "riego_automatico": "Si", "porton_automatico": "Si"}', 'Venta Departamento en Independencia 1D 1B', '┬íGran Oportunidad en Independencia! Venta de Departamento.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 1 amplios dormitorios y 1 ba├▒os, ideal para la comodidad que buscas. Son  perfectamente distribuidos.\n\n┬┐Buscas calidad de vida? Aqu├¡ podr├ís disfrutar de: piscina, quincho, terraza, riego autom├ítico, port├│n autom├ítico. \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', '+56959801012', 'PUBLICADA', '2026-02-06 11:40:16.656064', '/uploads/1770384695251-608481801.jpeg', NULL, 't', 'f', 'f', 'f', '{}', '2026-02-06 11:40:16.656064', NULL);
INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('8', '4', 'Departamento', '00000-00000', 'f', 't', '2100', 'UF', 'f', '0', '$', '137000', '0', 't', 'Metropolitana', 'Independencia', '', 'Ferm├¡n Vivaceta ', '1702', '', '1', '1', '0', '0', '0', '0', '1', '{"pisos": {"banos": "Cer├ímica", "cocina": "Cer├ímica", "dormitorios": "Piso Flotante"}, "jacuzzi": "No", "piscina": "Si", "quincho": "Si", "ventanas": "", "calefaccion": "", "riego_automatico": "Si", "porton_automatico": "Si"}', 'Venta Departamento en Independencia 1D 1B', '┬íGran Oportunidad en Independencia! Venta de Departamento.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 1 amplios dormitorios y 1 ba├▒os, ideal para la comodidad que buscas. Son  perfectamente distribuidos.\n\n┬┐Buscas calidad de vida? Aqu├¡ podr├ís disfrutar de: piscina, quincho, terraza, riego autom├ítico, port├│n autom├ítico. \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', '+56959801012', 'PUBLICADA', '2026-02-06 11:40:16.656064', '/uploads/1770384695251-608481801.jpeg', NULL, 't', 'f', 'f', 'f', '{}', '2026-02-06 11:40:16.656064', NULL);
INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('9', '4', 'Departamento', '00000-00000', 'f', 't', '2100', 'UF', 'f', '0', '$', '137000', '0', 't', 'Metropolitana', 'Independencia', '', 'Ferm├¡n Vivaceta ', '1702', '', '1', '1', '0', '0', '0', '0', '1', '{"pisos": {"banos": "Cer├ímica", "cocina": "Cer├ímica", "dormitorios": "Piso Flotante"}, "jacuzzi": "No", "piscina": "Si", "quincho": "Si", "ventanas": "", "calefaccion": "", "riego_automatico": "Si", "porton_automatico": "Si"}', 'Venta Departamento en Independencia 1D 1B', '┬íGran Oportunidad en Independencia! Venta de Departamento.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 1 amplios dormitorios y 1 ba├▒os, ideal para la comodidad que buscas. Son  perfectamente distribuidos.\n\n┬┐Buscas calidad de vida? Aqu├¡ podr├ís disfrutar de: piscina, quincho, terraza, riego autom├ítico, port├│n autom├ítico. \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', '+56959801012', 'PUBLICADA', '2026-02-06 11:40:16.656064', '/uploads/1770384695251-608481801.jpeg', NULL, 't', 'f', 'f', 'f', '{}', '2026-02-06 11:40:16.656064', NULL);
INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('10', '4', 'Departamento', '00000-00000', 'f', 't', '2100', 'UF', 'f', '0', '$', '137000', '0', 't', 'Metropolitana', 'Independencia', '', 'Ferm├¡n Vivaceta ', '1702', '', '1', '1', '0', '0', '0', '0', '1', '{"pisos": {"banos": "Cer├ímica", "cocina": "Cer├ímica", "dormitorios": "Piso Flotante"}, "jacuzzi": "No", "piscina": "Si", "quincho": "Si", "ventanas": "", "calefaccion": "", "riego_automatico": "Si", "porton_automatico": "Si"}', 'Venta Departamento en Independencia 1D 1B', '┬íGran Oportunidad en Independencia! Venta de Departamento.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 1 amplios dormitorios y 1 ba├▒os, ideal para la comodidad que buscas. Son  perfectamente distribuidos.\n\n┬┐Buscas calidad de vida? Aqu├¡ podr├ís disfrutar de: piscina, quincho, terraza, riego autom├ítico, port├│n autom├ítico. \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', '+56959801012', 'PUBLICADA', '2026-02-06 11:40:16.656064', '/uploads/1770384695251-608481801.jpeg', NULL, 't', 'f', 'f', 'f', '{}', '2026-02-06 11:40:16.656064', NULL);
INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('11', '4', 'Departamento', '00000-00000', 'f', 't', '2100', 'UF', 'f', '0', '$', '137000', '0', 't', 'Metropolitana', 'Independencia', '', 'Ferm├¡n Vivaceta ', '1702', '', '1', '1', '0', '0', '0', '0', '1', '{"pisos": {"banos": "Cer├ímica", "cocina": "Cer├ímica", "dormitorios": "Piso Flotante"}, "jacuzzi": "No", "piscina": "Si", "quincho": "Si", "ventanas": "", "calefaccion": "", "riego_automatico": "Si", "porton_automatico": "Si"}', 'Venta Departamento en Independencia 1D 1B', '┬íGran Oportunidad en Independencia! Venta de Departamento.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 1 amplios dormitorios y 1 ba├▒os, ideal para la comodidad que buscas. Son  perfectamente distribuidos.\n\n┬┐Buscas calidad de vida? Aqu├¡ podr├ís disfrutar de: piscina, quincho, terraza, riego autom├ítico, port├│n autom├ítico. \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', '+56959801012', 'PUBLICADA', '2026-02-06 11:40:16.656064', '/uploads/1770384695251-608481801.jpeg', NULL, 't', 'f', 'f', 'f', '{}', '2026-02-06 11:40:16.656064', NULL);
INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('12', '4', 'Departamento', '00000-00000', 'f', 't', '2100', 'UF', 'f', '0', '$', '137000', '0', 't', 'Metropolitana', 'Independencia', '', 'Ferm├¡n Vivaceta ', '1702', '', '1', '1', '0', '0', '0', '0', '1', '{"pisos": {"banos": "Cer├ímica", "cocina": "Cer├ímica", "dormitorios": "Piso Flotante"}, "jacuzzi": "No", "piscina": "Si", "quincho": "Si", "ventanas": "", "calefaccion": "", "riego_automatico": "Si", "porton_automatico": "Si"}', 'Venta Departamento en Independencia 1D 1B', '┬íGran Oportunidad en Independencia! Venta de Departamento.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 1 amplios dormitorios y 1 ba├▒os, ideal para la comodidad que buscas. Son  perfectamente distribuidos.\n\n┬┐Buscas calidad de vida? Aqu├¡ podr├ís disfrutar de: piscina, quincho, terraza, riego autom├ítico, port├│n autom├ítico. \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', '+56959801012', 'PUBLICADA', '2026-02-06 11:40:16.656064', '/uploads/1770384695251-608481801.jpeg', NULL, 't', 'f', 'f', 'f', '{}', '2026-02-06 11:40:16.656064', NULL);
INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('13', '4', 'Departamento', '00000-00000', 'f', 't', '2100', 'UF', 'f', '0', '$', '137000', '0', 't', 'Metropolitana', 'Independencia', '', 'Ferm├¡n Vivaceta ', '1702', '', '1', '1', '0', '0', '0', '0', '1', '{"pisos": {"banos": "Cer├ímica", "cocina": "Cer├ímica", "dormitorios": "Piso Flotante"}, "jacuzzi": "No", "piscina": "Si", "quincho": "Si", "ventanas": "", "calefaccion": "", "riego_automatico": "Si", "porton_automatico": "Si"}', 'Venta Departamento en Independencia 1D 1B', '┬íGran Oportunidad en Independencia! Venta de Departamento.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 1 amplios dormitorios y 1 ba├▒os, ideal para la comodidad que buscas. Son  perfectamente distribuidos.\n\n┬┐Buscas calidad de vida? Aqu├¡ podr├ís disfrutar de: piscina, quincho, terraza, riego autom├ítico, port├│n autom├ítico. \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', '+56959801012', 'PUBLICADA', '2026-02-06 11:40:16.656064', '/uploads/1770384695251-608481801.jpeg', NULL, 't', 'f', 'f', 'f', '{}', '2026-02-06 11:40:16.656064', NULL);
INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('14', '4', 'Departamento', '00000-00000', 'f', 't', '2100', 'UF', 'f', '0', '$', '137000', '0', 't', 'Metropolitana', 'Independencia', '', 'Ferm├¡n Vivaceta ', '1702', '', '1', '1', '0', '0', '0', '0', '1', '{"pisos": {"banos": "Cer├ímica", "cocina": "Cer├ímica", "dormitorios": "Piso Flotante"}, "jacuzzi": "No", "piscina": "Si", "quincho": "Si", "ventanas": "", "calefaccion": "", "riego_automatico": "Si", "porton_automatico": "Si"}', 'Venta Departamento en Independencia 1D 1B', '┬íGran Oportunidad en Independencia! Venta de Departamento.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 1 amplios dormitorios y 1 ba├▒os, ideal para la comodidad que buscas. Son  perfectamente distribuidos.\n\n┬┐Buscas calidad de vida? Aqu├¡ podr├ís disfrutar de: piscina, quincho, terraza, riego autom├ítico, port├│n autom├ítico. \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', '+56959801012', 'PUBLICADA', '2026-02-06 11:40:16.656064', '/uploads/1770384695251-608481801.jpeg', NULL, 't', 'f', 'f', 'f', '{}', '2026-02-06 11:40:16.656064', NULL);
INSERT INTO public.propiedades2 (id, propietario_id, tipo_propiedad, rol_sii, exclusividad, operacion_venta, precio_venta, moneda_venta, operacion_arriendo, precio_arriendo, moneda_arriendo, gastos_comunes, contribuciones, canje, region, comuna, sector, direccion_calle, direccion_numero, direccion_unidad, dormitorios, banos, suites, superficie_util, superficie_total, estacionamientos, bodegas, detalles_json, titulo_publicacion, descripcion_publica, observaciones_internas, forma_visita, estado_publicacion, fecha_creacion, imagen_principal, ejecutivo_asignado, publicar_internet, es_destacada, es_vendida, es_arrendada, portales_json, fecha_publicacion, fecha_venta) VALUES ('15', '5', 'Casa', '00000-00000', 'f', 'f', '0', 'UF', 't', '3000000', '$', '0', '0', 't', 'Valpara├¡so', 'Los Andes', '', 'Chacabuco', '245', '', '13', '7', '0', '0', '0', '0', '1', '{"pisos": {"banos": "Cer├ímica", "cocina": "Cer├ímica", "dormitorios": "Cer├ímica"}, "jacuzzi": "No", "piscina": "No", "quincho": "No", "ventanas": "", "calefaccion": "", "riego_automatico": "No", "porton_automatico": "No"}', 'Arriendo Casa en Los Andes 13D 7B', '┬íGran Oportunidad en Los Andes! Arriendo de Casa.\n\nDisfruta de vivir , en una propiedad pensada para tu familia. Esta excelente unidad cuenta con 13 amplios dormitorios y 7 ba├▒os, ideal para la comodidad que buscas. Son  perfectamente distribuidos.\n\n┬┐Buscas calidad de vida?  \n\n┬íNo dejes pasar esta oportunidad! Cont├íctanos hoy mismo para agendar tu visita.', '', '+56959801912', 'PUBLICADA', '2026-02-10 12:01:10.838509', '/uploads/1770735731934-987845191.jpg', NULL, 't', 'f', 'f', 'f', '{}', '2026-02-10 12:01:10.838509', NULL);


--
-- Data for Name: propietarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.propietarios (id, rut, nombre_completo, email, telefono, tipo_documento, es_activo, rating, comentarios, fecha_registro) VALUES ('1', '20956936-1', 'Juan P├®rez', 'ignacio.ojeda2002@gmail.com', '+56959801912', 'rut', 't', '5', '', '2026-01-16 15:30:21.033811');
INSERT INTO public.propietarios (id, rut, nombre_completo, email, telefono, tipo_documento, es_activo, rating, comentarios, fecha_registro) VALUES ('2', '21904415-1', 'Valentina Paz Soto Paz', 'ignacio.puchu2002@gmail.com', '9 8765 4321', 'rut', 't', '3', 'Due├▒a vive en la propiedad, llamar despu├®s de las 18:00 hrs.', '2026-01-30 16:12:36.55527');
INSERT INTO public.propietarios (id, rut, nombre_completo, email, telefono, tipo_documento, es_activo, rating, comentarios, fecha_registro) VALUES ('3', '16606160-1', 'Camila  P├®rez Hola', 'ignacio.puchu2002@gmail.com', '+56959801912', 'rut', 't', '3', '', '2026-02-02 13:10:16.865496');
INSERT INTO public.propietarios (id, rut, nombre_completo, email, telefono, tipo_documento, es_activo, rating, comentarios, fecha_registro) VALUES ('4', '106484845-6', 'Camilo ├ülvaro M├╝ller Hola', 'ignacio.ojeda2002@gmail.com', '+56959801912', 'rut', 't', '3', '', '2026-02-02 16:47:14.849368');
INSERT INTO public.propietarios (id, rut, nombre_completo, email, telefono, tipo_documento, es_activo, rating, comentarios, fecha_registro) VALUES ('5', '13469532-3', 'Camilo Quiroga P├®rez', 'ignacio.ojeda2002@icloud.com', '+56959801912', 'rut', 't', '5', '', '2026-02-10 12:01:10.838509');
INSERT INTO public.propietarios (id, rut, nombre_completo, email, telefono, tipo_documento, es_activo, rating, comentarios, fecha_registro) VALUES ('6', '17786044-1', 'Mario P├®rez P├®rez', 'ignacio.ojedaci@mayor.cl', '+56959801912', 'rut', 't', '5', '', '2026-02-11 16:54:34.214378');


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios (id, nombre_completo, username, password, email, telefono, rol, created_at, temp_password_hash, temp_password_expires) VALUES ('8', 'Camilo Juanez', 'cjuanez', 'MG-6390', 'ignacio.ojeda2002@gmail.com', '+56959801912', 'cliente', '2026-01-26 16:15:22.019733', NULL, NULL);
INSERT INTO public.usuarios (id, nombre_completo, username, password, email, telefono, rol, created_at, temp_password_hash, temp_password_expires) VALUES ('9', 'Test User', 'testuser8019', 'password123', 'test.case3020@example.com', '123456789', 'cliente', '2026-02-06 18:41:10.569047', NULL, NULL);
INSERT INTO public.usuarios (id, nombre_completo, username, password, email, telefono, rol, created_at, temp_password_hash, temp_password_expires) VALUES ('10', 'Test User', 'testuser1816', 'password123', 'test.case9407@example.com', '123456789', 'cliente', '2026-02-06 18:41:49.747813', NULL, NULL);
INSERT INTO public.usuarios (id, nombre_completo, username, password, email, telefono, rol, created_at, temp_password_hash, temp_password_expires) VALUES ('11', 'Test User', 'testuser675', 'password123', 'test.case5070@example.com', '123456789', 'cliente', '2026-02-06 18:42:39.822652', NULL, NULL);
INSERT INTO public.usuarios (id, nombre_completo, username, password, email, telefono, rol, created_at, temp_password_hash, temp_password_expires) VALUES ('12', 'Batch User', 'batchuser8484', '123', 'test.batch@example.com', '123456', 'cliente', '2026-02-06 18:57:06.956012', NULL, NULL);
INSERT INTO public.usuarios (id, nombre_completo, username, password, email, telefono, rol, created_at, temp_password_hash, temp_password_expires) VALUES ('13', 'Enc User', 'encuser11532', '$2b$10$HVFxHzE18bdz.mNPMsO88uOYJVynB1ad2jNMIptRgWWG3g3sqc5Lu', 'enc.test13265@example.com', '999999', 'cliente', '2026-02-06 19:21:30.663574', NULL, NULL);
INSERT INTO public.usuarios (id, nombre_completo, username, password, email, telefono, rol, created_at, temp_password_hash, temp_password_expires) VALUES ('5', 'Emilio Juan P├®rez M├╝ller', 'ejpm2026', '$2b$10$VV5Amn/31AYJKYOt9C/5VeuCrNu68pfRt7QJS28m5bSub9p/FpaWO', 'ignacio.ojeda2002@icloud.com', '+56959801912', 'cliente', '2026-01-02 13:36:33.738724', NULL, NULL);
INSERT INTO public.usuarios (id, nombre_completo, username, password, email, telefono, rol, created_at, temp_password_hash, temp_password_expires) VALUES ('7', 'Kamila M├╝ller', 'kmm2026', 'Puchu2771@', 'ojedaciigna@gmail.com', '+56959801912', 'cliente', '2026-01-02 16:52:23.597624', '$2b$10$FFfItMiOMnF7QZY1XRyn9OLrhZhXRG0j6orVCzYyXUtpvflK1KDOm', '2026-02-11 16:12:26.62022');
INSERT INTO public.usuarios (id, nombre_completo, username, password, email, telefono, rol, created_at, temp_password_hash, temp_password_expires) VALUES ('3', 'Camilo M├£ller', 'cmuller', '$2b$10$B0aBKS4mPX.yWfjMSJRl0eWxYDO49VPH.cmtnxQQW8K7BkTxkTyRC', 'ignacio.ojedaci@mayor.cl', '+56912345678', 'admin', '2025-12-26 13:26:57.327977', NULL, NULL);
INSERT INTO public.usuarios (id, nombre_completo, username, password, email, telefono, rol, created_at, temp_password_hash, temp_password_expires) VALUES ('6', 'Juana M├╝ller', 'jm20926', '$2b$10$zv6i3Xebh.C3QHskmrnsxeO1wNib3TkpEiksiFdutADh8f.vHvR26', 'ignacio.puchu2002@gmail.com', '+56959801912', 'cliente', '2026-01-02 16:43:54.856301', NULL, NULL);


--
-- Data for Name: visitas_web; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.visitas_web (id, fecha, contador) VALUES ('1', '2026-01-27', '85');
INSERT INTO public.visitas_web (id, fecha, contador) VALUES ('2', '2026-01-28', '120');
INSERT INTO public.visitas_web (id, fecha, contador) VALUES ('3', '2026-01-29', '167');
INSERT INTO public.visitas_web (id, fecha, contador) VALUES ('4', '2026-01-30', '210');
INSERT INTO public.visitas_web (id, fecha, contador) VALUES ('5', '2026-01-31', '98');
INSERT INTO public.visitas_web (id, fecha, contador) VALUES ('6', '2026-02-01', '145');
INSERT INTO public.visitas_web (id, fecha, contador) VALUES ('7', '2026-02-02', '2');
INSERT INTO public.visitas_web (id, fecha, contador) VALUES ('9', '2026-02-03', '2');
INSERT INTO public.visitas_web (id, fecha, contador) VALUES ('50', '2026-02-06', '19');
INSERT INTO public.visitas_web (id, fecha, contador) VALUES ('11', '2026-02-04', '24');
INSERT INTO public.visitas_web (id, fecha, contador) VALUES ('69', '2026-02-09', '22');
INSERT INTO public.visitas_web (id, fecha, contador) VALUES ('35', '2026-02-05', '15');
INSERT INTO public.visitas_web (id, fecha, contador) VALUES ('122', '2026-02-11', '37');
INSERT INTO public.visitas_web (id, fecha, contador) VALUES ('159', '2026-02-12', '1');
INSERT INTO public.visitas_web (id, fecha, contador) VALUES ('91', '2026-02-10', '31');


--
-- Name: citas2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citas2_id_seq', 4, true);


--
-- Name: citas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citas_id_seq', 32, true);


--
-- Name: historias_exito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historias_exito_id_seq', 2, true);


--
-- Name: lead_documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lead_documentos_id_seq', 1, false);


--
-- Name: leads2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.leads2_id_seq', 3, true);


--
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.leads_id_seq', 6, true);


--
-- Name: mensajes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mensajes_id_seq', 1, false);


--
-- Name: propiedad_bitacora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.propiedad_bitacora_id_seq', 2, true);


--
-- Name: propiedad_documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.propiedad_documentos_id_seq', 3, true);


--
-- Name: propiedad_imagenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.propiedad_imagenes_id_seq', 523, true);


--
-- Name: propiedad_informes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.propiedad_informes_id_seq', 1, true);


--
-- Name: propiedades2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.propiedades2_id_seq', 16, true);


--
-- Name: propiedades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.propiedades_id_seq', 25, true);


--
-- Name: propietarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.propietarios_id_seq', 6, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 13, true);


--
-- Name: visitas_web_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visitas_web_id_seq', 159, true);


--
-- Name: citas2 citas2_fecha_hora_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas2
    ADD CONSTRAINT citas2_fecha_hora_key UNIQUE (fecha, hora);


--
-- Name: citas2 citas2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas2
    ADD CONSTRAINT citas2_pkey PRIMARY KEY (id);


--
-- Name: citas citas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_pkey PRIMARY KEY (id);


--
-- Name: historias_exito historias_exito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historias_exito
    ADD CONSTRAINT historias_exito_pkey PRIMARY KEY (id);


--
-- Name: lead_documentos lead_documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lead_documentos
    ADD CONSTRAINT lead_documentos_pkey PRIMARY KEY (id);


--
-- Name: leads2 leads2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leads2
    ADD CONSTRAINT leads2_pkey PRIMARY KEY (id);


--
-- Name: leads leads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (id);


--
-- Name: mensajes mensajes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT mensajes_pkey PRIMARY KEY (id);


--
-- Name: propiedad_bitacora propiedad_bitacora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedad_bitacora
    ADD CONSTRAINT propiedad_bitacora_pkey PRIMARY KEY (id);


--
-- Name: propiedad_documentos propiedad_documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedad_documentos
    ADD CONSTRAINT propiedad_documentos_pkey PRIMARY KEY (id);


--
-- Name: propiedad_imagenes propiedad_imagenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedad_imagenes
    ADD CONSTRAINT propiedad_imagenes_pkey PRIMARY KEY (id);


--
-- Name: propiedad_informes propiedad_informes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedad_informes
    ADD CONSTRAINT propiedad_informes_pkey PRIMARY KEY (id);


--
-- Name: propiedades2 propiedades2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedades2
    ADD CONSTRAINT propiedades2_pkey PRIMARY KEY (id);


--
-- Name: propiedades propiedades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedades
    ADD CONSTRAINT propiedades_pkey PRIMARY KEY (id);


--
-- Name: propietarios propietarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propietarios
    ADD CONSTRAINT propietarios_pkey PRIMARY KEY (id);


--
-- Name: propietarios propietarios_rut_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propietarios
    ADD CONSTRAINT propietarios_rut_key UNIQUE (rut);


--
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_username_key UNIQUE (username);


--
-- Name: visitas_web visitas_web_fecha_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitas_web
    ADD CONSTRAINT visitas_web_fecha_key UNIQUE (fecha);


--
-- Name: visitas_web visitas_web_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitas_web
    ADD CONSTRAINT visitas_web_pkey PRIMARY KEY (id);


--
-- Name: citas update_citas_modtime; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_citas_modtime BEFORE UPDATE ON public.citas FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: lead_documentos lead_documentos_lead_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lead_documentos
    ADD CONSTRAINT lead_documentos_lead_id_fkey FOREIGN KEY (lead_id) REFERENCES public.leads2(id) ON DELETE CASCADE;


--
-- Name: propiedad_bitacora propiedad_bitacora_propiedad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedad_bitacora
    ADD CONSTRAINT propiedad_bitacora_propiedad_id_fkey FOREIGN KEY (propiedad_id) REFERENCES public.propiedades2(id) ON DELETE CASCADE;


--
-- Name: propiedad_documentos propiedad_documentos_propiedad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedad_documentos
    ADD CONSTRAINT propiedad_documentos_propiedad_id_fkey FOREIGN KEY (propiedad_id) REFERENCES public.propiedades2(id) ON DELETE CASCADE;


--
-- Name: propiedad_imagenes propiedad_imagenes_propiedad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedad_imagenes
    ADD CONSTRAINT propiedad_imagenes_propiedad_id_fkey FOREIGN KEY (propiedad_id) REFERENCES public.propiedades2(id) ON DELETE CASCADE;


--
-- Name: propiedad_informes propiedad_informes_propiedad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedad_informes
    ADD CONSTRAINT propiedad_informes_propiedad_id_fkey FOREIGN KEY (propiedad_id) REFERENCES public.propiedades2(id) ON DELETE CASCADE;


--
-- Name: propiedades2 propiedades2_propietario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propiedades2
    ADD CONSTRAINT propiedades2_propietario_id_fkey FOREIGN KEY (propietario_id) REFERENCES public.propietarios(id);


--
-- PostgreSQL database dump complete
--



