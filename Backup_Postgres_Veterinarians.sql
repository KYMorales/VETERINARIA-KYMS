--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.0

-- Started on 2025-10-15 22:13:49

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "VETERINARIANS_KYMS_DB";
--
-- TOC entry 3667 (class 1262 OID 106497)
-- Name: VETERINARIANS_KYMS_DB; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "VETERINARIANS_KYMS_DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


\connect "VETERINARIANS_KYMS_DB"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 259 (class 1255 OID 131073)
-- Name: buscar_mascotas_por_dueño(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public."buscar_mascotas_por_dueño"(p_owner_id integer) RETURNS TABLE(petname character varying, ownername character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT p."name" AS petname, o."name" AS ownername
    FROM pets p
    INNER JOIN owners o ON p.owner_id = o.id
    WHERE o.id = p_owner_id;
END;
$$;


--
-- TOC entry 262 (class 1255 OID 131074)
-- Name: buscar_mascotas_por_nombre_parcial(character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.buscar_mascotas_por_nombre_parcial(p_part_name character varying) RETURNS TABLE(petname character varying, ownername character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT p."name" AS petname, o."name" AS ownername
    FROM pets p
    INNER JOIN owners o ON p.owner_id = o.id
    WHERE p."name" ILIKE '%' || p_part_name || '%';
END;
$$;


--
-- TOC entry 269 (class 1255 OID 131077)
-- Name: citas_dentro_rango_fechas(timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.citas_dentro_rango_fechas(p_start_date timestamp without time zone, p_end_date timestamp without time zone) RETURNS TABLE(appointment_id integer, pet_name character varying, owner_name character varying, appointment_date timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        a.id AS appointment_id,
        p.name AS pet_name,
        o.name AS owner_name,
        a.date AS appointment_date
    FROM appointments a
    INNER JOIN pets p ON a.pet_id = p.id
    INNER JOIN owners o ON p.owner_id = o.id
    WHERE a.date BETWEEN p_start_date AND p_end_date
    ORDER BY a.date;
END;
$$;


--
-- TOC entry 276 (class 1255 OID 131081)
-- Name: listar_informacion_completa_mascotas(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.listar_informacion_completa_mascotas() RETURNS TABLE(pet_id integer, pet_name character varying, owner_name character varying, last_appointment timestamp without time zone, medical_description text, vaccine_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.id AS pet_id,
        p.name AS pet_name,
        o.name AS owner_name,
        a.date AS last_appointment,
        mh.description AS medical_description,
        v.name AS vaccine_name
    FROM pets p
    INNER JOIN owners o ON p.owner_id = o.id
    LEFT JOIN appointments a ON p.id = a.pet_id
    LEFT JOIN medical_histories mh ON p.id = mh.pet_id
    LEFT JOIN vaccines v ON v.id = mh.id; -- relación simulada (si luego creas una tabla intermedia pet_vaccines, se ajusta aquí)
END;
$$;


--
-- TOC entry 270 (class 1255 OID 131078)
-- Name: mostrar_nombres_de_mascotas_y_sus_dueños(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public."mostrar_nombres_de_mascotas_y_sus_dueños"() RETURNS TABLE(pet_name character varying, owner_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.name AS pet_name,
        o.name AS owner_name
    FROM pets p
    INNER JOIN owners o ON p.owner_id = o.id;
END;
$$;


--
-- TOC entry 271 (class 1255 OID 131079)
-- Name: todas_las_mascotas_y_sus_dueños_si_existen(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public."todas_las_mascotas_y_sus_dueños_si_existen"() RETURNS TABLE(pet_name character varying, owner_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.name AS pet_name,
        o.name AS owner_name
    FROM pets p
    LEFT JOIN owners o ON p.owner_id = o.id;
END;
$$;


--
-- TOC entry 279 (class 1255 OID 131096)
-- Name: trg_ad_appointments(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_ad_appointments() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO appointments_audit(appointment_id, action_type, before_data, after_data)
  VALUES (OLD.id, 'DELETE', to_jsonb(OLD), NULL);
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN OLD;
END;
$$;


--
-- TOC entry 296 (class 1255 OID 131118)
-- Name: trg_ad_medical_histories(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_ad_medical_histories() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO medical_histories_audit(medical_history_id, action_type, before_data, after_data)
  VALUES (OLD.id, 'DELETE', to_jsonb(OLD), NULL);
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN OLD;
END;
$$;


--
-- TOC entry 302 (class 1255 OID 131140)
-- Name: trg_ad_owners(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_ad_owners() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO owners_audit(owner_id, action_type, before_data, after_data)
  VALUES (OLD.id, 'DELETE', to_jsonb(OLD), NULL);
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN OLD;
END;
$$;


--
-- TOC entry 308 (class 1255 OID 131162)
-- Name: trg_ad_payments(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_ad_payments() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO payments_audit(payment_id, action_type, before_data, after_data)
  VALUES (OLD.id, 'DELETE', to_jsonb(OLD), NULL);
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN OLD;
END;
$$;


--
-- TOC entry 263 (class 1255 OID 131184)
-- Name: trg_ad_pets(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_ad_pets() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO pets_audit(pet_id, action_type, before_data, after_data)
  VALUES (OLD.id, 'DELETE', to_jsonb(OLD), NULL);
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN OLD;
END;
$$;


--
-- TOC entry 312 (class 1255 OID 131228)
-- Name: trg_ad_prescription_medications(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_ad_prescription_medications() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO prescription_medications_audit(prescription_medication_id, action_type, before_data, after_data)
  VALUES (OLD.id, 'DELETE', to_jsonb(OLD), NULL);
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN OLD;
END;
$$;


--
-- TOC entry 272 (class 1255 OID 131206)
-- Name: trg_ad_prescriptions(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_ad_prescriptions() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO prescriptions_audit(prescription_id, action_type, before_data, after_data)
  VALUES (OLD.id, 'DELETE', to_jsonb(OLD), NULL);
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN OLD;
END;
$$;


--
-- TOC entry 277 (class 1255 OID 131092)
-- Name: trg_ai_appointments(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_ai_appointments() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO appointments_audit(appointment_id, action_type, before_data, after_data)
  VALUES (NEW.id, 'INSERT', NULL, to_jsonb(NEW));
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN NEW;
END;
$$;


--
-- TOC entry 294 (class 1255 OID 131114)
-- Name: trg_ai_medical_histories(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_ai_medical_histories() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO medical_histories_audit(medical_history_id, action_type, before_data, after_data)
  VALUES (NEW.id, 'INSERT', NULL, to_jsonb(NEW));
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN NEW;
END;
$$;


--
-- TOC entry 300 (class 1255 OID 131136)
-- Name: trg_ai_owners(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_ai_owners() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO owners_audit(owner_id, action_type, before_data, after_data)
  VALUES (NEW.id, 'INSERT', NULL, to_jsonb(NEW));
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN NEW;
END;
$$;


--
-- TOC entry 306 (class 1255 OID 131158)
-- Name: trg_ai_payments(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_ai_payments() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO payments_audit(payment_id, action_type, before_data, after_data)
  VALUES (NEW.id, 'INSERT', NULL, to_jsonb(NEW));
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN NEW;
END;
$$;


--
-- TOC entry 260 (class 1255 OID 131180)
-- Name: trg_ai_pets(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_ai_pets() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO pets_audit(pet_id, action_type, before_data, after_data)
  VALUES (NEW.id, 'INSERT', NULL, to_jsonb(NEW));
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN NEW;
END;
$$;


--
-- TOC entry 310 (class 1255 OID 131224)
-- Name: trg_ai_prescription_medications(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_ai_prescription_medications() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO prescription_medications_audit(prescription_medication_id, action_type, before_data, after_data)
  VALUES (NEW.id, 'INSERT', NULL, to_jsonb(NEW));
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN NEW;
END;
$$;


--
-- TOC entry 267 (class 1255 OID 131202)
-- Name: trg_ai_prescriptions(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_ai_prescriptions() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO prescriptions_audit(prescription_id, action_type, before_data, after_data)
  VALUES (NEW.id, 'INSERT', NULL, to_jsonb(NEW));
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN NEW;
END;
$$;


--
-- TOC entry 278 (class 1255 OID 131094)
-- Name: trg_au_appointments(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_au_appointments() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO appointments_audit(appointment_id, action_type, before_data, after_data)
  VALUES (NEW.id, 'UPDATE', to_jsonb(OLD), to_jsonb(NEW));
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN NEW;
END;
$$;


--
-- TOC entry 295 (class 1255 OID 131116)
-- Name: trg_au_medical_histories(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_au_medical_histories() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO medical_histories_audit(medical_history_id, action_type, before_data, after_data)
  VALUES (NEW.id, 'UPDATE', to_jsonb(OLD), to_jsonb(NEW));
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN NEW;
END;
$$;


--
-- TOC entry 301 (class 1255 OID 131138)
-- Name: trg_au_owners(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_au_owners() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO owners_audit(owner_id, action_type, before_data, after_data)
  VALUES (NEW.id, 'UPDATE', to_jsonb(OLD), to_jsonb(NEW));
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN NEW;
END;
$$;


--
-- TOC entry 307 (class 1255 OID 131160)
-- Name: trg_au_payments(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_au_payments() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO payments_audit(payment_id, action_type, before_data, after_data)
  VALUES (NEW.id, 'UPDATE', to_jsonb(OLD), to_jsonb(NEW));
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN NEW;
END;
$$;


--
-- TOC entry 261 (class 1255 OID 131182)
-- Name: trg_au_pets(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_au_pets() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO pets_audit(pet_id, action_type, before_data, after_data)
  VALUES (NEW.id, 'UPDATE', to_jsonb(OLD), to_jsonb(NEW));
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN NEW;
END;
$$;


--
-- TOC entry 311 (class 1255 OID 131226)
-- Name: trg_au_prescription_medications(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_au_prescription_medications() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO prescription_medications_audit(prescription_medication_id, action_type, before_data, after_data)
  VALUES (NEW.id, 'UPDATE', to_jsonb(OLD), to_jsonb(NEW));
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN NEW;
END;
$$;


--
-- TOC entry 268 (class 1255 OID 131204)
-- Name: trg_au_prescriptions(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_au_prescriptions() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('audit.from_trigger', '1', true);
  INSERT INTO prescriptions_audit(prescription_id, action_type, before_data, after_data)
  VALUES (NEW.id, 'UPDATE', to_jsonb(OLD), to_jsonb(NEW));
  PERFORM set_config('audit.from_trigger', '', true);
  RETURN NEW;
END;
$$;


--
-- TOC entry 281 (class 1255 OID 131100)
-- Name: trg_bid_appointments_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_bid_appointments_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'appointments_audit es inmutable: DELETE prohibido.';
END;
$$;


--
-- TOC entry 298 (class 1255 OID 131122)
-- Name: trg_bid_medical_histories_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_bid_medical_histories_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'medical_histories_audit es inmutable: DELETE prohibido.';
END;
$$;


--
-- TOC entry 304 (class 1255 OID 131144)
-- Name: trg_bid_owners_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_bid_owners_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'owners_audit es inmutable: DELETE prohibido.';
END;
$$;


--
-- TOC entry 257 (class 1255 OID 131166)
-- Name: trg_bid_payments_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_bid_payments_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'payments_audit es inmutable: DELETE prohibido.';
END;
$$;


--
-- TOC entry 265 (class 1255 OID 131188)
-- Name: trg_bid_pets_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_bid_pets_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'pets_audit es inmutable: DELETE prohibido.';
END;
$$;


--
-- TOC entry 314 (class 1255 OID 131232)
-- Name: trg_bid_prescription_medications_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_bid_prescription_medications_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'prescription_medications_audit es inmutable: DELETE prohibido.';
END;
$$;


--
-- TOC entry 274 (class 1255 OID 131210)
-- Name: trg_bid_prescriptions_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_bid_prescriptions_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'prescriptions_audit es inmutable: DELETE prohibido.';
END;
$$;


--
-- TOC entry 292 (class 1255 OID 131102)
-- Name: trg_bii_appointments_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_bii_appointments_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  marker TEXT;
BEGIN
  marker := current_setting('audit.from_trigger', true);
  IF marker IS NULL OR marker <> '1' THEN
    RAISE EXCEPTION 'INSERT en appointments_audit solo permitido desde triggers internos.';
  END IF;
  RETURN NEW;
END;
$$;


--
-- TOC entry 299 (class 1255 OID 131124)
-- Name: trg_bii_medical_histories_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_bii_medical_histories_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE m TEXT;
BEGIN
  m := current_setting('audit.from_trigger', true);
  IF m IS NULL OR m <> '1' THEN
    RAISE EXCEPTION 'INSERT en medical_histories_audit solo permitido desde triggers internos.';
  END IF;
  RETURN NEW;
END;
$$;


--
-- TOC entry 305 (class 1255 OID 131146)
-- Name: trg_bii_owners_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_bii_owners_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE m TEXT;
BEGIN
  m := current_setting('audit.from_trigger', true);
  IF m IS NULL OR m <> '1' THEN
    RAISE EXCEPTION 'INSERT en owners_audit solo permitido desde triggers internos.';
  END IF;
  RETURN NEW;
END;
$$;


--
-- TOC entry 258 (class 1255 OID 131168)
-- Name: trg_bii_payments_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_bii_payments_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE m TEXT;
BEGIN
  m := current_setting('audit.from_trigger', true);
  IF m IS NULL OR m <> '1' THEN
    RAISE EXCEPTION 'INSERT en payments_audit solo permitido desde triggers internos.';
  END IF;
  RETURN NEW;
END;
$$;


--
-- TOC entry 266 (class 1255 OID 131190)
-- Name: trg_bii_pets_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_bii_pets_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE m TEXT;
BEGIN
  m := current_setting('audit.from_trigger', true);
  IF m IS NULL OR m <> '1' THEN
    RAISE EXCEPTION 'INSERT en pets_audit solo permitido desde triggers internos.';
  END IF;
  RETURN NEW;
END;
$$;


--
-- TOC entry 315 (class 1255 OID 131234)
-- Name: trg_bii_prescription_medications_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_bii_prescription_medications_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE m TEXT;
BEGIN
  m := current_setting('audit.from_trigger', true);
  IF m IS NULL OR m <> '1' THEN
    RAISE EXCEPTION 'INSERT en prescription_medications_audit solo permitido desde triggers internos.';
  END IF;
  RETURN NEW;
END;
$$;


--
-- TOC entry 275 (class 1255 OID 131212)
-- Name: trg_bii_prescriptions_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_bii_prescriptions_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE m TEXT;
BEGIN
  m := current_setting('audit.from_trigger', true);
  IF m IS NULL OR m <> '1' THEN
    RAISE EXCEPTION 'INSERT en prescriptions_audit solo permitido desde triggers internos.';
  END IF;
  RETURN NEW;
END;
$$;


--
-- TOC entry 280 (class 1255 OID 131098)
-- Name: trg_biu_appointments_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_biu_appointments_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'appointments_audit es inmutable: UPDATE prohibido.';
END;
$$;


--
-- TOC entry 297 (class 1255 OID 131120)
-- Name: trg_biu_medical_histories_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_biu_medical_histories_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'medical_histories_audit es inmutable: UPDATE prohibido.';
END;
$$;


--
-- TOC entry 303 (class 1255 OID 131142)
-- Name: trg_biu_owners_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_biu_owners_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'owners_audit es inmutable: UPDATE prohibido.';
END;
$$;


--
-- TOC entry 309 (class 1255 OID 131164)
-- Name: trg_biu_payments_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_biu_payments_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'payments_audit es inmutable: UPDATE prohibido.';
END;
$$;


--
-- TOC entry 264 (class 1255 OID 131186)
-- Name: trg_biu_pets_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_biu_pets_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'pets_audit es inmutable: UPDATE prohibido.';
END;
$$;


--
-- TOC entry 313 (class 1255 OID 131230)
-- Name: trg_biu_prescription_medications_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_biu_prescription_medications_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'prescription_medications_audit es inmutable: UPDATE prohibido.';
END;
$$;


--
-- TOC entry 273 (class 1255 OID 131208)
-- Name: trg_biu_prescriptions_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_biu_prescriptions_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'prescriptions_audit es inmutable: UPDATE prohibido.';
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 106543)
-- Name: appointments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    pet_id integer NOT NULL,
    veterinarian_id integer NOT NULL,
    date timestamp without time zone NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 131083)
-- Name: appointments_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.appointments_audit (
    id integer NOT NULL,
    appointment_id integer,
    action_type character varying(10),
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    before_data jsonb,
    after_data jsonb
);


--
-- TOC entry 243 (class 1259 OID 131082)
-- Name: appointments_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.appointments_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 243
-- Name: appointments_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.appointments_audit_id_seq OWNED BY public.appointments_audit.id;


--
-- TOC entry 225 (class 1259 OID 106542)
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.appointments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 225
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- TOC entry 242 (class 1259 OID 106654)
-- Name: laboratories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.laboratories (
    id integer NOT NULL,
    appointment_id integer NOT NULL,
    test_name character varying(100) NOT NULL,
    result text,
    test_date date NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 106653)
-- Name: laboratories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.laboratories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 241
-- Name: laboratories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.laboratories_id_seq OWNED BY public.laboratories.id;


--
-- TOC entry 222 (class 1259 OID 106519)
-- Name: medical_histories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.medical_histories (
    id integer NOT NULL,
    pet_id integer NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 246 (class 1259 OID 131105)
-- Name: medical_histories_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.medical_histories_audit (
    id integer NOT NULL,
    medical_history_id integer,
    action_type character varying(10),
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    before_data jsonb,
    after_data jsonb
);


--
-- TOC entry 245 (class 1259 OID 131104)
-- Name: medical_histories_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.medical_histories_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 245
-- Name: medical_histories_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.medical_histories_audit_id_seq OWNED BY public.medical_histories_audit.id;


--
-- TOC entry 221 (class 1259 OID 106518)
-- Name: medical_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.medical_histories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 221
-- Name: medical_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.medical_histories_id_seq OWNED BY public.medical_histories.id;


--
-- TOC entry 234 (class 1259 OID 106600)
-- Name: medications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.medications (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    dosage character varying(100)
);


--
-- TOC entry 233 (class 1259 OID 106599)
-- Name: medications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.medications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 233
-- Name: medications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.medications_id_seq OWNED BY public.medications.id;


--
-- TOC entry 218 (class 1259 OID 106500)
-- Name: owners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.owners (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    phone character varying(20),
    email character varying(100),
    address character varying(200)
);


--
-- TOC entry 248 (class 1259 OID 131127)
-- Name: owners_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.owners_audit (
    id integer NOT NULL,
    owner_id integer,
    action_type character varying(10),
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    before_data jsonb,
    after_data jsonb
);


--
-- TOC entry 247 (class 1259 OID 131126)
-- Name: owners_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.owners_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 247
-- Name: owners_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.owners_audit_id_seq OWNED BY public.owners_audit.id;


--
-- TOC entry 217 (class 1259 OID 106499)
-- Name: owners_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.owners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 217
-- Name: owners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.owners_id_seq OWNED BY public.owners.id;


--
-- TOC entry 240 (class 1259 OID 106642)
-- Name: payments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    appointment_id integer NOT NULL,
    amount numeric(10,2) NOT NULL,
    payment_date date NOT NULL
);


--
-- TOC entry 250 (class 1259 OID 131149)
-- Name: payments_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payments_audit (
    id integer NOT NULL,
    payment_id integer,
    action_type character varying(10),
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    before_data jsonb,
    after_data jsonb
);


--
-- TOC entry 249 (class 1259 OID 131148)
-- Name: payments_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payments_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 249
-- Name: payments_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payments_audit_id_seq OWNED BY public.payments_audit.id;


--
-- TOC entry 239 (class 1259 OID 106641)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3677 (class 0 OID 0)
-- Dependencies: 239
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- TOC entry 220 (class 1259 OID 106507)
-- Name: pets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pets (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    species character varying(50),
    breed character varying(50),
    birth_date date,
    owner_id integer NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 131171)
-- Name: pets_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pets_audit (
    id integer NOT NULL,
    pet_id integer,
    action_type character varying(10),
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    before_data jsonb,
    after_data jsonb
);


--
-- TOC entry 251 (class 1259 OID 131170)
-- Name: pets_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pets_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 251
-- Name: pets_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pets_audit_id_seq OWNED BY public.pets_audit.id;


--
-- TOC entry 219 (class 1259 OID 106506)
-- Name: pets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 219
-- Name: pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pets_id_seq OWNED BY public.pets.id;


--
-- TOC entry 238 (class 1259 OID 106623)
-- Name: prescription_medications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prescription_medications (
    id integer NOT NULL,
    prescription_id integer NOT NULL,
    medication_id integer NOT NULL,
    quantity integer,
    instructions text
);


--
-- TOC entry 256 (class 1259 OID 131215)
-- Name: prescription_medications_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prescription_medications_audit (
    id integer NOT NULL,
    prescription_medication_id integer,
    action_type character varying(10),
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    before_data jsonb,
    after_data jsonb
);


--
-- TOC entry 255 (class 1259 OID 131214)
-- Name: prescription_medications_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prescription_medications_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 255
-- Name: prescription_medications_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prescription_medications_audit_id_seq OWNED BY public.prescription_medications_audit.id;


--
-- TOC entry 237 (class 1259 OID 106622)
-- Name: prescription_medications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prescription_medications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 237
-- Name: prescription_medications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prescription_medications_id_seq OWNED BY public.prescription_medications.id;


--
-- TOC entry 236 (class 1259 OID 106609)
-- Name: prescriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prescriptions (
    id integer NOT NULL,
    appointment_id integer NOT NULL,
    notes text
);


--
-- TOC entry 254 (class 1259 OID 131193)
-- Name: prescriptions_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prescriptions_audit (
    id integer NOT NULL,
    prescription_id integer,
    action_type character varying(10),
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    before_data jsonb,
    after_data jsonb
);


--
-- TOC entry 253 (class 1259 OID 131192)
-- Name: prescriptions_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prescriptions_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3682 (class 0 OID 0)
-- Dependencies: 253
-- Name: prescriptions_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prescriptions_audit_id_seq OWNED BY public.prescriptions_audit.id;


--
-- TOC entry 235 (class 1259 OID 106608)
-- Name: prescriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prescriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3683 (class 0 OID 0)
-- Dependencies: 235
-- Name: prescriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prescriptions_id_seq OWNED BY public.prescriptions.id;


--
-- TOC entry 228 (class 1259 OID 106560)
-- Name: procedures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.procedures (
    id integer NOT NULL,
    appointment_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    cost numeric(10,2)
);


--
-- TOC entry 227 (class 1259 OID 106559)
-- Name: procedures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.procedures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3684 (class 0 OID 0)
-- Dependencies: 227
-- Name: procedures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.procedures_id_seq OWNED BY public.procedures.id;


--
-- TOC entry 232 (class 1259 OID 106583)
-- Name: vaccine_applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vaccine_applications (
    id integer NOT NULL,
    appointment_id integer NOT NULL,
    vaccine_id integer NOT NULL,
    application_date date NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 106582)
-- Name: vaccine_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vaccine_applications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3685 (class 0 OID 0)
-- Dependencies: 231
-- Name: vaccine_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vaccine_applications_id_seq OWNED BY public.vaccine_applications.id;


--
-- TOC entry 230 (class 1259 OID 106574)
-- Name: vaccines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vaccines (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


--
-- TOC entry 229 (class 1259 OID 106573)
-- Name: vaccines_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vaccines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3686 (class 0 OID 0)
-- Dependencies: 229
-- Name: vaccines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vaccines_id_seq OWNED BY public.vaccines.id;


--
-- TOC entry 224 (class 1259 OID 106536)
-- Name: veterinarians; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.veterinarians (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    specialty character varying(50)
);


--
-- TOC entry 223 (class 1259 OID 106535)
-- Name: veterinarians_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.veterinarians_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3687 (class 0 OID 0)
-- Dependencies: 223
-- Name: veterinarians_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.veterinarians_id_seq OWNED BY public.veterinarians.id;


--
-- TOC entry 3358 (class 2604 OID 106546)
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- TOC entry 3367 (class 2604 OID 131086)
-- Name: appointments_audit id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.appointments_audit ALTER COLUMN id SET DEFAULT nextval('public.appointments_audit_id_seq'::regclass);


--
-- TOC entry 3366 (class 2604 OID 106657)
-- Name: laboratories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.laboratories ALTER COLUMN id SET DEFAULT nextval('public.laboratories_id_seq'::regclass);


--
-- TOC entry 3355 (class 2604 OID 106522)
-- Name: medical_histories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medical_histories ALTER COLUMN id SET DEFAULT nextval('public.medical_histories_id_seq'::regclass);


--
-- TOC entry 3369 (class 2604 OID 131108)
-- Name: medical_histories_audit id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medical_histories_audit ALTER COLUMN id SET DEFAULT nextval('public.medical_histories_audit_id_seq'::regclass);


--
-- TOC entry 3362 (class 2604 OID 106603)
-- Name: medications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medications ALTER COLUMN id SET DEFAULT nextval('public.medications_id_seq'::regclass);


--
-- TOC entry 3353 (class 2604 OID 106503)
-- Name: owners id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.owners ALTER COLUMN id SET DEFAULT nextval('public.owners_id_seq'::regclass);


--
-- TOC entry 3371 (class 2604 OID 131130)
-- Name: owners_audit id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.owners_audit ALTER COLUMN id SET DEFAULT nextval('public.owners_audit_id_seq'::regclass);


--
-- TOC entry 3365 (class 2604 OID 106645)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 3373 (class 2604 OID 131152)
-- Name: payments_audit id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments_audit ALTER COLUMN id SET DEFAULT nextval('public.payments_audit_id_seq'::regclass);


--
-- TOC entry 3354 (class 2604 OID 106510)
-- Name: pets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pets ALTER COLUMN id SET DEFAULT nextval('public.pets_id_seq'::regclass);


--
-- TOC entry 3375 (class 2604 OID 131174)
-- Name: pets_audit id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pets_audit ALTER COLUMN id SET DEFAULT nextval('public.pets_audit_id_seq'::regclass);


--
-- TOC entry 3364 (class 2604 OID 106626)
-- Name: prescription_medications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prescription_medications ALTER COLUMN id SET DEFAULT nextval('public.prescription_medications_id_seq'::regclass);


--
-- TOC entry 3379 (class 2604 OID 131218)
-- Name: prescription_medications_audit id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prescription_medications_audit ALTER COLUMN id SET DEFAULT nextval('public.prescription_medications_audit_id_seq'::regclass);


--
-- TOC entry 3363 (class 2604 OID 106612)
-- Name: prescriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prescriptions ALTER COLUMN id SET DEFAULT nextval('public.prescriptions_id_seq'::regclass);


--
-- TOC entry 3377 (class 2604 OID 131196)
-- Name: prescriptions_audit id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prescriptions_audit ALTER COLUMN id SET DEFAULT nextval('public.prescriptions_audit_id_seq'::regclass);


--
-- TOC entry 3359 (class 2604 OID 106563)
-- Name: procedures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.procedures ALTER COLUMN id SET DEFAULT nextval('public.procedures_id_seq'::regclass);


--
-- TOC entry 3361 (class 2604 OID 106586)
-- Name: vaccine_applications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vaccine_applications ALTER COLUMN id SET DEFAULT nextval('public.vaccine_applications_id_seq'::regclass);


--
-- TOC entry 3360 (class 2604 OID 106577)
-- Name: vaccines id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vaccines ALTER COLUMN id SET DEFAULT nextval('public.vaccines_id_seq'::regclass);


--
-- TOC entry 3357 (class 2604 OID 106539)
-- Name: veterinarians id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.veterinarians ALTER COLUMN id SET DEFAULT nextval('public.veterinarians_id_seq'::regclass);


--
-- TOC entry 3631 (class 0 OID 106543)
-- Dependencies: 226
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.appointments VALUES (1, 1, 1, '2024-01-05 09:30:00');
INSERT INTO public.appointments VALUES (2, 2, 2, '2024-01-10 10:00:00');
INSERT INTO public.appointments VALUES (3, 3, 3, '2024-01-15 11:15:00');
INSERT INTO public.appointments VALUES (4, 4, 4, '2024-01-20 14:00:00');
INSERT INTO public.appointments VALUES (5, 5, 5, '2024-01-25 09:45:00');
INSERT INTO public.appointments VALUES (6, 6, 6, '2024-02-01 10:30:00');
INSERT INTO public.appointments VALUES (7, 7, 7, '2024-02-05 11:00:00');
INSERT INTO public.appointments VALUES (8, 8, 8, '2024-02-10 15:00:00');
INSERT INTO public.appointments VALUES (9, 9, 9, '2024-02-15 09:10:00');
INSERT INTO public.appointments VALUES (10, 10, 10, '2024-02-20 13:20:00');
INSERT INTO public.appointments VALUES (11, 11, 11, '2024-02-25 10:00:00');
INSERT INTO public.appointments VALUES (12, 12, 12, '2024-03-01 11:30:00');
INSERT INTO public.appointments VALUES (13, 13, 13, '2024-03-05 09:40:00');
INSERT INTO public.appointments VALUES (14, 14, 14, '2024-03-10 15:00:00');
INSERT INTO public.appointments VALUES (15, 15, 15, '2024-03-15 08:50:00');
INSERT INTO public.appointments VALUES (16, 16, 16, '2024-03-20 09:30:00');
INSERT INTO public.appointments VALUES (17, 17, 17, '2024-03-25 14:10:00');
INSERT INTO public.appointments VALUES (18, 18, 18, '2024-03-30 10:15:00');
INSERT INTO public.appointments VALUES (19, 19, 19, '2024-04-04 11:45:00');
INSERT INTO public.appointments VALUES (20, 20, 20, '2024-04-09 09:00:00');
INSERT INTO public.appointments VALUES (21, 21, 21, '2024-04-14 10:20:00');
INSERT INTO public.appointments VALUES (22, 22, 22, '2024-04-19 11:00:00');
INSERT INTO public.appointments VALUES (23, 23, 23, '2024-04-24 08:45:00');
INSERT INTO public.appointments VALUES (24, 24, 24, '2024-04-29 09:15:00');
INSERT INTO public.appointments VALUES (25, 25, 25, '2024-05-04 14:00:00');
INSERT INTO public.appointments VALUES (26, 26, 26, '2024-05-09 09:30:00');
INSERT INTO public.appointments VALUES (27, 27, 27, '2024-05-14 11:10:00');
INSERT INTO public.appointments VALUES (28, 28, 28, '2024-05-19 10:40:00');
INSERT INTO public.appointments VALUES (29, 29, 29, '2024-05-24 09:20:00');
INSERT INTO public.appointments VALUES (30, 30, 30, '2024-05-29 11:30:00');
INSERT INTO public.appointments VALUES (31, 31, 31, '2024-06-03 08:50:00');
INSERT INTO public.appointments VALUES (32, 32, 32, '2024-06-08 10:15:00');
INSERT INTO public.appointments VALUES (33, 33, 33, '2024-06-13 11:40:00');
INSERT INTO public.appointments VALUES (34, 34, 34, '2024-06-18 09:25:00');
INSERT INTO public.appointments VALUES (35, 35, 35, '2024-06-23 10:50:00');
INSERT INTO public.appointments VALUES (36, 36, 36, '2024-06-28 14:00:00');
INSERT INTO public.appointments VALUES (37, 37, 37, '2024-07-03 09:15:00');
INSERT INTO public.appointments VALUES (38, 38, 38, '2024-07-08 10:00:00');
INSERT INTO public.appointments VALUES (39, 39, 39, '2024-07-13 11:10:00');
INSERT INTO public.appointments VALUES (40, 40, 40, '2024-07-18 09:30:00');
INSERT INTO public.appointments VALUES (41, 41, 41, '2024-07-23 15:20:00');
INSERT INTO public.appointments VALUES (42, 42, 42, '2024-07-28 10:45:00');
INSERT INTO public.appointments VALUES (43, 43, 43, '2024-08-02 09:50:00');
INSERT INTO public.appointments VALUES (44, 44, 44, '2024-08-07 11:00:00');
INSERT INTO public.appointments VALUES (45, 45, 45, '2024-08-12 09:40:00');
INSERT INTO public.appointments VALUES (46, 46, 46, '2024-08-17 14:30:00');
INSERT INTO public.appointments VALUES (47, 47, 47, '2024-08-22 10:15:00');
INSERT INTO public.appointments VALUES (48, 48, 48, '2024-08-27 11:30:00');
INSERT INTO public.appointments VALUES (49, 49, 49, '2024-09-01 09:00:00');
INSERT INTO public.appointments VALUES (50, 50, 50, '2024-09-06 10:45:00');
INSERT INTO public.appointments VALUES (51, 51, 51, '2024-09-11 11:20:00');
INSERT INTO public.appointments VALUES (52, 52, 52, '2024-09-16 09:35:00');
INSERT INTO public.appointments VALUES (53, 53, 53, '2024-09-21 13:00:00');
INSERT INTO public.appointments VALUES (54, 54, 54, '2024-09-26 10:25:00');
INSERT INTO public.appointments VALUES (55, 55, 55, '2024-10-01 09:15:00');
INSERT INTO public.appointments VALUES (56, 56, 56, '2024-10-06 11:10:00');
INSERT INTO public.appointments VALUES (57, 57, 57, '2024-10-11 08:50:00');
INSERT INTO public.appointments VALUES (58, 58, 58, '2024-10-16 09:45:00');
INSERT INTO public.appointments VALUES (59, 59, 59, '2024-10-21 10:20:00');
INSERT INTO public.appointments VALUES (60, 60, 60, '2024-10-26 11:30:00');
INSERT INTO public.appointments VALUES (61, 61, 61, '2024-10-31 09:10:00');
INSERT INTO public.appointments VALUES (62, 62, 62, '2024-11-05 10:30:00');
INSERT INTO public.appointments VALUES (63, 63, 63, '2024-11-10 11:40:00');
INSERT INTO public.appointments VALUES (64, 64, 64, '2024-11-15 09:25:00');
INSERT INTO public.appointments VALUES (65, 65, 65, '2024-11-20 10:45:00');
INSERT INTO public.appointments VALUES (66, 66, 66, '2024-11-25 11:00:00');
INSERT INTO public.appointments VALUES (67, 67, 67, '2024-11-30 08:55:00');
INSERT INTO public.appointments VALUES (68, 68, 68, '2024-12-05 09:30:00');
INSERT INTO public.appointments VALUES (69, 69, 69, '2024-12-10 10:20:00');
INSERT INTO public.appointments VALUES (70, 70, 70, '2024-12-15 14:00:00');
INSERT INTO public.appointments VALUES (71, 71, 71, '2024-12-20 09:00:00');
INSERT INTO public.appointments VALUES (72, 72, 72, '2024-12-25 10:15:00');
INSERT INTO public.appointments VALUES (73, 73, 73, '2024-12-30 11:00:00');
INSERT INTO public.appointments VALUES (74, 74, 74, '2025-01-04 09:40:00');
INSERT INTO public.appointments VALUES (75, 75, 75, '2025-01-09 11:15:00');
INSERT INTO public.appointments VALUES (76, 76, 76, '2025-01-14 09:10:00');
INSERT INTO public.appointments VALUES (77, 77, 77, '2025-01-19 10:00:00');
INSERT INTO public.appointments VALUES (78, 78, 78, '2025-01-24 11:30:00');
INSERT INTO public.appointments VALUES (79, 79, 79, '2025-01-29 09:50:00');
INSERT INTO public.appointments VALUES (80, 80, 80, '2025-02-03 10:15:00');
INSERT INTO public.appointments VALUES (81, 81, 81, '2025-02-08 11:20:00');
INSERT INTO public.appointments VALUES (82, 82, 82, '2025-02-13 09:35:00');
INSERT INTO public.appointments VALUES (83, 83, 83, '2025-02-18 10:50:00');
INSERT INTO public.appointments VALUES (84, 84, 84, '2025-02-23 09:25:00');
INSERT INTO public.appointments VALUES (85, 85, 85, '2025-02-28 14:10:00');
INSERT INTO public.appointments VALUES (86, 86, 86, '2025-03-05 09:45:00');
INSERT INTO public.appointments VALUES (87, 87, 87, '2025-03-10 11:00:00');
INSERT INTO public.appointments VALUES (88, 88, 88, '2025-03-15 09:15:00');
INSERT INTO public.appointments VALUES (89, 89, 89, '2025-03-20 10:30:00');
INSERT INTO public.appointments VALUES (90, 90, 90, '2025-03-25 11:10:00');
INSERT INTO public.appointments VALUES (91, 91, 91, '2025-03-30 08:50:00');
INSERT INTO public.appointments VALUES (92, 92, 92, '2025-04-04 09:40:00');
INSERT INTO public.appointments VALUES (93, 93, 93, '2025-04-09 10:20:00');
INSERT INTO public.appointments VALUES (94, 94, 94, '2025-04-14 11:00:00');
INSERT INTO public.appointments VALUES (95, 95, 95, '2025-04-19 09:10:00');
INSERT INTO public.appointments VALUES (96, 96, 96, '2025-04-24 10:30:00');
INSERT INTO public.appointments VALUES (97, 97, 97, '2025-04-29 11:15:00');
INSERT INTO public.appointments VALUES (98, 98, 98, '2025-05-04 09:20:00');
INSERT INTO public.appointments VALUES (99, 99, 99, '2025-05-09 10:45:00');
INSERT INTO public.appointments VALUES (100, 100, 100, '2025-10-08 10:00:00');


--
-- TOC entry 3649 (class 0 OID 131083)
-- Dependencies: 244
-- Data for Name: appointments_audit; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3647 (class 0 OID 106654)
-- Dependencies: 242
-- Data for Name: laboratories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.laboratories VALUES (1, 1, 'Hemograma completo', 'Resultados normales, sin signos de infección.', '2025-01-10');
INSERT INTO public.laboratories VALUES (2, 2, 'Análisis de orina', 'Presencia leve de proteínas, se recomienda seguimiento.', '2025-01-11');
INSERT INTO public.laboratories VALUES (3, 3, 'Prueba de heces', 'No se detectan parásitos intestinales.', '2025-01-13');
INSERT INTO public.laboratories VALUES (4, 4, 'Bioquímica sanguínea', 'Valores hepáticos ligeramente elevados.', '2025-01-15');
INSERT INTO public.laboratories VALUES (5, 5, 'Radiografía torácica', 'Sin anomalías visibles en pulmones o corazón.', '2025-01-16');
INSERT INTO public.laboratories VALUES (6, 6, 'Ecografía abdominal', 'Presencia de leve inflamación gástrica.', '2025-01-18');
INSERT INTO public.laboratories VALUES (7, 7, 'Prueba de glucosa', 'Nivel de glucosa dentro del rango normal.', '2025-01-20');
INSERT INTO public.laboratories VALUES (8, 8, 'Prueba de parvovirus', 'Resultado negativo.', '2025-01-21');
INSERT INTO public.laboratories VALUES (9, 9, 'Análisis renal', 'Función renal adecuada, sin alteraciones.', '2025-01-22');
INSERT INTO public.laboratories VALUES (10, 10, 'Hemograma completo', 'Leve anemia detectada.', '2025-01-23');
INSERT INTO public.laboratories VALUES (11, 11, 'Prueba de heces', 'Presencia de Giardia spp.', '2025-01-25');
INSERT INTO public.laboratories VALUES (12, 12, 'Análisis de orina', 'Resultado normal.', '2025-01-26');
INSERT INTO public.laboratories VALUES (13, 13, 'Ecografía abdominal', 'Sin alteraciones detectadas.', '2025-01-28');
INSERT INTO public.laboratories VALUES (14, 14, 'Bioquímica sanguínea', 'Aumento en enzimas hepáticas.', '2025-01-30');
INSERT INTO public.laboratories VALUES (15, 15, 'Radiografía de extremidades', 'Pequeña fractura en fémur posterior derecho.', '2025-02-01');
INSERT INTO public.laboratories VALUES (16, 16, 'Prueba de leishmaniosis', 'Resultado negativo.', '2025-02-03');
INSERT INTO public.laboratories VALUES (17, 17, 'Prueba de parásitos', 'Positivo a Toxocara canis.', '2025-02-05');
INSERT INTO public.laboratories VALUES (18, 18, 'Análisis de orina', 'Cristales de estruvita detectados.', '2025-02-06');
INSERT INTO public.laboratories VALUES (19, 19, 'Prueba de heces', 'Negativo a helmintos.', '2025-02-07');
INSERT INTO public.laboratories VALUES (20, 20, 'Hemograma completo', 'Todos los valores dentro del rango.', '2025-02-08');
INSERT INTO public.laboratories VALUES (21, 21, 'Prueba de glucosa', 'Leve hipoglucemia observada.', '2025-02-10');
INSERT INTO public.laboratories VALUES (22, 22, 'Radiografía torácica', 'Corazón ligeramente agrandado.', '2025-02-12');
INSERT INTO public.laboratories VALUES (23, 23, 'Bioquímica sanguínea', 'Función renal adecuada.', '2025-02-13');
INSERT INTO public.laboratories VALUES (24, 24, 'Ecografía abdominal', 'Hígado ligeramente agrandado.', '2025-02-15');
INSERT INTO public.laboratories VALUES (25, 25, 'Prueba de orina', 'Indicios de infección urinaria.', '2025-02-17');
INSERT INTO public.laboratories VALUES (26, 26, 'Hemograma completo', 'Signos de inflamación activa.', '2025-02-19');
INSERT INTO public.laboratories VALUES (27, 27, 'Análisis fecal', 'Huevos de anquilostomas detectados.', '2025-02-21');
INSERT INTO public.laboratories VALUES (28, 28, 'Prueba de glucosa', 'Valor dentro de límites normales.', '2025-02-23');
INSERT INTO public.laboratories VALUES (29, 29, 'Prueba de leishmaniosis', 'Resultado positivo débil.', '2025-02-25');
INSERT INTO public.laboratories VALUES (30, 30, 'Ecografía abdominal', 'Presencia de líquido libre.', '2025-02-27');
INSERT INTO public.laboratories VALUES (31, 31, 'Radiografía abdominal', 'Gas intestinal moderado.', '2025-03-01');
INSERT INTO public.laboratories VALUES (32, 32, 'Bioquímica sanguínea', 'Valores normales.', '2025-03-03');
INSERT INTO public.laboratories VALUES (33, 33, 'Prueba de heces', 'Presencia de coccidios.', '2025-03-04');
INSERT INTO public.laboratories VALUES (34, 34, 'Hemograma completo', 'Anemia leve.', '2025-03-05');
INSERT INTO public.laboratories VALUES (35, 35, 'Análisis de orina', 'Sin anormalidades.', '2025-03-06');
INSERT INTO public.laboratories VALUES (36, 36, 'Prueba de glucosa', 'Hiperglucemia leve.', '2025-03-08');
INSERT INTO public.laboratories VALUES (37, 37, 'Prueba de parásitos', 'Negativo.', '2025-03-10');
INSERT INTO public.laboratories VALUES (38, 38, 'Bioquímica sanguínea', 'Urea ligeramente elevada.', '2025-03-12');
INSERT INTO public.laboratories VALUES (39, 39, 'Ecografía abdominal', 'Vesícula biliar normal.', '2025-03-14');
INSERT INTO public.laboratories VALUES (40, 40, 'Radiografía torácica', 'No hay signos de neumonía.', '2025-03-15');
INSERT INTO public.laboratories VALUES (41, 41, 'Prueba de leishmaniosis', 'Negativa.', '2025-03-17');
INSERT INTO public.laboratories VALUES (42, 42, 'Análisis renal', 'Función normal.', '2025-03-19');
INSERT INTO public.laboratories VALUES (43, 43, 'Prueba de heces', 'Positiva a Trichuris spp.', '2025-03-20');
INSERT INTO public.laboratories VALUES (44, 44, 'Prueba de orina', 'Resultados normales.', '2025-03-22');
INSERT INTO public.laboratories VALUES (45, 45, 'Bioquímica sanguínea', 'Colesterol elevado.', '2025-03-23');
INSERT INTO public.laboratories VALUES (46, 46, 'Hemograma completo', 'Sin alteraciones.', '2025-03-24');
INSERT INTO public.laboratories VALUES (47, 47, 'Prueba de glucosa', 'Dentro del rango normal.', '2025-03-26');
INSERT INTO public.laboratories VALUES (48, 48, 'Radiografía abdominal', 'Sin signos de obstrucción.', '2025-03-28');
INSERT INTO public.laboratories VALUES (49, 49, 'Prueba de parvovirus', 'Negativo.', '2025-03-30');
INSERT INTO public.laboratories VALUES (50, 50, 'Ecografía abdominal', 'Inflamación leve intestinal.', '2025-04-01');
INSERT INTO public.laboratories VALUES (51, 51, 'Prueba de heces', 'No se observan huevos parasitarios.', '2025-04-03');
INSERT INTO public.laboratories VALUES (52, 52, 'Bioquímica sanguínea', 'Valores hepáticos normales.', '2025-04-04');
INSERT INTO public.laboratories VALUES (53, 53, 'Radiografía torácica', 'Corazón agrandado.', '2025-04-06');
INSERT INTO public.laboratories VALUES (54, 54, 'Análisis de orina', 'Infección bacteriana leve.', '2025-04-08');
INSERT INTO public.laboratories VALUES (55, 55, 'Hemograma completo', 'Leucocitos ligeramente elevados.', '2025-04-10');
INSERT INTO public.laboratories VALUES (56, 56, 'Prueba de glucosa', 'Normal.', '2025-04-12');
INSERT INTO public.laboratories VALUES (57, 57, 'Ecografía abdominal', 'Bazo agrandado.', '2025-04-14');
INSERT INTO public.laboratories VALUES (58, 58, 'Bioquímica sanguínea', 'Niveles de creatinina normales.', '2025-04-15');
INSERT INTO public.laboratories VALUES (59, 59, 'Prueba de orina', 'Sin anomalías detectadas.', '2025-04-17');
INSERT INTO public.laboratories VALUES (60, 60, 'Prueba de heces', 'Positiva a parásitos intestinales.', '2025-04-19');
INSERT INTO public.laboratories VALUES (61, 61, 'Radiografía torácica', 'Pulmones claros.', '2025-04-20');
INSERT INTO public.laboratories VALUES (62, 62, 'Análisis renal', 'Sin alteraciones.', '2025-04-22');
INSERT INTO public.laboratories VALUES (63, 63, 'Ecografía abdominal', 'Hígado y bazo normales.', '2025-04-24');
INSERT INTO public.laboratories VALUES (64, 64, 'Hemograma completo', 'Resultado dentro de parámetros.', '2025-04-26');
INSERT INTO public.laboratories VALUES (65, 65, 'Prueba de glucosa', 'Normal.', '2025-04-27');
INSERT INTO public.laboratories VALUES (66, 66, 'Prueba de leishmaniosis', 'Negativa.', '2025-04-29');
INSERT INTO public.laboratories VALUES (67, 67, 'Bioquímica sanguínea', 'Elevación leve de urea.', '2025-05-01');
INSERT INTO public.laboratories VALUES (68, 68, 'Radiografía abdominal', 'Gas acumulado en colon.', '2025-05-03');
INSERT INTO public.laboratories VALUES (69, 69, 'Prueba de orina', 'Presencia de bacterias.', '2025-05-05');
INSERT INTO public.laboratories VALUES (70, 70, 'Prueba de parásitos', 'Negativo.', '2025-05-06');
INSERT INTO public.laboratories VALUES (71, 71, 'Hemograma completo', 'Anemia moderada.', '2025-05-08');
INSERT INTO public.laboratories VALUES (72, 72, 'Ecografía abdominal', 'Estómago distendido.', '2025-05-10');
INSERT INTO public.laboratories VALUES (73, 73, 'Prueba de glucosa', 'Ligeramente alta.', '2025-05-12');
INSERT INTO public.laboratories VALUES (74, 74, 'Análisis de orina', 'Cristales detectados.', '2025-05-13');
INSERT INTO public.laboratories VALUES (75, 75, 'Prueba de heces', 'Negativo a coccidios.', '2025-05-15');
INSERT INTO public.laboratories VALUES (76, 76, 'Bioquímica sanguínea', 'Elevación de enzimas renales.', '2025-05-17');
INSERT INTO public.laboratories VALUES (77, 77, 'Radiografía torácica', 'Leve inflamación pulmonar.', '2025-05-19');
INSERT INTO public.laboratories VALUES (78, 78, 'Prueba de glucosa', 'Valores normales.', '2025-05-21');
INSERT INTO public.laboratories VALUES (79, 79, 'Análisis fecal', 'Huevos de parásitos presentes.', '2025-05-22');
INSERT INTO public.laboratories VALUES (80, 80, 'Ecografía abdominal', 'Vesícula levemente agrandada.', '2025-05-24');
INSERT INTO public.laboratories VALUES (81, 81, 'Bioquímica sanguínea', 'Colesterol dentro del rango.', '2025-05-26');
INSERT INTO public.laboratories VALUES (82, 82, 'Prueba de orina', 'Resultado normal.', '2025-05-28');
INSERT INTO public.laboratories VALUES (83, 83, 'Hemograma completo', 'Leve descenso de plaquetas.', '2025-05-30');
INSERT INTO public.laboratories VALUES (84, 84, 'Prueba de parásitos', 'Negativo.', '2025-06-01');
INSERT INTO public.laboratories VALUES (85, 85, 'Ecografía abdominal', 'Sin alteraciones apreciables.', '2025-06-03');
INSERT INTO public.laboratories VALUES (86, 86, 'Prueba de glucosa', 'Normal.', '2025-06-04');
INSERT INTO public.laboratories VALUES (87, 87, 'Análisis renal', 'Normal.', '2025-06-06');
INSERT INTO public.laboratories VALUES (88, 88, 'Bioquímica sanguínea', 'Todos los valores dentro de rango.', '2025-06-08');
INSERT INTO public.laboratories VALUES (89, 89, 'Radiografía torácica', 'Pulmones sin signos de enfermedad.', '2025-06-10');
INSERT INTO public.laboratories VALUES (90, 90, 'Prueba de heces', 'Positiva a Toxascaris leonina.', '2025-06-12');
INSERT INTO public.laboratories VALUES (91, 91, 'Ecografía abdominal', 'Intestino con leve inflamación.', '2025-06-14');
INSERT INTO public.laboratories VALUES (92, 92, 'Prueba de orina', 'Leve aumento de densidad.', '2025-06-16');
INSERT INTO public.laboratories VALUES (93, 93, 'Hemograma completo', 'Leve leucocitosis.', '2025-06-18');
INSERT INTO public.laboratories VALUES (94, 94, 'Prueba de glucosa', 'Normal.', '2025-06-20');
INSERT INTO public.laboratories VALUES (95, 95, 'Bioquímica sanguínea', 'Creatinina elevada.', '2025-06-22');
INSERT INTO public.laboratories VALUES (96, 96, 'Radiografía abdominal', 'Sin hallazgos relevantes.', '2025-06-23');
INSERT INTO public.laboratories VALUES (97, 97, 'Prueba de orina', 'Resultados normales.', '2025-06-25');
INSERT INTO public.laboratories VALUES (98, 98, 'Ecografía abdominal', 'Vesícula normal.', '2025-06-27');
INSERT INTO public.laboratories VALUES (99, 99, 'Hemograma completo', 'Todo dentro de parámetros.', '2025-06-29');
INSERT INTO public.laboratories VALUES (100, 100, 'Prueba de glucosa', 'Sin alteraciones detectadas.', '2025-06-30');


--
-- TOC entry 3627 (class 0 OID 106519)
-- Dependencies: 222
-- Data for Name: medical_histories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.medical_histories VALUES (1, 1, 'Chequeo general al cachorro, sin anomalías detectadas.', '2024-01-15 10:30:00');
INSERT INTO public.medical_histories VALUES (2, 2, 'Tratamiento antipulgas aplicado y control mensual recomendado.', '2024-02-10 11:00:00');
INSERT INTO public.medical_histories VALUES (3, 3, 'Vacunación antirrábica aplicada, próxima dosis en un año.', '2024-03-05 09:45:00');
INSERT INTO public.medical_histories VALUES (4, 4, 'Limpieza dental completa realizada sin complicaciones.', '2024-03-12 14:00:00');
INSERT INTO public.medical_histories VALUES (5, 5, 'Diagnóstico de otitis leve, tratamiento con gotas óticas por 7 días.', '2024-04-01 15:10:00');
INSERT INTO public.medical_histories VALUES (6, 6, 'Consulta por vómitos, se prescribe dieta blanda y control en 3 días.', '2024-04-05 10:00:00');
INSERT INTO public.medical_histories VALUES (7, 7, 'Corte de uñas y revisión general, sin signos de enfermedad.', '2024-04-15 16:30:00');
INSERT INTO public.medical_histories VALUES (8, 8, 'Aplicación de vacuna múltiple felina, animal en buen estado.', '2024-05-02 09:00:00');
INSERT INTO public.medical_histories VALUES (9, 9, 'Control de peso: se recomienda aumentar la actividad física diaria.', '2024-05-18 11:45:00');
INSERT INTO public.medical_histories VALUES (10, 10, 'Revisión postoperatoria, herida cicatrizando correctamente.', '2024-05-25 13:20:00');
INSERT INTO public.medical_histories VALUES (11, 11, 'Aplicación de desparasitante interno y externo.', '2024-06-03 10:15:00');
INSERT INTO public.medical_histories VALUES (12, 12, 'Se diagnostica gastritis leve, tratamiento con omeprazol veterinario.', '2024-06-07 12:00:00');
INSERT INTO public.medical_histories VALUES (13, 13, 'Vacunación contra parvovirus aplicada sin reacciones adversas.', '2024-06-20 14:10:00');
INSERT INTO public.medical_histories VALUES (14, 14, 'Chequeo general previo a cirugía de esterilización.', '2024-07-01 08:45:00');
INSERT INTO public.medical_histories VALUES (15, 15, 'Esterilización realizada con éxito, recuperación en curso.', '2024-07-10 09:00:00');
INSERT INTO public.medical_histories VALUES (16, 16, 'Se detecta alergia alimentaria, cambio de dieta recomendado.', '2024-07-20 11:30:00');
INSERT INTO public.medical_histories VALUES (17, 17, 'Vacuna contra leptospirosis aplicada correctamente.', '2024-07-30 15:00:00');
INSERT INTO public.medical_histories VALUES (18, 18, 'Revisión de piel: leve dermatitis tratada con crema tópica.', '2024-08-05 10:20:00');
INSERT INTO public.medical_histories VALUES (19, 19, 'Consulta por cojera, diagnóstico: esguince leve en pata trasera.', '2024-08-12 16:00:00');
INSERT INTO public.medical_histories VALUES (20, 20, 'Aplicación de vacuna múltiple canina, animal en óptimo estado.', '2024-08-20 09:15:00');
INSERT INTO public.medical_histories VALUES (21, 21, 'Chequeo anual, todas las constantes dentro de parámetros normales.', '2024-08-27 13:00:00');
INSERT INTO public.medical_histories VALUES (22, 22, 'Desparasitación interna realizada con Milbemax.', '2024-09-01 11:30:00');
INSERT INTO public.medical_histories VALUES (23, 23, 'Vacunación contra moquillo canino aplicada.', '2024-09-10 08:45:00');
INSERT INTO public.medical_histories VALUES (24, 24, 'Control posvacunación, sin síntomas secundarios.', '2024-09-15 10:10:00');
INSERT INTO public.medical_histories VALUES (25, 25, 'Limpieza dental realizada, sin sangrado ni placa excesiva.', '2024-09-22 12:00:00');
INSERT INTO public.medical_histories VALUES (26, 26, 'Consulta por pérdida de apetito, se descarta enfermedad viral.', '2024-09-29 09:50:00');
INSERT INTO public.medical_histories VALUES (27, 27, 'Aplicación de vacuna contra rabia, animal tranquilo.', '2024-10-03 14:00:00');
INSERT INTO public.medical_histories VALUES (28, 28, 'Revisión postvacuna: sin efectos adversos detectados.', '2024-10-06 15:30:00');
INSERT INTO public.medical_histories VALUES (29, 29, 'Chequeo de rutina previo a viaje, certificado de salud emitido.', '2024-10-12 11:15:00');
INSERT INTO public.medical_histories VALUES (30, 30, 'Tratamiento por infección ocular con antibiótico tópico.', '2024-10-20 13:20:00');
INSERT INTO public.medical_histories VALUES (31, 31, 'Control de peso: se recomienda reducción de porciones.', '2024-10-30 09:00:00');
INSERT INTO public.medical_histories VALUES (32, 32, 'Aplicación de vacuna contra leptospirosis y revisión general.', '2024-11-05 08:45:00');
INSERT INTO public.medical_histories VALUES (33, 33, 'Diagnóstico de conjuntivitis leve, tratamiento con colirio.', '2024-11-12 15:00:00');
INSERT INTO public.medical_histories VALUES (34, 34, 'Chequeo dental, se detecta sarro leve, limpieza programada.', '2024-11-19 14:40:00');
INSERT INTO public.medical_histories VALUES (35, 35, 'Desparasitación interna aplicada, próxima dosis en 3 meses.', '2024-12-01 10:30:00');
INSERT INTO public.medical_histories VALUES (36, 36, 'Aplicación de refuerzo de vacuna múltiple felina.', '2024-12-08 11:45:00');
INSERT INTO public.medical_histories VALUES (37, 37, 'Consulta por caída de pelo, se recomienda shampoo dermatológico.', '2024-12-15 16:10:00');
INSERT INTO public.medical_histories VALUES (38, 38, 'Vacunación anual completada, animal en excelente estado.', '2024-12-22 09:15:00');
INSERT INTO public.medical_histories VALUES (39, 39, 'Chequeo preanestésico, todo dentro de parámetros normales.', '2024-12-29 08:00:00');
INSERT INTO public.medical_histories VALUES (40, 40, 'Extracción dental realizada sin complicaciones.', '2025-01-05 10:00:00');
INSERT INTO public.medical_histories VALUES (41, 41, 'Aplicación de vacuna antirrábica anual.', '2025-01-12 09:30:00');
INSERT INTO public.medical_histories VALUES (42, 42, 'Control dermatológico, se observa mejoría tras tratamiento.', '2025-01-20 14:45:00');
INSERT INTO public.medical_histories VALUES (43, 43, 'Chequeo general y actualización de calendario de vacunas.', '2025-01-27 11:20:00');
INSERT INTO public.medical_histories VALUES (44, 44, 'Vacuna múltiple canina aplicada, sin reacciones adversas.', '2025-02-03 13:00:00');
INSERT INTO public.medical_histories VALUES (45, 45, 'Tratamiento preventivo contra garrapatas aplicado.', '2025-02-10 09:15:00');
INSERT INTO public.medical_histories VALUES (46, 46, 'Chequeo de rutina, sin alteraciones detectadas.', '2025-02-17 11:00:00');
INSERT INTO public.medical_histories VALUES (47, 47, 'Revisión ocular, sin signos de irritación ni infecciones.', '2025-02-24 08:40:00');
INSERT INTO public.medical_histories VALUES (48, 48, 'Vacuna contra parvovirus aplicada exitosamente.', '2025-03-02 15:00:00');
INSERT INTO public.medical_histories VALUES (49, 49, 'Consulta por diarrea leve, dieta blanda prescrita.', '2025-03-09 12:15:00');
INSERT INTO public.medical_histories VALUES (50, 50, 'Chequeo anual general, animal saludable.', '2025-03-16 09:30:00');
INSERT INTO public.medical_histories VALUES (51, 51, 'Vacuna múltiple felina aplicada sin incidentes.', '2025-03-23 10:45:00');
INSERT INTO public.medical_histories VALUES (52, 52, 'Desparasitación interna aplicada, próxima dosis en 90 días.', '2025-03-30 11:15:00');
INSERT INTO public.medical_histories VALUES (53, 53, 'Revisión por tos ocasional, se descarta enfermedad respiratoria.', '2025-04-06 08:50:00');
INSERT INTO public.medical_histories VALUES (54, 54, 'Aplicación de vacuna contra calicivirus felino.', '2025-04-13 09:40:00');
INSERT INTO public.medical_histories VALUES (55, 55, 'Chequeo posvacunación, animal en buen estado.', '2025-04-20 14:00:00');
INSERT INTO public.medical_histories VALUES (56, 56, 'Control por otitis media, se prescribe antibiótico.', '2025-04-27 15:10:00');
INSERT INTO public.medical_histories VALUES (57, 57, 'Vacuna múltiple canina de refuerzo aplicada.', '2025-05-04 10:00:00');
INSERT INTO public.medical_histories VALUES (58, 58, 'Chequeo dermatológico, diagnóstico: dermatitis por pulgas.', '2025-05-11 13:20:00');
INSERT INTO public.medical_histories VALUES (59, 59, 'Revisión posantiparasitario, sin efectos adversos.', '2025-05-18 09:50:00');
INSERT INTO public.medical_histories VALUES (60, 60, 'Control dental y aplicación de vacuna antirrábica.', '2025-05-25 11:00:00');
INSERT INTO public.medical_histories VALUES (61, 61, 'Chequeo anual completo, todo dentro de lo normal.', '2025-06-01 08:30:00');
INSERT INTO public.medical_histories VALUES (62, 62, 'Aplicación de vacuna contra leptospirosis.', '2025-06-08 09:10:00');
INSERT INTO public.medical_histories VALUES (63, 63, 'Consulta por cojera leve, se prescribe reposo.', '2025-06-15 16:00:00');
INSERT INTO public.medical_histories VALUES (64, 64, 'Desparasitación mensual aplicada correctamente.', '2025-06-22 09:40:00');
INSERT INTO public.medical_histories VALUES (65, 65, 'Chequeo general y refuerzo de vacuna múltiple.', '2025-06-29 11:30:00');
INSERT INTO public.medical_histories VALUES (66, 66, 'Consulta por pérdida de apetito, exámenes solicitados.', '2025-07-06 12:45:00');
INSERT INTO public.medical_histories VALUES (67, 67, 'Revisión por picazón en piel, diagnóstico de dermatitis.', '2025-07-13 14:20:00');
INSERT INTO public.medical_histories VALUES (68, 68, 'Vacuna contra rabia aplicada sin complicaciones.', '2025-07-20 09:00:00');
INSERT INTO public.medical_histories VALUES (69, 69, 'Chequeo anual, peso dentro de parámetros normales.', '2025-07-27 10:30:00');
INSERT INTO public.medical_histories VALUES (70, 70, 'Aplicación de desparasitante oral mensual.', '2025-08-03 11:00:00');
INSERT INTO public.medical_histories VALUES (71, 71, 'Vacuna múltiple felina avanzada aplicada.', '2025-08-10 09:15:00');
INSERT INTO public.medical_histories VALUES (72, 72, 'Control de piel y pelo, se recomienda suplemento vitamínico.', '2025-08-17 13:00:00');
INSERT INTO public.medical_histories VALUES (73, 73, 'Chequeo por caída de pelo, se recomienda dieta rica en omega 3.', '2025-08-24 15:10:00');
INSERT INTO public.medical_histories VALUES (74, 74, 'Vacunación general actualizada, animal en buen estado.', '2025-08-31 08:45:00');
INSERT INTO public.medical_histories VALUES (75, 75, 'Chequeo anual con vacunación antirrábica.', '2025-09-07 10:00:00');
INSERT INTO public.medical_histories VALUES (76, 76, 'Tratamiento antiparasitario interno aplicado.', '2025-09-14 11:30:00');
INSERT INTO public.medical_histories VALUES (77, 77, 'Vacunación múltiple canina completada.', '2025-09-21 14:00:00');
INSERT INTO public.medical_histories VALUES (78, 78, 'Chequeo dental y limpieza rutinaria.', '2025-09-28 09:45:00');
INSERT INTO public.medical_histories VALUES (79, 79, 'Consulta por infección en oído, tratamiento iniciado.', '2025-10-05 10:20:00');
INSERT INTO public.medical_histories VALUES (80, 80, 'Vacunación antirrábica anual completada.', '2025-10-12 09:00:00');
INSERT INTO public.medical_histories VALUES (81, 81, 'Chequeo general de control, sin hallazgos clínicos.', '2025-10-19 10:40:00');
INSERT INTO public.medical_histories VALUES (82, 82, 'Desparasitación trimestral aplicada sin reacciones.', '2025-10-26 11:00:00');
INSERT INTO public.medical_histories VALUES (83, 83, 'Control dermatológico por alergia ambiental.', '2025-11-02 13:30:00');
INSERT INTO public.medical_histories VALUES (84, 84, 'Aplicación de vacuna múltiple felina.', '2025-11-09 09:50:00');
INSERT INTO public.medical_histories VALUES (85, 85, 'Chequeo anual general, todo en orden.', '2025-11-16 10:15:00');
INSERT INTO public.medical_histories VALUES (86, 86, 'Consulta por vómito leve, se receta dieta blanda.', '2025-11-23 11:10:00');
INSERT INTO public.medical_histories VALUES (87, 87, 'Vacunación de refuerzo anual completada.', '2025-11-30 08:30:00');
INSERT INTO public.medical_histories VALUES (88, 88, 'Control de peso y ajuste de dieta recomendada.', '2025-12-07 09:45:00');
INSERT INTO public.medical_histories VALUES (89, 89, 'Chequeo de rutina, sin hallazgos relevantes.', '2025-12-14 10:20:00');
INSERT INTO public.medical_histories VALUES (90, 90, 'Vacuna antirrábica aplicada correctamente.', '2025-12-21 09:00:00');
INSERT INTO public.medical_histories VALUES (91, 91, 'Revisión postvacuna, sin síntomas secundarios.', '2025-12-28 10:30:00');
INSERT INTO public.medical_histories VALUES (92, 92, 'Chequeo dermatológico por picazón leve.', '2026-01-04 11:10:00');
INSERT INTO public.medical_histories VALUES (93, 93, 'Vacunación múltiple completada, animal en buen estado.', '2026-01-11 09:50:00');
INSERT INTO public.medical_histories VALUES (94, 94, 'Chequeo general anual, parámetros normales.', '2026-01-18 10:00:00');
INSERT INTO public.medical_histories VALUES (95, 95, 'Desparasitación oral administrada correctamente.', '2026-01-25 11:30:00');
INSERT INTO public.medical_histories VALUES (96, 96, 'Control por irritación ocular leve.', '2026-02-01 09:15:00');
INSERT INTO public.medical_histories VALUES (97, 97, 'Aplicación de vacuna contra parvovirus canino.', '2026-02-08 10:40:00');
INSERT INTO public.medical_histories VALUES (98, 98, 'Chequeo de rutina, animal activo y saludable.', '2026-02-15 08:45:00');
INSERT INTO public.medical_histories VALUES (99, 99, 'Revisión de peso y condición corporal óptima.', '2026-02-22 09:30:00');
INSERT INTO public.medical_histories VALUES (100, 100, 'Vacunación antirrábica anual completada, sin efectos adversos.', '2026-03-01 10:00:00');


--
-- TOC entry 3651 (class 0 OID 131105)
-- Dependencies: 246
-- Data for Name: medical_histories_audit; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3639 (class 0 OID 106600)
-- Dependencies: 234
-- Data for Name: medications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.medications VALUES (1, 'Amoxicilina', 'Antibiótico de amplio espectro usado para infecciones bacterianas.', '10 mg/kg cada 12 horas por 7 días');
INSERT INTO public.medications VALUES (2, 'Cefalexina', 'Antibiótico oral para infecciones de piel y tejidos blandos.', '20 mg/kg cada 12 horas por 10 días');
INSERT INTO public.medications VALUES (3, 'Metronidazol', 'Tratamiento contra infecciones gastrointestinales y protozoos.', '15 mg/kg cada 12 horas por 5 días');
INSERT INTO public.medications VALUES (4, 'Enrofloxacina', 'Antibiótico para infecciones respiratorias y urinarias.', '5 mg/kg cada 24 horas por 7 días');
INSERT INTO public.medications VALUES (5, 'Meloxicam', 'Antiinflamatorio no esteroideo para dolor y fiebre.', '0.1 mg/kg cada 24 horas por 5 días');
INSERT INTO public.medications VALUES (6, 'Prednisolona', 'Corticoide para reducir inflamaciones y alergias.', '0.5 mg/kg cada 12 horas por 5 días');
INSERT INTO public.medications VALUES (7, 'Furosemida', 'Diurético usado en casos de insuficiencia cardíaca.', '2 mg/kg cada 12 horas');
INSERT INTO public.medications VALUES (8, 'Doxiciclina', 'Antibiótico para infecciones respiratorias y por garrapatas.', '10 mg/kg cada 24 horas por 10 días');
INSERT INTO public.medications VALUES (9, 'Clindamicina', 'Antibiótico efectivo contra infecciones dentales y de hueso.', '5 mg/kg cada 12 horas por 7 días');
INSERT INTO public.medications VALUES (10, 'Ketoconazol', 'Antifúngico para infecciones por hongos en piel y oídos.', '10 mg/kg cada 24 horas por 14 días');
INSERT INTO public.medications VALUES (11, 'Ivermectina', 'Antiparasitario interno y externo de amplio espectro.', '200 mcg/kg una dosis única');
INSERT INTO public.medications VALUES (12, 'Carprofeno', 'Antiinflamatorio y analgésico para dolor articular.', '4 mg/kg cada 24 horas por 5 días');
INSERT INTO public.medications VALUES (13, 'Ciclosporina', 'Inmunosupresor para dermatitis atópica.', '5 mg/kg cada 24 horas');
INSERT INTO public.medications VALUES (14, 'Diazepam', 'Ansiolítico y relajante muscular.', '0.5 mg/kg cada 12 horas según necesidad');
INSERT INTO public.medications VALUES (15, 'Ondansetrón', 'Antiemético usado para controlar vómitos.', '0.1 mg/kg cada 8 horas');
INSERT INTO public.medications VALUES (16, 'Ranitidina', 'Reductor de acidez estomacal.', '2 mg/kg cada 12 horas');
INSERT INTO public.medications VALUES (17, 'Omeprazol', 'Inhibidor de la secreción gástrica.', '1 mg/kg cada 24 horas');
INSERT INTO public.medications VALUES (18, 'Sucralfato', 'Protector gástrico para úlceras.', '0.5 g/animal cada 8 horas');
INSERT INTO public.medications VALUES (19, 'Clorfenamina', 'Antihistamínico para alergias leves.', '1 mg/kg cada 12 horas');
INSERT INTO public.medications VALUES (20, 'Acepromazina', 'Tranquilizante y sedante leve.', '0.02 mg/kg una sola dosis');
INSERT INTO public.medications VALUES (21, 'Albendazol', 'Antiparasitario de amplio espectro.', '10 mg/kg cada 24 horas por 3 días');
INSERT INTO public.medications VALUES (22, 'Toltrazuril', 'Tratamiento para coccidiosis.', '15 mg/kg cada 24 horas por 3 días');
INSERT INTO public.medications VALUES (23, 'Fenbendazol', 'Antiparasitario intestinal.', '50 mg/kg cada 24 horas por 3 días');
INSERT INTO public.medications VALUES (24, 'Maropitant', 'Antiemético para vómitos agudos o crónicos.', '1 mg/kg cada 24 horas por 5 días');
INSERT INTO public.medications VALUES (25, 'Tramadol', 'Analgésico para dolor moderado a severo.', '2 mg/kg cada 8 horas');
INSERT INTO public.medications VALUES (26, 'Dipirona', 'Analgésico y antipirético.', '25 mg/kg cada 8 horas');
INSERT INTO public.medications VALUES (27, 'Gentamicina', 'Antibiótico para infecciones graves.', '5 mg/kg cada 24 horas por 5 días');
INSERT INTO public.medications VALUES (28, 'Cloranfenicol', 'Antibiótico de amplio espectro.', '50 mg/kg cada 8 horas por 7 días');
INSERT INTO public.medications VALUES (29, 'Tilosina', 'Antibiótico para infecciones intestinales.', '20 mg/kg cada 12 horas por 5 días');
INSERT INTO public.medications VALUES (30, 'Ceftriaxona', 'Antibiótico inyectable de amplio espectro.', '25 mg/kg cada 24 horas por 5 días');
INSERT INTO public.medications VALUES (31, 'Ketoprofeno', 'Antiinflamatorio para dolor postoperatorio.', '2 mg/kg cada 24 horas por 3 días');
INSERT INTO public.medications VALUES (32, 'Loratadina', 'Antihistamínico oral para alergias.', '0.5 mg/kg cada 24 horas');
INSERT INTO public.medications VALUES (33, 'Metoclopramida', 'Antiemético y regulador de motilidad gástrica.', '0.2 mg/kg cada 8 horas');
INSERT INTO public.medications VALUES (34, 'Sulfasalazina', 'Antiinflamatorio intestinal.', '25 mg/kg cada 8 horas por 10 días');
INSERT INTO public.medications VALUES (35, 'Tetraciclina', 'Antibiótico de amplio espectro.', '20 mg/kg cada 12 horas por 7 días');
INSERT INTO public.medications VALUES (36, 'Amikacina', 'Antibiótico para infecciones graves.', '15 mg/kg cada 24 horas');
INSERT INTO public.medications VALUES (37, 'Florfenicol', 'Antibiótico de amplio espectro.', '20 mg/kg cada 24 horas por 5 días');
INSERT INTO public.medications VALUES (38, 'Desloratadina', 'Antihistamínico para picazón y dermatitis.', '1 mg/kg cada 24 horas');
INSERT INTO public.medications VALUES (39, 'Ciprofloxacina', 'Antibiótico de amplio espectro.', '10 mg/kg cada 12 horas por 7 días');
INSERT INTO public.medications VALUES (40, 'Cefotaxima', 'Antibiótico inyectable.', '25 mg/kg cada 12 horas por 5 días');
INSERT INTO public.medications VALUES (41, 'Fluconazol', 'Antifúngico sistémico.', '10 mg/kg cada 24 horas por 14 días');
INSERT INTO public.medications VALUES (42, 'Itraconazol', 'Antifúngico para dermatofitosis.', '5 mg/kg cada 24 horas por 14 días');
INSERT INTO public.medications VALUES (43, 'Mebendazol', 'Antiparasitario para nematodos y cestodos.', '10 mg/kg cada 24 horas por 3 días');
INSERT INTO public.medications VALUES (44, 'Nitazoxanida', 'Antiparasitario para giardiasis.', '15 mg/kg cada 12 horas por 5 días');
INSERT INTO public.medications VALUES (45, 'Prazicuantel', 'Antiparasitario para tenias.', '5 mg/kg cada 24 horas por 2 días');
INSERT INTO public.medications VALUES (46, 'Selamectina', 'Antiparasitario tópico mensual.', '6 mg/kg una dosis mensual');
INSERT INTO public.medications VALUES (47, 'Milbemicina oxima', 'Prevención de parásitos cardíacos e intestinales.', '0.5 mg/kg mensual');
INSERT INTO public.medications VALUES (48, 'Fenobarbital', 'Anticonvulsivo.', '2 mg/kg cada 12 horas');
INSERT INTO public.medications VALUES (49, 'Levotiroxina', 'Tratamiento para hipotiroidismo.', '0.02 mg/kg cada 12 horas');
INSERT INTO public.medications VALUES (50, 'Insulina NPH', 'Tratamiento para diabetes mellitus.', '1 UI/kg cada 12 horas');
INSERT INTO public.medications VALUES (51, 'Insulina glargina', 'Insulina de acción prolongada.', '0.25 UI/kg cada 24 horas');
INSERT INTO public.medications VALUES (52, 'Fipronil', 'Antiparasitario externo para pulgas y garrapatas.', 'Aplicación tópica mensual');
INSERT INTO public.medications VALUES (53, 'Permetrina', 'Antiparasitario externo.', 'Aplicación tópica mensual');
INSERT INTO public.medications VALUES (54, 'Clotrimazol', 'Antifúngico tópico.', 'Aplicar dos veces al día por 14 días');
INSERT INTO public.medications VALUES (55, 'Miconazol', 'Antifúngico para otitis.', 'Aplicar dos veces al día por 10 días');
INSERT INTO public.medications VALUES (56, 'Gentamicina tópica', 'Antibiótico para heridas.', 'Aplicar cada 12 horas por 7 días');
INSERT INTO public.medications VALUES (57, 'Neomicina', 'Antibiótico tópico.', 'Aplicar 2 veces al día');
INSERT INTO public.medications VALUES (58, 'Hidrocortisona', 'Antiinflamatorio tópico.', 'Aplicar una capa fina cada 8 horas');
INSERT INTO public.medications VALUES (59, 'Dexametasona', 'Antiinflamatorio potente.', '0.1 mg/kg cada 24 horas');
INSERT INTO public.medications VALUES (60, 'Metilprednisolona', 'Corticoide de acción prolongada.', '1 mg/kg cada 24 horas');
INSERT INTO public.medications VALUES (61, 'Ibuprofeno', 'Analgésico no recomendado para gatos.', '5 mg/kg cada 12 horas (solo perros)');
INSERT INTO public.medications VALUES (62, 'Diclofenaco', 'Antiinflamatorio.', '1 mg/kg cada 12 horas por 3 días');
INSERT INTO public.medications VALUES (63, 'Trimebutina', 'Regulador del tránsito intestinal.', '5 mg/kg cada 8 horas');
INSERT INTO public.medications VALUES (64, 'Domperidona', 'Antiemético y estimulante gástrico.', '0.5 mg/kg cada 8 horas');
INSERT INTO public.medications VALUES (65, 'Loperamida', 'Antidiarreico.', '0.2 mg/kg cada 8 horas');
INSERT INTO public.medications VALUES (66, 'Vitaminas del complejo B', 'Suplemento vitamínico.', '1 ml/10 kg cada 24 horas');
INSERT INTO public.medications VALUES (67, 'Ácido ascórbico', 'Suplemento antioxidante.', '50 mg/kg cada 24 horas');
INSERT INTO public.medications VALUES (68, 'Suplemento de calcio', 'Apoya el desarrollo óseo.', '50 mg/kg cada 24 horas');
INSERT INTO public.medications VALUES (69, 'Suplemento de hierro', 'Prevención y tratamiento de anemia.', '1 ml/animal cada 24 horas');
INSERT INTO public.medications VALUES (70, 'Omega 3', 'Suplemento para piel y pelo.', '1 cápsula diaria por 30 días');
INSERT INTO public.medications VALUES (71, 'Probióticos veterinarios', 'Mejoran la flora intestinal.', '1 dosis diaria por 7 días');
INSERT INTO public.medications VALUES (72, 'Glucosamina', 'Ayuda en la regeneración del cartílago.', '10 mg/kg cada 24 horas');
INSERT INTO public.medications VALUES (73, 'Condroitina', 'Complemento articular.', '15 mg/kg cada 24 horas');
INSERT INTO public.medications VALUES (74, 'Melatonina', 'Regulador del sueño y ansiedad.', '3 mg cada noche');
INSERT INTO public.medications VALUES (75, 'Taurina', 'Aminoácido esencial para gatos.', '250 mg cada 24 horas');
INSERT INTO public.medications VALUES (76, 'L-Carnitina', 'Apoya el metabolismo energético.', '50 mg/kg cada 24 horas');
INSERT INTO public.medications VALUES (77, 'Aceite de salmón', 'Fuente natural de omega-3.', '1 cucharadita diaria');
INSERT INTO public.medications VALUES (78, 'Colina', 'Suplemento hepático.', '50 mg/kg cada 24 horas');
INSERT INTO public.medications VALUES (79, 'Zinc', 'Apoya el sistema inmunológico.', '2 mg/kg cada 24 horas');
INSERT INTO public.medications VALUES (80, 'Selenio', 'Antioxidante esencial.', '0.1 mg/kg cada 24 horas');
INSERT INTO public.medications VALUES (81, 'Vitamina E', 'Antioxidante natural.', '10 UI/kg cada 24 horas');
INSERT INTO public.medications VALUES (82, 'Vitamina D3', 'Apoya el metabolismo del calcio.', '0.02 mg/kg cada 48 horas');
INSERT INTO public.medications VALUES (83, 'Multivitamínico veterinario', 'Refuerzo nutricional general.', '1 tableta diaria');
INSERT INTO public.medications VALUES (84, 'Antihistamínico veterinario', 'Control de reacciones alérgicas.', '1 mg/kg cada 12 horas');
INSERT INTO public.medications VALUES (85, 'Suplemento hepático', 'Protege la función del hígado.', '1 tableta diaria');
INSERT INTO public.medications VALUES (86, 'Antibiótico ocular', 'Tratamiento para conjuntivitis.', 'Aplicar 3 veces al día por 7 días');
INSERT INTO public.medications VALUES (87, 'Lubricante ocular', 'Hidratación de la superficie ocular.', 'Aplicar cada 8 horas');
INSERT INTO public.medications VALUES (88, 'Analgésico tópico', 'Alivio del dolor localizado.', 'Aplicar cada 12 horas');
INSERT INTO public.medications VALUES (89, 'Pomada antibiótica', 'Tratamiento de heridas superficiales.', 'Aplicar 2 veces al día');
INSERT INTO public.medications VALUES (90, 'Suplemento renal', 'Apoyo en enfermedades renales.', '1 cápsula diaria');
INSERT INTO public.medications VALUES (91, 'Prebiótico', 'Favorece la salud intestinal.', '1 dosis diaria');
INSERT INTO public.medications VALUES (92, 'Clorhexidina', 'Desinfectante de uso externo.', 'Aplicar en la zona afectada 2 veces al día');
INSERT INTO public.medications VALUES (93, 'Spray cicatrizante', 'Promueve la regeneración de heridas.', 'Aplicar una vez al día');
INSERT INTO public.medications VALUES (94, 'Antipulgas oral', 'Previene infestaciones.', '1 dosis mensual');
INSERT INTO public.medications VALUES (95, 'Desparasitante interno', 'Control de parásitos intestinales.', '1 dosis cada 3 meses');
INSERT INTO public.medications VALUES (96, 'Desparasitante externo', 'Prevención contra garrapatas.', '1 dosis mensual');
INSERT INTO public.medications VALUES (97, 'Suplemento inmunológico', 'Fortalece defensas naturales.', '1 tableta diaria por 30 días');
INSERT INTO public.medications VALUES (98, 'Antibiótico de amplio espectro', 'Control de infecciones bacterianas variadas.', '20 mg/kg cada 12 horas');
INSERT INTO public.medications VALUES (99, 'Analgésico general', 'Control del dolor postoperatorio.', '2 mg/kg cada 8 horas');
INSERT INTO public.medications VALUES (100, 'Cicatrizante oral', 'Favorece la curación de heridas orales.', 'Aplicar 3 veces al día por 5 días');
INSERT INTO public.medications VALUES (101, 'Desinflamatorio ocular', 'Reduce inflamación en párpados.', 'Aplicar 2 veces al día por 7 días');
INSERT INTO public.medications VALUES (102, 'Sedante veterinario', 'Facilita procedimientos clínicos.', '0.05 mg/kg según necesidad');
INSERT INTO public.medications VALUES (103, 'Antibiótico inyectable', 'Tratamiento rápido de infecciones.', '10 mg/kg una vez al día por 3 días');


--
-- TOC entry 3623 (class 0 OID 106500)
-- Dependencies: 218
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.owners VALUES (1, 'Carlos Ramírez', '3004567890', 'carlos.ramirez@mail.com', 'Cra 10 #12-34, Bogotá');
INSERT INTO public.owners VALUES (2, 'María Fernández', '3109876543', 'maria.fernandez@mail.com', 'Cll 45 #23-67, Medellín');
INSERT INTO public.owners VALUES (3, 'Andrés López', '3201234567', 'andres.lopez@mail.com', 'Av. Caracas #56-78, Bogotá');
INSERT INTO public.owners VALUES (4, 'Paola Gutiérrez', '3012345678', 'paola.gutierrez@mail.com', 'Cll 22 #45-12, Cali');
INSERT INTO public.owners VALUES (5, 'Juan Torres', '3124567891', 'juan.torres@mail.com', 'Cra 50 #15-20, Barranquilla');
INSERT INTO public.owners VALUES (6, 'Diana Suárez', '3148765432', 'diana.suarez@mail.com', 'Cll 80 #34-90, Bogotá');
INSERT INTO public.owners VALUES (7, 'Felipe Gómez', '3152345678', 'felipe.gomez@mail.com', 'Av. Boyacá #45-67, Bogotá');
INSERT INTO public.owners VALUES (8, 'Laura Restrepo', '3169876543', 'laura.restrepo@mail.com', 'Cll 10 #12-20, Medellín');
INSERT INTO public.owners VALUES (9, 'Santiago Rojas', '3008765432', 'santiago.rojas@mail.com', 'Cra 60 #23-45, Cali');
INSERT INTO public.owners VALUES (10, 'Camila Vargas', '3206543210', 'camila.vargas@mail.com', 'Cll 75 #30-55, Bucaramanga');
INSERT INTO public.owners VALUES (11, 'Luis Pineda', '3107654321', 'luis.pineda@mail.com', 'Av. Oriental #44-22, Medellín');
INSERT INTO public.owners VALUES (12, 'Ana Torres', '3009871234', 'ana.torres@mail.com', 'Cra 33 #11-50, Bogotá');
INSERT INTO public.owners VALUES (13, 'David Herrera', '3153216547', 'david.herrera@mail.com', 'Cll 20 #55-44, Cartagena');
INSERT INTO public.owners VALUES (14, 'Karen Morales', '3184325678', 'karen.morales@mail.com', 'Cra 12 #34-12, Bogotá');
INSERT INTO public.owners VALUES (15, 'Esteban Ruiz', '3126789054', 'esteban.ruiz@mail.com', 'Cll 55 #23-78, Cali');
INSERT INTO public.owners VALUES (16, 'Juliana Castro', '3019876543', 'juliana.castro@mail.com', 'Cra 7 #40-33, Medellín');
INSERT INTO public.owners VALUES (17, 'Ricardo Medina', '3105432198', 'ricardo.medina@mail.com', 'Cll 25 #22-10, Bogotá');
INSERT INTO public.owners VALUES (18, 'Valentina Salazar', '3208765412', 'valentina.salazar@mail.com', 'Cll 95 #12-22, Cali');
INSERT INTO public.owners VALUES (19, 'Fernando Vargas', '3183210987', 'fernando.vargas@mail.com', 'Cra 20 #11-67, Barranquilla');
INSERT INTO public.owners VALUES (20, 'Sara Mejía', '3157654321', 'sara.mejia@mail.com', 'Cll 88 #22-44, Medellín');
INSERT INTO public.owners VALUES (21, 'Tomás Cárdenas', '3144321098', 'tomas.cardenas@mail.com', 'Cra 19 #20-50, Bogotá');
INSERT INTO public.owners VALUES (22, 'Daniela Rincón', '3012349098', 'daniela.rincon@mail.com', 'Cll 50 #25-90, Cali');
INSERT INTO public.owners VALUES (23, 'Julián Herrera', '3128765410', 'julian.herrera@mail.com', 'Cll 70 #10-40, Medellín');
INSERT INTO public.owners VALUES (24, 'Luisa Martínez', '3105678901', 'luisa.martinez@mail.com', 'Cra 13 #45-60, Bogotá');
INSERT INTO public.owners VALUES (25, 'Mateo Gutiérrez', '3207896541', 'mateo.gutierrez@mail.com', 'Cll 40 #21-18, Bucaramanga');
INSERT INTO public.owners VALUES (26, 'Isabella López', '3189998887', 'isabella.lopez@mail.com', 'Cra 10 #50-22, Cartagena');
INSERT INTO public.owners VALUES (27, 'Sebastián Ramírez', '3158887776', 'sebastian.ramirez@mail.com', 'Cll 23 #34-60, Bogotá');
INSERT INTO public.owners VALUES (28, 'Natalia Ruiz', '3125554443', 'natalia.ruiz@mail.com', 'Cll 11 #22-33, Medellín');
INSERT INTO public.owners VALUES (29, 'Gabriel Castaño', '3014443332', 'gabriel.castano@mail.com', 'Cra 25 #10-22, Cali');
INSERT INTO public.owners VALUES (30, 'Mariana Pérez', '3203332221', 'mariana.perez@mail.com', 'Cll 50 #18-44, Bogotá');
INSERT INTO public.owners VALUES (31, 'Andrés Montoya', '3142221110', 'andres.montoya@mail.com', 'Cra 8 #20-55, Pereira');
INSERT INTO public.owners VALUES (32, 'Carolina Duarte', '3161110009', 'carolina.duarte@mail.com', 'Cll 30 #45-22, Bogotá');
INSERT INTO public.owners VALUES (33, 'Jorge Acosta', '3129998887', 'jorge.acosta@mail.com', 'Cra 15 #30-20, Cali');
INSERT INTO public.owners VALUES (34, 'Sofía Mendoza', '3108887776', 'sofia.mendoza@mail.com', 'Cll 45 #22-70, Medellín');
INSERT INTO public.owners VALUES (35, 'Camilo Nieto', '3007776665', 'camilo.nieto@mail.com', 'Av. El Dorado #80-12, Bogotá');
INSERT INTO public.owners VALUES (36, 'Lorena Rivas', '3186665554', 'lorena.rivas@mail.com', 'Cra 50 #12-33, Cali');
INSERT INTO public.owners VALUES (37, 'Samuel Orozco', '3155554443', 'samuel.orozco@mail.com', 'Cll 60 #44-55, Barranquilla');
INSERT INTO public.owners VALUES (38, 'Daniela Parra', '3204443332', 'daniela.parra@mail.com', 'Cra 12 #10-30, Medellín');
INSERT INTO public.owners VALUES (39, 'Felipe Cano', '3123332221', 'felipe.cano@mail.com', 'Cll 45 #15-10, Bogotá');
INSERT INTO public.owners VALUES (40, 'Laura Gómez', '3102221110', 'laura.gomez@mail.com', 'Cra 33 #22-40, Cali');
INSERT INTO public.owners VALUES (41, 'Carlos Molina', '3001110009', 'carlos.molina@mail.com', 'Cll 70 #10-22, Medellín');
INSERT INTO public.owners VALUES (42, 'María Pérez', '3109873334', 'maria.perez@mail.com', 'Cra 5 #10-12, Bogotá');
INSERT INTO public.owners VALUES (43, 'Alejandro Díaz', '3128762225', 'alejandro.diaz@mail.com', 'Cll 40 #25-80, Cali');
INSERT INTO public.owners VALUES (44, 'Daniela Vargas', '3157651116', 'daniela.vargas@mail.com', 'Cll 90 #22-50, Medellín');
INSERT INTO public.owners VALUES (45, 'Juan Martínez', '3186540007', 'juan.martinez@mail.com', 'Cra 22 #11-33, Bogotá');
INSERT INTO public.owners VALUES (46, 'Lucía Herrera', '3145439998', 'lucia.herrera@mail.com', 'Cll 33 #44-11, Cartagena');
INSERT INTO public.owners VALUES (47, 'Diego González', '3204328889', 'diego.gonzalez@mail.com', 'Cra 11 #22-40, Medellín');
INSERT INTO public.owners VALUES (48, 'Valeria Peña', '3013217770', 'valeria.pena@mail.com', 'Cll 80 #15-30, Cali');
INSERT INTO public.owners VALUES (49, 'Oscar Ramírez', '3102106661', 'oscar.ramirez@mail.com', 'Cra 55 #10-44, Bogotá');
INSERT INTO public.owners VALUES (50, 'Patricia Rojas', '3121095552', 'patricia.rojas@mail.com', 'Cll 12 #20-80, Medellín');
INSERT INTO public.owners VALUES (51, 'Miguel Cifuentes', '3150084443', 'miguel.cifuentes@mail.com', 'Cra 70 #50-10, Barranquilla');
INSERT INTO public.owners VALUES (52, 'Liliana Cabrera', '3005558881', 'liliana.cabrera@mail.com', 'Cll 23 #56-12, Bogotá');
INSERT INTO public.owners VALUES (53, 'Esteban Muñoz', '3204442210', 'esteban.munoz@mail.com', 'Cra 14 #33-50, Medellín');
INSERT INTO public.owners VALUES (54, 'Catalina Torres', '3153331209', 'catalina.torres@mail.com', 'Av. Roosevelt #70-14, Cali');
INSERT INTO public.owners VALUES (55, 'Mauricio Castillo', '3182220198', 'mauricio.castillo@mail.com', 'Cra 30 #10-15, Cartagena');
INSERT INTO public.owners VALUES (56, 'Daniel Pardo', '3101119187', 'daniel.pardo@mail.com', 'Cll 80 #25-12, Barranquilla');
INSERT INTO public.owners VALUES (57, 'Rosa Martínez', '3129998176', 'rosa.martinez@mail.com', 'Cra 12 #20-30, Bogotá');
INSERT INTO public.owners VALUES (58, 'Andrés Cifuentes', '3148887165', 'andres.cifuentes@mail.com', 'Cll 25 #60-80, Cali');
INSERT INTO public.owners VALUES (59, 'Karen Vargas', '3167776154', 'karen.vargas@mail.com', 'Cra 17 #33-11, Medellín');
INSERT INTO public.owners VALUES (60, 'Sergio Pérez', '3206665143', 'sergio.perez@mail.com', 'Cll 12 #45-20, Bogotá');
INSERT INTO public.owners VALUES (61, 'Diana Morales', '3155554132', 'diana.morales@mail.com', 'Cll 44 #15-60, Bucaramanga');
INSERT INTO public.owners VALUES (62, 'Camilo Jiménez', '3184443121', 'camilo.jimenez@mail.com', 'Cra 22 #33-10, Cali');
INSERT INTO public.owners VALUES (63, 'Paula Ramírez', '3103332110', 'paula.ramirez@mail.com', 'Cll 15 #44-20, Medellín');
INSERT INTO public.owners VALUES (64, 'Felipe Cárdenas', '3122221109', 'felipe.cardenas@mail.com', 'Av. Suba #100-12, Bogotá');
INSERT INTO public.owners VALUES (65, 'Manuela Gil', '3141110098', 'manuela.gil@mail.com', 'Cll 80 #50-20, Cali');
INSERT INTO public.owners VALUES (66, 'Gabriel Rojas', '3150009087', 'gabriel.rojas@mail.com', 'Cra 7 #33-44, Medellín');
INSERT INTO public.owners VALUES (67, 'Sofía Muñoz', '3189998076', 'sofia.munoz@mail.com', 'Cll 22 #14-10, Bogotá');
INSERT INTO public.owners VALUES (68, 'Tomás Herrera', '3208887065', 'tomas.herrera@mail.com', 'Cra 13 #25-40, Pereira');
INSERT INTO public.owners VALUES (69, 'Luciana Morales', '3107776054', 'luciana.morales@mail.com', 'Cll 34 #50-11, Cartagena');
INSERT INTO public.owners VALUES (70, 'Juan Pablo Díaz', '3126665043', 'juanpablo.diaz@mail.com', 'Cra 9 #40-22, Bogotá');
INSERT INTO public.owners VALUES (71, 'Laura Restrepo', '3165554032', 'laura.restrepo@mail.com', 'Cll 90 #12-10, Medellín');
INSERT INTO public.owners VALUES (72, 'Ricardo Pineda', '3144443021', 'ricardo.pineda@mail.com', 'Cra 60 #22-15, Cali');
INSERT INTO public.owners VALUES (73, 'Daniela Ramírez', '3153332010', 'daniela.ramirez@mail.com', 'Cll 50 #33-70, Bogotá');
INSERT INTO public.owners VALUES (74, 'Samuel Ruiz', '3182221099', 'samuel.ruiz@mail.com', 'Cra 15 #10-90, Barranquilla');
INSERT INTO public.owners VALUES (75, 'Natalia Castaño', '3201110088', 'natalia.castano@mail.com', 'Cll 33 #44-12, Medellín');
INSERT INTO public.owners VALUES (76, 'Camila López', '3109999077', 'camila.lopez@mail.com', 'Cra 22 #55-60, Cali');
INSERT INTO public.owners VALUES (77, 'Miguel Ángel Vargas', '3128888066', 'miguel.vargas@mail.com', 'Cll 10 #11-45, Bogotá');
INSERT INTO public.owners VALUES (78, 'Julián Castro', '3147777055', 'julian.castro@mail.com', 'Cra 40 #22-33, Medellín');
INSERT INTO public.owners VALUES (79, 'Isabella Torres', '3166666044', 'isabella.torres@mail.com', 'Cll 23 #50-90, Cali');
INSERT INTO public.owners VALUES (80, 'Pedro Martínez', '3185555033', 'pedro.martinez@mail.com', 'Cra 30 #40-60, Bogotá');
INSERT INTO public.owners VALUES (81, 'Valentina Giraldo', '3204444022', 'valentina.giraldo@mail.com', 'Cll 14 #70-10, Pereira');
INSERT INTO public.owners VALUES (82, 'Diego Hernández', '3103333011', 'diego.hernandez@mail.com', 'Cra 50 #33-40, Medellín');
INSERT INTO public.owners VALUES (83, 'Angélica Rojas', '3122222000', 'angelica.rojas@mail.com', 'Cll 88 #11-12, Cali');
INSERT INTO public.owners VALUES (84, 'Juan Esteban Ochoa', '3141111999', 'juanesteban.ochoa@mail.com', 'Cra 22 #60-44, Bogotá');
INSERT INTO public.owners VALUES (85, 'Catalina López', '3150001888', 'catalina.lopez@mail.com', 'Cll 45 #23-80, Bucaramanga');
INSERT INTO public.owners VALUES (86, 'Andrés Felipe Gómez', '3189991777', 'andresfelipe.gomez@mail.com', 'Cra 8 #33-22, Medellín');
INSERT INTO public.owners VALUES (87, 'María Alejandra Ríos', '3208881666', 'maria.rios@mail.com', 'Cll 70 #12-33, Cali');
INSERT INTO public.owners VALUES (88, 'Santiago Cárdenas', '3107771555', 'santiago.cardenas@mail.com', 'Cra 9 #44-12, Bogotá');
INSERT INTO public.owners VALUES (89, 'Lina Marcela Castro', '3126661444', 'lina.castro@mail.com', 'Cll 55 #33-80, Medellín');
INSERT INTO public.owners VALUES (90, 'Carlos Eduardo Torres', '3145551333', 'carloseduardo.torres@mail.com', 'Cll 80 #11-22, Cali');
INSERT INTO public.owners VALUES (91, 'Paola Andrea Ruiz', '3164441222', 'paola.ruiz@mail.com', 'Cra 20 #45-10, Barranquilla');
INSERT INTO public.owners VALUES (92, 'Esteban Vargas', '3183331111', 'esteban.vargas@mail.com', 'Cll 22 #30-90, Bogotá');
INSERT INTO public.owners VALUES (93, 'Daniela Hernández', '3202229990', 'daniela.hernandez@mail.com', 'Cra 14 #12-40, Medellín');
INSERT INTO public.owners VALUES (94, 'Luis Fernando Ramírez', '3101118889', 'luisfernando.ramirez@mail.com', 'Cll 60 #50-30, Cali');
INSERT INTO public.owners VALUES (95, 'Gabriela Pérez', '3129997778', 'gabriela.perez@mail.com', 'Cra 70 #22-55, Bogotá');
INSERT INTO public.owners VALUES (96, 'Matías González', '3148886667', 'matias.gonzalez@mail.com', 'Cll 11 #33-60, Cartagena');
INSERT INTO public.owners VALUES (97, 'Valeria Molina', '3157775556', 'valeria.molina@mail.com', 'Cra 30 #22-70, Medellín');
INSERT INTO public.owners VALUES (98, 'Felipe Arango', '3186664445', 'felipe.arango@mail.com', 'Cll 55 #40-80, Cali');
INSERT INTO public.owners VALUES (99, 'Natalia Jiménez', '3205553334', 'natalia.jimenez@mail.com', 'Cll 80 #10-20, Bogotá');
INSERT INTO public.owners VALUES (100, 'Juan David López', '3104442223', 'juandavid.lopez@mail.com', 'Cra 20 #33-90, Pereira');
INSERT INTO public.owners VALUES (101, 'Sara López', '3123331112', 'sara.lopez@mail.com', 'Cll 22 #40-70, Cali');
INSERT INTO public.owners VALUES (102, 'Miguel Rodríguez', '3142220001', 'miguel.rodriguez@mail.com', 'Cra 50 #60-40, Medellín');
INSERT INTO public.owners VALUES (103, 'Daniel García', '3151119992', 'daniel.garcia@mail.com', 'Cll 70 #25-22, Bogotá');


--
-- TOC entry 3653 (class 0 OID 131127)
-- Dependencies: 248
-- Data for Name: owners_audit; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3645 (class 0 OID 106642)
-- Dependencies: 240
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.payments VALUES (1, 1, 120.00, '2024-01-06');
INSERT INTO public.payments VALUES (2, 2, 95.00, '2024-01-11');
INSERT INTO public.payments VALUES (3, 3, 150.00, '2024-01-16');
INSERT INTO public.payments VALUES (4, 4, 80.00, '2024-01-21');
INSERT INTO public.payments VALUES (5, 5, 130.00, '2024-01-26');
INSERT INTO public.payments VALUES (6, 6, 200.00, '2024-02-02');
INSERT INTO public.payments VALUES (7, 7, 110.00, '2024-02-06');
INSERT INTO public.payments VALUES (8, 8, 175.00, '2024-02-11');
INSERT INTO public.payments VALUES (9, 9, 90.00, '2024-02-16');
INSERT INTO public.payments VALUES (10, 10, 160.00, '2024-02-21');
INSERT INTO public.payments VALUES (11, 11, 115.00, '2024-02-26');
INSERT INTO public.payments VALUES (12, 12, 140.00, '2024-03-02');
INSERT INTO public.payments VALUES (13, 13, 155.00, '2024-03-06');
INSERT INTO public.payments VALUES (14, 14, 190.00, '2024-03-11');
INSERT INTO public.payments VALUES (15, 15, 80.00, '2024-03-16');
INSERT INTO public.payments VALUES (16, 16, 125.00, '2024-03-21');
INSERT INTO public.payments VALUES (17, 17, 145.00, '2024-03-26');
INSERT INTO public.payments VALUES (18, 18, 100.00, '2024-03-31');
INSERT INTO public.payments VALUES (19, 19, 135.00, '2024-04-05');
INSERT INTO public.payments VALUES (20, 20, 200.00, '2024-04-10');
INSERT INTO public.payments VALUES (21, 21, 95.00, '2024-04-15');
INSERT INTO public.payments VALUES (22, 22, 185.00, '2024-04-20');
INSERT INTO public.payments VALUES (23, 23, 75.00, '2024-04-25');
INSERT INTO public.payments VALUES (24, 24, 160.00, '2024-04-30');
INSERT INTO public.payments VALUES (25, 25, 125.00, '2024-05-05');
INSERT INTO public.payments VALUES (26, 26, 140.00, '2024-05-10');
INSERT INTO public.payments VALUES (27, 27, 170.00, '2024-05-15');
INSERT INTO public.payments VALUES (28, 28, 110.00, '2024-05-20');
INSERT INTO public.payments VALUES (29, 29, 195.00, '2024-05-25');
INSERT INTO public.payments VALUES (30, 30, 130.00, '2024-05-30');
INSERT INTO public.payments VALUES (31, 31, 155.00, '2024-06-04');
INSERT INTO public.payments VALUES (32, 32, 200.00, '2024-06-09');
INSERT INTO public.payments VALUES (33, 33, 95.00, '2024-06-14');
INSERT INTO public.payments VALUES (34, 34, 125.00, '2024-06-19');
INSERT INTO public.payments VALUES (35, 35, 180.00, '2024-06-24');
INSERT INTO public.payments VALUES (36, 36, 160.00, '2024-06-29');
INSERT INTO public.payments VALUES (37, 37, 85.00, '2024-07-04');
INSERT INTO public.payments VALUES (38, 38, 190.00, '2024-07-09');
INSERT INTO public.payments VALUES (39, 39, 145.00, '2024-07-14');
INSERT INTO public.payments VALUES (40, 40, 100.00, '2024-07-19');
INSERT INTO public.payments VALUES (41, 41, 170.00, '2024-07-24');
INSERT INTO public.payments VALUES (42, 42, 150.00, '2024-07-29');
INSERT INTO public.payments VALUES (43, 43, 95.00, '2024-08-03');
INSERT INTO public.payments VALUES (44, 44, 135.00, '2024-08-08');
INSERT INTO public.payments VALUES (45, 45, 120.00, '2024-08-13');
INSERT INTO public.payments VALUES (46, 46, 210.00, '2024-08-18');
INSERT INTO public.payments VALUES (47, 47, 200.00, '2024-08-23');
INSERT INTO public.payments VALUES (48, 48, 130.00, '2024-08-28');
INSERT INTO public.payments VALUES (49, 49, 175.00, '2024-09-02');
INSERT INTO public.payments VALUES (50, 50, 145.00, '2024-09-07');
INSERT INTO public.payments VALUES (51, 51, 110.00, '2024-09-12');
INSERT INTO public.payments VALUES (52, 52, 165.00, '2024-09-17');
INSERT INTO public.payments VALUES (53, 53, 125.00, '2024-09-22');
INSERT INTO public.payments VALUES (54, 54, 180.00, '2024-09-27');
INSERT INTO public.payments VALUES (55, 55, 140.00, '2024-10-02');
INSERT INTO public.payments VALUES (56, 56, 105.00, '2024-10-07');
INSERT INTO public.payments VALUES (57, 57, 115.00, '2024-10-12');
INSERT INTO public.payments VALUES (58, 58, 190.00, '2024-10-17');
INSERT INTO public.payments VALUES (59, 59, 175.00, '2024-10-22');
INSERT INTO public.payments VALUES (60, 60, 220.00, '2024-10-27');
INSERT INTO public.payments VALUES (61, 61, 145.00, '2024-11-01');
INSERT INTO public.payments VALUES (62, 62, 135.00, '2024-11-06');
INSERT INTO public.payments VALUES (63, 63, 180.00, '2024-11-11');
INSERT INTO public.payments VALUES (64, 64, 95.00, '2024-11-16');
INSERT INTO public.payments VALUES (65, 65, 125.00, '2024-11-21');
INSERT INTO public.payments VALUES (66, 66, 200.00, '2024-11-26');
INSERT INTO public.payments VALUES (67, 67, 155.00, '2024-12-01');
INSERT INTO public.payments VALUES (68, 68, 175.00, '2024-12-06');
INSERT INTO public.payments VALUES (69, 69, 140.00, '2024-12-11');
INSERT INTO public.payments VALUES (70, 70, 190.00, '2024-12-16');
INSERT INTO public.payments VALUES (71, 71, 85.00, '2024-12-21');
INSERT INTO public.payments VALUES (72, 72, 170.00, '2024-12-26');
INSERT INTO public.payments VALUES (73, 73, 120.00, '2024-12-31');
INSERT INTO public.payments VALUES (74, 74, 160.00, '2025-01-05');
INSERT INTO public.payments VALUES (75, 75, 150.00, '2025-01-10');
INSERT INTO public.payments VALUES (76, 76, 95.00, '2025-01-15');
INSERT INTO public.payments VALUES (77, 77, 200.00, '2025-01-20');
INSERT INTO public.payments VALUES (78, 78, 185.00, '2025-01-25');
INSERT INTO public.payments VALUES (79, 79, 135.00, '2025-01-30');
INSERT INTO public.payments VALUES (80, 80, 115.00, '2025-02-04');
INSERT INTO public.payments VALUES (81, 81, 125.00, '2025-02-09');
INSERT INTO public.payments VALUES (82, 82, 210.00, '2025-02-14');
INSERT INTO public.payments VALUES (83, 83, 170.00, '2025-02-19');
INSERT INTO public.payments VALUES (84, 84, 140.00, '2025-02-24');
INSERT INTO public.payments VALUES (85, 85, 185.00, '2025-03-01');
INSERT INTO public.payments VALUES (86, 86, 130.00, '2025-03-06');
INSERT INTO public.payments VALUES (87, 87, 95.00, '2025-03-11');
INSERT INTO public.payments VALUES (88, 88, 160.00, '2025-03-16');
INSERT INTO public.payments VALUES (89, 89, 120.00, '2025-03-21');
INSERT INTO public.payments VALUES (90, 90, 200.00, '2025-03-26');
INSERT INTO public.payments VALUES (91, 91, 145.00, '2025-03-31');
INSERT INTO public.payments VALUES (92, 92, 155.00, '2025-04-05');
INSERT INTO public.payments VALUES (93, 93, 170.00, '2025-04-10');
INSERT INTO public.payments VALUES (94, 94, 180.00, '2025-04-15');
INSERT INTO public.payments VALUES (95, 95, 125.00, '2025-04-20');
INSERT INTO public.payments VALUES (96, 96, 135.00, '2025-04-25');
INSERT INTO public.payments VALUES (97, 97, 195.00, '2025-04-30');
INSERT INTO public.payments VALUES (98, 98, 210.00, '2025-05-05');
INSERT INTO public.payments VALUES (99, 99, 160.00, '2025-05-10');
INSERT INTO public.payments VALUES (100, 100, 175.00, '2025-05-15');


--
-- TOC entry 3655 (class 0 OID 131149)
-- Dependencies: 250
-- Data for Name: payments_audit; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3625 (class 0 OID 106507)
-- Dependencies: 220
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pets VALUES (1, 'Max', 'Perro', 'Labrador Retriever', '2018-05-10', 1);
INSERT INTO public.pets VALUES (2, 'Luna', 'Gato', 'Persa', '2020-03-15', 2);
INSERT INTO public.pets VALUES (3, 'Rocky', 'Perro', 'Bulldog Inglés', '2019-08-22', 3);
INSERT INTO public.pets VALUES (4, 'Milo', 'Perro', 'Beagle', '2021-02-11', 4);
INSERT INTO public.pets VALUES (5, 'Nala', 'Gato', 'Siames', '2020-07-03', 5);
INSERT INTO public.pets VALUES (6, 'Simba', 'Gato', 'Bengalí', '2019-11-05', 6);
INSERT INTO public.pets VALUES (7, 'Bella', 'Perro', 'Golden Retriever', '2021-01-25', 7);
INSERT INTO public.pets VALUES (8, 'Coco', 'Ave', 'Cacatúa', '2017-09-19', 8);
INSERT INTO public.pets VALUES (9, 'Toby', 'Perro', 'Poodle', '2020-10-10', 9);
INSERT INTO public.pets VALUES (10, 'Kira', 'Gato', 'Maine Coon', '2022-01-05', 10);
INSERT INTO public.pets VALUES (11, 'Zeus', 'Perro', 'Rottweiler', '2019-04-12', 11);
INSERT INTO public.pets VALUES (12, 'Maya', 'Perro', 'Shih Tzu', '2021-09-23', 12);
INSERT INTO public.pets VALUES (13, 'Oliver', 'Gato', 'British Shorthair', '2020-05-17', 13);
INSERT INTO public.pets VALUES (14, 'Lola', 'Perro', 'Chihuahua', '2022-03-12', 14);
INSERT INTO public.pets VALUES (15, 'Chester', 'Conejo', 'Mini Lop', '2021-06-19', 15);
INSERT INTO public.pets VALUES (16, 'Daisy', 'Perro', 'Schnauzer', '2019-08-10', 16);
INSERT INTO public.pets VALUES (17, 'Rex', 'Perro', 'Pastor Alemán', '2018-02-14', 17);
INSERT INTO public.pets VALUES (18, 'Misha', 'Gato', 'Ragdoll', '2020-12-30', 18);
INSERT INTO public.pets VALUES (19, 'Tommy', 'Perro', 'Dálmata', '2019-09-02', 19);
INSERT INTO public.pets VALUES (20, 'Cleo', 'Gato', 'Angora', '2021-10-25', 20);
INSERT INTO public.pets VALUES (21, 'Loki', 'Gato', 'Siberiano', '2019-05-08', 21);
INSERT INTO public.pets VALUES (22, 'Bruno', 'Perro', 'Boxer', '2018-07-19', 22);
INSERT INTO public.pets VALUES (23, 'Nina', 'Perro', 'Cocker Spaniel', '2020-01-14', 23);
INSERT INTO public.pets VALUES (24, 'Tango', 'Ave', 'Periquito', '2021-04-01', 24);
INSERT INTO public.pets VALUES (25, 'Sasha', 'Gato', 'Esfinge', '2018-11-07', 25);
INSERT INTO public.pets VALUES (26, 'Chispa', 'Perro', 'Jack Russell', '2022-02-15', 26);
INSERT INTO public.pets VALUES (27, 'Bobby', 'Perro', 'Husky Siberiano', '2019-03-11', 27);
INSERT INTO public.pets VALUES (28, 'Lía', 'Gato', 'Exótico de Pelo Corto', '2020-10-06', 28);
INSERT INTO public.pets VALUES (29, 'Timon', 'Gato', 'Abisinio', '2021-01-09', 29);
INSERT INTO public.pets VALUES (30, 'Bolt', 'Perro', 'Border Collie', '2018-12-02', 30);
INSERT INTO public.pets VALUES (31, 'Nube', 'Gato', 'Ruso Azul', '2019-07-18', 31);
INSERT INTO public.pets VALUES (32, 'Koko', 'Ave', 'Loro Amazonas', '2016-09-09', 32);
INSERT INTO public.pets VALUES (33, 'Princesa', 'Perro', 'Pomerania', '2020-06-15', 33);
INSERT INTO public.pets VALUES (34, 'Jack', 'Perro', 'Fox Terrier', '2018-10-11', 34);
INSERT INTO public.pets VALUES (35, 'Gala', 'Gato', 'Devon Rex', '2021-08-14', 35);
INSERT INTO public.pets VALUES (36, 'Oreo', 'Conejo', 'Rex', '2022-04-09', 36);
INSERT INTO public.pets VALUES (37, 'Balto', 'Perro', 'Alaskan Malamute', '2017-11-22', 37);
INSERT INTO public.pets VALUES (38, 'Molly', 'Perro', 'Corgi', '2020-09-01', 38);
INSERT INTO public.pets VALUES (39, 'Bimba', 'Gato', 'Burmes', '2019-12-20', 39);
INSERT INTO public.pets VALUES (40, 'Fiona', 'Perro', 'Yorkshire Terrier', '2021-05-16', 40);
INSERT INTO public.pets VALUES (41, 'Leo', 'Gato', 'Oriental', '2018-03-10', 41);
INSERT INTO public.pets VALUES (42, 'Rocco', 'Perro', 'Pitbull', '2020-11-27', 42);
INSERT INTO public.pets VALUES (43, 'Perla', 'Perro', 'Maltés', '2021-09-09', 43);
INSERT INTO public.pets VALUES (44, 'Taz', 'Gato', 'Manx', '2022-02-18', 44);
INSERT INTO public.pets VALUES (45, 'Lucky', 'Perro', 'Caniche', '2019-01-07', 45);
INSERT INTO public.pets VALUES (46, 'Bela', 'Gato', 'Savannah', '2021-06-11', 46);
INSERT INTO public.pets VALUES (47, 'Nico', 'Perro', 'Samoyedo', '2020-07-25', 47);
INSERT INTO public.pets VALUES (48, 'Choco', 'Perro', 'Bulldog Francés', '2019-12-02', 48);
INSERT INTO public.pets VALUES (49, 'Suri', 'Gato', 'Cornish Rex', '2020-08-10', 49);
INSERT INTO public.pets VALUES (50, 'Otto', 'Perro', 'Doberman', '2018-05-19', 50);
INSERT INTO public.pets VALUES (51, 'Mimi', 'Gato', 'Calicó', '2021-02-04', 51);
INSERT INTO public.pets VALUES (52, 'Shadow', 'Perro', 'Pastor Belga', '2019-04-25', 52);
INSERT INTO public.pets VALUES (53, 'Tina', 'Gato', 'Fold Escocés', '2020-06-23', 53);
INSERT INTO public.pets VALUES (54, 'Thor', 'Perro', 'Gran Danés', '2018-09-01', 54);
INSERT INTO public.pets VALUES (55, 'Pelusa', 'Gato', 'Himalayo', '2022-01-14', 55);
INSERT INTO public.pets VALUES (56, 'Menta', 'Gato', 'Sagrado de Birmania', '2019-03-29', 56);
INSERT INTO public.pets VALUES (57, 'Brisa', 'Gato', 'Balines', '2020-11-10', 57);
INSERT INTO public.pets VALUES (58, 'Mango', 'Ave', 'Agapornis', '2021-04-12', 58);
INSERT INTO public.pets VALUES (59, 'Cira', 'Perro', 'Vizsla', '2019-08-30', 59);
INSERT INTO public.pets VALUES (60, 'Toby Jr', 'Perro', 'Whippet', '2021-07-05', 60);
INSERT INTO public.pets VALUES (61, 'Sombra', 'Perro', 'Terranova', '2018-06-09', 61);
INSERT INTO public.pets VALUES (62, 'Kiara', 'Perro', 'Shar Pei', '2020-03-18', 62);
INSERT INTO public.pets VALUES (63, 'Canelita', 'Gato', 'Tonquinés', '2021-09-28', 63);
INSERT INTO public.pets VALUES (64, 'Noa', 'Gato', 'Chartreux', '2020-01-20', 64);
INSERT INTO public.pets VALUES (65, 'Duke', 'Perro', 'Weimaraner', '2019-10-12', 65);
INSERT INTO public.pets VALUES (66, 'Nemo', 'Pez', 'Goldfish', '2022-03-10', 66);
INSERT INTO public.pets VALUES (67, 'Dory', 'Pez', 'Pez Cirujano Azul', '2021-11-09', 67);
INSERT INTO public.pets VALUES (68, 'Spike', 'Reptil', 'Iguana Verde', '2020-08-20', 68);
INSERT INTO public.pets VALUES (69, 'Torty', 'Reptil', 'Tortuga de Orejas Rojas', '2019-02-14', 69);
INSERT INTO public.pets VALUES (70, 'Blue', 'Ave', 'Guacamayo Azulamarillo', '2018-07-30', 70);
INSERT INTO public.pets VALUES (71, 'Milo Jr', 'Perro', 'Beagle', '2021-05-11', 71);
INSERT INTO public.pets VALUES (72, 'Tomasa', 'Gato', 'Común Europeo', '2020-10-10', 72);
INSERT INTO public.pets VALUES (73, 'Pipo', 'Perro', 'Basset Hound', '2019-03-22', 73);
INSERT INTO public.pets VALUES (74, 'Candy', 'Perro', 'Shiba Inu', '2021-07-02', 74);
INSERT INTO public.pets VALUES (75, 'Runa', 'Gato', 'Selkirk Rex', '2020-12-03', 75);
INSERT INTO public.pets VALUES (76, 'Zoe', 'Perro', 'Pug', '2021-08-21', 76);
INSERT INTO public.pets VALUES (77, 'Milo G', 'Perro', 'Labrador Chocolate', '2020-09-30', 77);
INSERT INTO public.pets VALUES (78, 'Greta', 'Perro', 'Pastor Australiano', '2018-04-26', 78);
INSERT INTO public.pets VALUES (79, 'Nino', 'Perro', 'Caniche Toy', '2021-03-03', 79);
INSERT INTO public.pets VALUES (80, 'Sandy', 'Gato', 'Munchkin', '2020-05-28', 80);
INSERT INTO public.pets VALUES (81, 'Osa', 'Perro', 'San Bernardo', '2019-12-17', 81);
INSERT INTO public.pets VALUES (82, 'Goku', 'Gato', 'Oriental de Pelo Corto', '2021-01-20', 82);
INSERT INTO public.pets VALUES (83, 'Molly Jr', 'Perro', 'Corgi', '2020-11-02', 83);
INSERT INTO public.pets VALUES (84, 'Arya', 'Gato', 'Persa Blanco', '2022-03-15', 84);
INSERT INTO public.pets VALUES (85, 'Tom', 'Gato', 'Común Gris', '2019-05-22', 85);
INSERT INTO public.pets VALUES (86, 'Jerry', 'Gato', 'Común Marrón', '2019-05-22', 85);
INSERT INTO public.pets VALUES (87, 'Lenny', 'Perro', 'Galgo Español', '2018-10-01', 86);
INSERT INTO public.pets VALUES (88, 'Trixie', 'Perro', 'Shih Tzu', '2021-04-06', 87);
INSERT INTO public.pets VALUES (89, 'Rexy', 'Perro', 'Bulldog Americano', '2020-07-15', 88);
INSERT INTO public.pets VALUES (90, 'Cleo Jr', 'Gato', 'Siames', '2021-12-18', 89);
INSERT INTO public.pets VALUES (91, 'Cora', 'Gato', 'Bengalí', '2022-02-01', 90);
INSERT INTO public.pets VALUES (92, 'Ares', 'Perro', 'Pitbull Terrier', '2019-08-08', 91);
INSERT INTO public.pets VALUES (93, 'Ruby', 'Perro', 'Caniche', '2021-01-25', 92);
INSERT INTO public.pets VALUES (94, 'Nano', 'Gato', 'Angora Turco', '2020-06-16', 93);
INSERT INTO public.pets VALUES (95, 'Misu', 'Gato', 'Maine Coon', '2020-09-14', 94);
INSERT INTO public.pets VALUES (96, 'Hércules', 'Perro', 'Gran Danés', '2018-12-25', 95);
INSERT INTO public.pets VALUES (97, 'Olaf', 'Perro', 'Samoyedo', '2019-11-13', 96);
INSERT INTO public.pets VALUES (98, 'Pepe', 'Ave', 'Perico Australiano', '2021-03-04', 97);
INSERT INTO public.pets VALUES (99, 'Sky', 'Perro', 'Pastor Suizo', '2020-06-12', 98);
INSERT INTO public.pets VALUES (100, 'Canela', 'Gato', 'Común Tricolor', '2022-01-01', 99);
INSERT INTO public.pets VALUES (101, 'Thor Jr', 'Perro', 'Doberman', '2021-05-10', 100);


--
-- TOC entry 3657 (class 0 OID 131171)
-- Dependencies: 252
-- Data for Name: pets_audit; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3643 (class 0 OID 106623)
-- Dependencies: 238
-- Data for Name: prescription_medications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.prescription_medications VALUES (1, 1, 1, 10, 'Administrar un comprimido diario durante 10 días.');
INSERT INTO public.prescription_medications VALUES (2, 2, 2, 14, 'Dar una dosis cada 12 horas con comida.');
INSERT INTO public.prescription_medications VALUES (3, 3, 3, 7, 'Suministrar media tableta por la mañana.');
INSERT INTO public.prescription_medications VALUES (4, 4, 4, 5, 'Aplicar una dosis diaria por 5 días.');
INSERT INTO public.prescription_medications VALUES (5, 5, 5, 10, 'Una cápsula cada 8 horas por vía oral.');
INSERT INTO public.prescription_medications VALUES (6, 6, 6, 30, 'Agregar al alimento una vez al día.');
INSERT INTO public.prescription_medications VALUES (7, 7, 7, 14, 'Inyectar una dosis cada 24 horas.');
INSERT INTO public.prescription_medications VALUES (8, 8, 8, 10, 'Aplicar 2 gotas por ojo cada 8 horas.');
INSERT INTO public.prescription_medications VALUES (9, 9, 9, 20, 'Usar dos veces al día tras el baño.');
INSERT INTO public.prescription_medications VALUES (10, 10, 10, 15, 'Agregar una dosis a la comida principal.');
INSERT INTO public.prescription_medications VALUES (11, 11, 11, 12, 'Aplicar una pipeta cada mes.');
INSERT INTO public.prescription_medications VALUES (12, 12, 12, 1, 'Una dosis oral única.');
INSERT INTO public.prescription_medications VALUES (13, 13, 13, 5, 'Administrar después de la actividad física.');
INSERT INTO public.prescription_medications VALUES (14, 14, 14, 10, 'Aplicar gel dental una vez al día.');
INSERT INTO public.prescription_medications VALUES (15, 15, 15, 30, 'Usar alimento renal exclusivo.');
INSERT INTO public.prescription_medications VALUES (16, 16, 16, 7, 'Inyectar una dosis diaria por 7 días.');
INSERT INTO public.prescription_medications VALUES (17, 17, 17, 10, 'Aplicar 4 gotas por oído dos veces al día.');
INSERT INTO public.prescription_medications VALUES (18, 18, 18, 10, 'Aplicar gotas cada 6 horas.');
INSERT INTO public.prescription_medications VALUES (19, 19, 19, 1, 'Aplicar una capa fina sobre la piel afectada.');
INSERT INTO public.prescription_medications VALUES (20, 20, 20, 10, 'Dar una tableta diaria por 10 días.');
INSERT INTO public.prescription_medications VALUES (21, 21, 21, 14, 'Suministrar cada 12 horas por 7 días.');
INSERT INTO public.prescription_medications VALUES (22, 22, 22, 1, 'Repetir cada 3 meses.');
INSERT INTO public.prescription_medications VALUES (23, 23, 23, 20, 'Alimentar exclusivamente con dieta hipoalergénica.');
INSERT INTO public.prescription_medications VALUES (24, 24, 24, 5, 'Dar media tableta por la mañana.');
INSERT INTO public.prescription_medications VALUES (25, 25, 25, 1, 'Aplicar pomada tras limpieza de herida.');
INSERT INTO public.prescription_medications VALUES (26, 26, 26, 2, 'Administrar desparasitario y vacuna en el mismo día.');
INSERT INTO public.prescription_medications VALUES (27, 27, 27, 10, 'Dar una dosis por 10 días.');
INSERT INTO public.prescription_medications VALUES (28, 28, 28, 30, 'Un comprimido diario con alimento.');
INSERT INTO public.prescription_medications VALUES (29, 29, 29, 30, 'Agregar suplemento con cada comida.');
INSERT INTO public.prescription_medications VALUES (30, 30, 30, 10, 'Administrar cada 8 horas por vía oral.');
INSERT INTO public.prescription_medications VALUES (31, 31, 31, 14, 'Dar una cápsula cada 12 horas.');
INSERT INTO public.prescription_medications VALUES (32, 32, 32, 5, 'Aplicar 1 gota en cada ojo dos veces al día.');
INSERT INTO public.prescription_medications VALUES (33, 33, 33, 1, 'Una dosis mensual preventiva.');
INSERT INTO public.prescription_medications VALUES (34, 34, 34, 60, 'Dieta y monitoreo diario de glucosa.');
INSERT INTO public.prescription_medications VALUES (35, 35, 35, 10, 'Dar antibiótico oral cada 12 horas.');
INSERT INTO public.prescription_medications VALUES (36, 36, 36, 14, 'Usar según indicaciones postoperatorias.');
INSERT INTO public.prescription_medications VALUES (37, 37, 37, 7, 'Aplicar antihistamínico una vez al día.');
INSERT INTO public.prescription_medications VALUES (38, 38, 38, 3, 'Aplicar ungüento tras baño medicado.');
INSERT INTO public.prescription_medications VALUES (39, 39, 39, 10, 'Dar analgésico cada 8 horas.');
INSERT INTO public.prescription_medications VALUES (40, 40, 40, 30, 'Agregar suplemento a la comida.');
INSERT INTO public.prescription_medications VALUES (41, 41, 41, 14, 'Antibiótico oral cada 12 horas.');
INSERT INTO public.prescription_medications VALUES (42, 42, 42, 10, 'Aplicar 3 gotas por oído cada 8 horas.');
INSERT INTO public.prescription_medications VALUES (43, 43, 43, 1, 'Usar pipeta una vez al mes.');
INSERT INTO public.prescription_medications VALUES (44, 44, 44, 1, 'Administrar cada 30 días.');
INSERT INTO public.prescription_medications VALUES (45, 45, 45, 5, 'Una dosis diaria por 5 días.');
INSERT INTO public.prescription_medications VALUES (46, 46, 46, 10, 'Aplicar gotas cada 6 horas.');
INSERT INTO public.prescription_medications VALUES (47, 47, 47, 7, 'Limpiar herida antes de aplicar.');
INSERT INTO public.prescription_medications VALUES (48, 48, 48, 30, 'Una cápsula diaria por un mes.');
INSERT INTO public.prescription_medications VALUES (49, 49, 49, 30, 'Cambiar alimento gradualmente por bajo en calorías.');
INSERT INTO public.prescription_medications VALUES (50, 50, 50, 4, 'Baños semanales durante un mes.');
INSERT INTO public.prescription_medications VALUES (51, 51, 51, 7, 'Antibiótico una vez al día.');
INSERT INTO public.prescription_medications VALUES (52, 52, 52, 5, 'Dar analgésico cada 12 horas.');
INSERT INTO public.prescription_medications VALUES (53, 53, 53, 10, 'Aplicar una dosis diaria tras limpieza dental.');
INSERT INTO public.prescription_medications VALUES (54, 54, 54, 30, 'Suplemento de hierro diario.');
INSERT INTO public.prescription_medications VALUES (55, 55, 55, 3, 'Administrar cada 12 horas por 3 días.');
INSERT INTO public.prescription_medications VALUES (56, 56, 56, 10, 'Dar una cápsula cada 8 horas.');
INSERT INTO public.prescription_medications VALUES (57, 57, 57, 1, 'Aplicar pomada dos veces al día.');
INSERT INTO public.prescription_medications VALUES (58, 58, 58, 1, 'Administrar analgésico solo si hay dolor.');
INSERT INTO public.prescription_medications VALUES (59, 59, 59, 20, 'Agregar suplemento proteico a las comidas.');
INSERT INTO public.prescription_medications VALUES (60, 60, 60, 1, 'Desparasitar con control veterinario.');
INSERT INTO public.prescription_medications VALUES (61, 61, 61, 14, 'Dar cada 12 horas con alimento.');
INSERT INTO public.prescription_medications VALUES (62, 62, 62, 1, 'Aplicar 1 gota en cada ojo.');
INSERT INTO public.prescription_medications VALUES (63, 63, 63, 4, 'Baños con clorhexidina semanal.');
INSERT INTO public.prescription_medications VALUES (64, 64, 64, 30, 'Dieta renal con control cada 15 días.');
INSERT INTO public.prescription_medications VALUES (65, 65, 65, 7, 'Dar analgésico oral por 7 días.');
INSERT INTO public.prescription_medications VALUES (66, 66, 66, 1, 'Administrar dosis única oral.');
INSERT INTO public.prescription_medications VALUES (67, 67, 67, 10, 'Dar antihistamínico diario.');
INSERT INTO public.prescription_medications VALUES (68, 68, 68, 10, 'Aplicar 5 gotas por oído cada 8 horas.');
INSERT INTO public.prescription_medications VALUES (69, 69, 69, 1, 'Aplicar 1 gota por ojo tres veces al día.');
INSERT INTO public.prescription_medications VALUES (70, 70, 70, 30, 'Usar alimento bajo en calorías.');
INSERT INTO public.prescription_medications VALUES (71, 71, 71, 30, 'Agregar al alimento una vez al día.');
INSERT INTO public.prescription_medications VALUES (72, 72, 72, 1, 'Aplicar antiparasitario externo mensual.');
INSERT INTO public.prescription_medications VALUES (73, 73, 73, 10, 'Dar antibiótico y analgésico por 10 días.');
INSERT INTO public.prescription_medications VALUES (74, 74, 74, 1, 'Limpiar herida con yodo diariamente.');
INSERT INTO public.prescription_medications VALUES (75, 75, 75, 1, 'Verificar refuerzo de vacunas.');
INSERT INTO public.prescription_medications VALUES (76, 76, 76, 30, 'Agregar fibra a la dieta.');
INSERT INTO public.prescription_medications VALUES (77, 77, 77, 10, 'Dar antibiótico preventivo diario.');
INSERT INTO public.prescription_medications VALUES (78, 78, 78, 7, 'Administrar dosis cada 12 horas.');
INSERT INTO public.prescription_medications VALUES (79, 79, 79, 30, 'Suplemento de calcio diario.');
INSERT INTO public.prescription_medications VALUES (80, 80, 80, 1, 'Cepillado dental semanal.');
INSERT INTO public.prescription_medications VALUES (81, 81, 81, 10, 'Dar analgésico cada 12 horas.');
INSERT INTO public.prescription_medications VALUES (82, 82, 82, 5, 'Aplicar crema en zona afectada.');
INSERT INTO public.prescription_medications VALUES (83, 83, 83, 4, 'Baños medicados semanales.');
INSERT INTO public.prescription_medications VALUES (84, 84, 84, 10, 'Antibiótico oral dos veces al día.');
INSERT INTO public.prescription_medications VALUES (85, 85, 85, 1, 'Aplicar pomada ocular cada 6 horas.');
INSERT INTO public.prescription_medications VALUES (86, 86, 86, 10, 'Dieta blanda durante recuperación.');
INSERT INTO public.prescription_medications VALUES (87, 87, 87, 7, 'Administrar analgésico diario.');
INSERT INTO public.prescription_medications VALUES (88, 88, 88, 1, 'Limpiar con suero fisiológico.');
INSERT INTO public.prescription_medications VALUES (89, 89, 89, 30, 'Dar suplemento vitamínico diario.');
INSERT INTO public.prescription_medications VALUES (90, 90, 90, 10, 'Aplicar crema antialérgica.');
INSERT INTO public.prescription_medications VALUES (91, 91, 91, 1, 'Aplicar pomada sobre sutura.');
INSERT INTO public.prescription_medications VALUES (92, 92, 92, 30, 'Dieta hepática exclusiva.');
INSERT INTO public.prescription_medications VALUES (93, 93, 93, 1, 'Desparasitación general semestral.');
INSERT INTO public.prescription_medications VALUES (94, 94, 94, 7, 'Antibiótico oral cada 12 horas.');
INSERT INTO public.prescription_medications VALUES (95, 95, 95, 1, 'Limpieza dental con cepillo suave.');
INSERT INTO public.prescription_medications VALUES (96, 96, 96, 10, 'Analgésico oral diario.');
INSERT INTO public.prescription_medications VALUES (97, 97, 97, 3, 'Administrar probiótico por 3 días.');
INSERT INTO public.prescription_medications VALUES (98, 98, 98, 10, 'Dar antibiótico oral por 10 días.');
INSERT INTO public.prescription_medications VALUES (99, 99, 99, 1, 'Aplicar pipeta antipulgas mensual.');
INSERT INTO public.prescription_medications VALUES (100, 100, 100, 30, 'Suplemento energético diario.');


--
-- TOC entry 3661 (class 0 OID 131215)
-- Dependencies: 256
-- Data for Name: prescription_medications_audit; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3641 (class 0 OID 106609)
-- Dependencies: 236
-- Data for Name: prescriptions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.prescriptions VALUES (1, 1, 'Administrar antiparasitario oral cada 3 meses.');
INSERT INTO public.prescriptions VALUES (2, 2, 'Aplicar refuerzo de vacuna en 21 días.');
INSERT INTO public.prescriptions VALUES (3, 3, 'Mantener dieta balanceada y controlar peso.');
INSERT INTO public.prescriptions VALUES (4, 4, 'Limpiar la herida dos veces al día con solución salina.');
INSERT INTO public.prescriptions VALUES (5, 5, 'Aplicar pomada antibiótica cada 12 horas.');
INSERT INTO public.prescriptions VALUES (6, 6, 'Dar baño medicado semanal por 3 semanas.');
INSERT INTO public.prescriptions VALUES (7, 7, 'Cepillar dientes cada 2 días y aplicar enjuague bucal.');
INSERT INTO public.prescriptions VALUES (8, 8, 'Control postoperatorio en 10 días.');
INSERT INTO public.prescriptions VALUES (9, 9, 'Evitar actividad física intensa por 7 días.');
INSERT INTO public.prescriptions VALUES (10, 10, 'Revisar resultados de ecografía en próxima cita.');
INSERT INTO public.prescriptions VALUES (11, 11, 'Aplicar gotas óticas dos veces al día.');
INSERT INTO public.prescriptions VALUES (12, 12, 'Suspender medicamento si presenta vómito o diarrea.');
INSERT INTO public.prescriptions VALUES (13, 13, 'Repetir curación cada 48 horas.');
INSERT INTO public.prescriptions VALUES (14, 14, 'Administrar antibiótico por 5 días consecutivos.');
INSERT INTO public.prescriptions VALUES (15, 15, 'Continuar hidratación oral abundante.');
INSERT INTO public.prescriptions VALUES (16, 16, 'Monitorear temperatura corporal a diario.');
INSERT INTO public.prescriptions VALUES (17, 17, 'Mantener vendaje seco y limpio.');
INSERT INTO public.prescriptions VALUES (18, 18, 'Control de análisis en una semana.');
INSERT INTO public.prescriptions VALUES (19, 19, 'Administrar probióticos junto con el alimento.');
INSERT INTO public.prescriptions VALUES (20, 20, 'Evitar exposición al sol directo por 3 días.');
INSERT INTO public.prescriptions VALUES (21, 21, 'Aplicar gotas oculares tres veces al día.');
INSERT INTO public.prescriptions VALUES (22, 22, 'Suspender tratamiento si aparece inflamación.');
INSERT INTO public.prescriptions VALUES (23, 23, 'Revisión postquirúrgica en 10 días.');
INSERT INTO public.prescriptions VALUES (24, 24, 'Control de vacunación al mes siguiente.');
INSERT INTO public.prescriptions VALUES (25, 25, 'Dar suplemento vitamínico diario por 15 días.');
INSERT INTO public.prescriptions VALUES (26, 26, 'Mantener dieta blanda durante 3 días.');
INSERT INTO public.prescriptions VALUES (27, 27, 'Revisar oído derecho en próxima cita.');
INSERT INTO public.prescriptions VALUES (28, 28, 'Aplicar suero subcutáneo según indicación.');
INSERT INTO public.prescriptions VALUES (29, 29, 'Registrar cambios de comportamiento.');
INSERT INTO public.prescriptions VALUES (30, 30, 'Control anual recomendado.');
INSERT INTO public.prescriptions VALUES (31, 31, 'Revisión dental cada 6 meses.');
INSERT INTO public.prescriptions VALUES (32, 32, 'Mantener ejercicio moderado diario.');
INSERT INTO public.prescriptions VALUES (33, 33, 'Aplicar pomada en zona afectada por 7 días.');
INSERT INTO public.prescriptions VALUES (34, 34, 'Control en laboratorio dentro de 15 días.');
INSERT INTO public.prescriptions VALUES (35, 35, 'Continuar medicación hasta terminar el frasco.');
INSERT INTO public.prescriptions VALUES (36, 36, 'Aplicar vacuna refuerzo en 1 año.');
INSERT INTO public.prescriptions VALUES (37, 37, 'Evitar contacto con otros animales por 5 días.');
INSERT INTO public.prescriptions VALUES (38, 38, 'Limpieza diaria con solución antiséptica.');
INSERT INTO public.prescriptions VALUES (39, 39, 'Dar medicación oral cada 8 horas.');
INSERT INTO public.prescriptions VALUES (40, 40, 'Regresar para control de peso en 2 semanas.');
INSERT INTO public.prescriptions VALUES (41, 41, 'Suministrar agua limpia y abundante.');
INSERT INTO public.prescriptions VALUES (42, 42, 'Evitar humedad en zona de la herida.');
INSERT INTO public.prescriptions VALUES (43, 43, 'Monitorear apetito y nivel de energía.');
INSERT INTO public.prescriptions VALUES (44, 44, 'Dar alimento bajo en grasas por 10 días.');
INSERT INTO public.prescriptions VALUES (45, 45, 'Cepillar pelaje a diario.');
INSERT INTO public.prescriptions VALUES (46, 46, 'Administrar gotas óticas por 5 días.');
INSERT INTO public.prescriptions VALUES (47, 47, 'Control en 7 días para evaluación.');
INSERT INTO public.prescriptions VALUES (48, 48, 'Suspender medicamento si hay signos de alergia.');
INSERT INTO public.prescriptions VALUES (49, 49, 'Realizar caminatas cortas diariamente.');
INSERT INTO public.prescriptions VALUES (50, 50, 'No mojar la zona tratada.');
INSERT INTO public.prescriptions VALUES (51, 51, 'Dar medicación con el alimento.');
INSERT INTO public.prescriptions VALUES (52, 52, 'Repetir análisis si los síntomas persisten.');
INSERT INTO public.prescriptions VALUES (53, 53, 'Aplicar suero vitamínico una vez al día.');
INSERT INTO public.prescriptions VALUES (54, 54, 'Mantener limpieza de la jaula o cama.');
INSERT INTO public.prescriptions VALUES (55, 55, 'Dar baño antipulgas cada 15 días.');
INSERT INTO public.prescriptions VALUES (56, 56, 'Evitar rascado en zona de tratamiento.');
INSERT INTO public.prescriptions VALUES (57, 57, 'Revisión de sutura en 10 días.');
INSERT INTO public.prescriptions VALUES (58, 58, 'Mantener reposo absoluto por 3 días.');
INSERT INTO public.prescriptions VALUES (59, 59, 'Administrar antiinflamatorio por 5 días.');
INSERT INTO public.prescriptions VALUES (60, 60, 'Dar medicación con agua fresca.');
INSERT INTO public.prescriptions VALUES (61, 61, 'Aplicar crema hidratante en patas secas.');
INSERT INTO public.prescriptions VALUES (62, 62, 'Mantener en lugar fresco y ventilado.');
INSERT INTO public.prescriptions VALUES (63, 63, 'Evitar contacto con animales enfermos.');
INSERT INTO public.prescriptions VALUES (64, 64, 'Revisión de parto en próxima semana.');
INSERT INTO public.prescriptions VALUES (65, 65, 'Aplicar antibiótico inyectable por 3 días.');
INSERT INTO public.prescriptions VALUES (66, 66, 'Cepillar al animal diariamente.');
INSERT INTO public.prescriptions VALUES (67, 67, 'Administrar analgésico según necesidad.');
INSERT INTO public.prescriptions VALUES (68, 68, 'Evitar subir escaleras hasta nueva orden.');
INSERT INTO public.prescriptions VALUES (69, 69, 'Control veterinario mensual.');
INSERT INTO public.prescriptions VALUES (70, 70, 'Dar alimento húmedo para mejor digestión.');
INSERT INTO public.prescriptions VALUES (71, 71, 'Limpieza bucal tres veces por semana.');
INSERT INTO public.prescriptions VALUES (72, 72, 'Monitorear reflejos y respuesta motora.');
INSERT INTO public.prescriptions VALUES (73, 73, 'Administrar anticonvulsivo diario.');
INSERT INTO public.prescriptions VALUES (74, 74, 'Control endocrino trimestral.');
INSERT INTO public.prescriptions VALUES (75, 75, 'Revisión hormonal en 2 semanas.');
INSERT INTO public.prescriptions VALUES (76, 76, 'Aplicar insulina según glucemia medida.');
INSERT INTO public.prescriptions VALUES (77, 77, 'Curar absceso con solución salina.');
INSERT INTO public.prescriptions VALUES (78, 78, 'Aplicar tratamiento ótico completo.');
INSERT INTO public.prescriptions VALUES (79, 79, 'Dar carbón activado en caso de ingestión accidental.');
INSERT INTO public.prescriptions VALUES (80, 80, 'Mantener observación continua 24 horas.');
INSERT INTO public.prescriptions VALUES (81, 81, 'Repetir desparasitación en 3 meses.');
INSERT INTO public.prescriptions VALUES (82, 82, 'Ofrecer dieta baja en calorías.');
INSERT INTO public.prescriptions VALUES (83, 83, 'Control inmunológico semestral.');
INSERT INTO public.prescriptions VALUES (84, 84, 'Realizar nebulizaciones dos veces al día.');
INSERT INTO public.prescriptions VALUES (85, 85, 'Aplicar oxigenoterapia si hay dificultad respiratoria.');
INSERT INTO public.prescriptions VALUES (86, 86, 'Mantener bajo observación respiratoria.');
INSERT INTO public.prescriptions VALUES (87, 87, 'Realizar limpieza de oídos semanal.');
INSERT INTO public.prescriptions VALUES (88, 88, 'Cepillado diario recomendado.');
INSERT INTO public.prescriptions VALUES (89, 89, 'Aplicar colirio cada 6 horas.');
INSERT INTO public.prescriptions VALUES (90, 90, 'Control ocular en 5 días.');
INSERT INTO public.prescriptions VALUES (91, 91, 'Evitar exposición a polvo.');
INSERT INTO public.prescriptions VALUES (92, 92, 'Aplicar antihistamínico diario.');
INSERT INTO public.prescriptions VALUES (93, 93, 'Dar condroprotector por 30 días.');
INSERT INTO public.prescriptions VALUES (94, 94, 'Realizar ejercicios suaves de movilidad.');
INSERT INTO public.prescriptions VALUES (95, 95, 'Monitorear temperatura tras vacunación.');
INSERT INTO public.prescriptions VALUES (96, 96, 'Revisión de herida profunda en 5 días.');
INSERT INTO public.prescriptions VALUES (97, 97, 'Realizar profilaxis dental cada año.');
INSERT INTO public.prescriptions VALUES (98, 98, 'Aplicar gotas para ojos secos.');
INSERT INTO public.prescriptions VALUES (99, 99, 'Control general cada 6 meses.');
INSERT INTO public.prescriptions VALUES (100, 100, 'Revisión médica anual recomendada.');
INSERT INTO public.prescriptions VALUES (101, 1, 'Tratamiento para control de parásitos internos.');
INSERT INTO public.prescriptions VALUES (102, 2, 'Antibiótico oral por infección cutánea.');
INSERT INTO public.prescriptions VALUES (103, 3, 'Dieta blanda y protectores gástricos por gastritis.');
INSERT INTO public.prescriptions VALUES (104, 4, 'Analgésico postoperatorio y reposo de 10 días.');
INSERT INTO public.prescriptions VALUES (105, 5, 'Antiinflamatorio por dolor articular leve.');
INSERT INTO public.prescriptions VALUES (106, 6, 'Suplemento vitamínico diario por 30 días.');
INSERT INTO public.prescriptions VALUES (107, 7, 'Antibiótico de amplio espectro por infección respiratoria.');
INSERT INTO public.prescriptions VALUES (108, 8, 'Limpieza ocular y gotas antibacterianas.');
INSERT INTO public.prescriptions VALUES (109, 9, 'Tratamiento para dermatitis alérgica, incluir baño medicado.');
INSERT INTO public.prescriptions VALUES (110, 10, 'Dieta rica en fibra y ejercicio diario.');
INSERT INTO public.prescriptions VALUES (111, 11, 'Tratamiento antipulgas tópico mensual.');
INSERT INTO public.prescriptions VALUES (112, 12, 'Desparasitación interna y externa.');
INSERT INTO public.prescriptions VALUES (113, 13, 'Analgésico por dolor muscular post actividad.');
INSERT INTO public.prescriptions VALUES (114, 14, 'Limpieza dental y analgésico por inflamación gingival.');
INSERT INTO public.prescriptions VALUES (115, 15, 'Dieta baja en sodio por problemas renales.');
INSERT INTO public.prescriptions VALUES (116, 16, 'Antibiótico inyectable por absceso.');
INSERT INTO public.prescriptions VALUES (117, 17, 'Gotas óticas por otitis externa.');
INSERT INTO public.prescriptions VALUES (118, 18, 'Tratamiento por conjuntivitis bacteriana.');
INSERT INTO public.prescriptions VALUES (119, 19, 'Crema tópica para irritación de piel.');
INSERT INTO public.prescriptions VALUES (120, 20, 'Antiinflamatorio por artritis leve.');
INSERT INTO public.prescriptions VALUES (121, 21, 'Antibiótico oral por infección urinaria.');
INSERT INTO public.prescriptions VALUES (122, 22, 'Tratamiento antiparasitario cada 3 meses.');
INSERT INTO public.prescriptions VALUES (123, 23, 'Dieta hipoalergénica por alergias alimentarias.');
INSERT INTO public.prescriptions VALUES (124, 24, 'Analgésico post cirugía dental.');
INSERT INTO public.prescriptions VALUES (125, 25, 'Limpieza de heridas y aplicación de pomada antibiótica.');
INSERT INTO public.prescriptions VALUES (126, 26, 'Antiparasitario y vacuna de refuerzo.');
INSERT INTO public.prescriptions VALUES (127, 27, 'Antibiótico por infección gastrointestinal.');
INSERT INTO public.prescriptions VALUES (128, 28, 'Tratamiento de apoyo hepático con silimarina.');
INSERT INTO public.prescriptions VALUES (129, 29, 'Dieta balanceada con suplementos para pelaje.');
INSERT INTO public.prescriptions VALUES (130, 30, 'Analgésico y reposo por esguince.');
INSERT INTO public.prescriptions VALUES (131, 31, 'Tratamiento con probióticos por diarrea.');
INSERT INTO public.prescriptions VALUES (132, 32, 'Gotas oculares para irritación leve.');
INSERT INTO public.prescriptions VALUES (133, 33, 'Desparasitación interna preventiva.');
INSERT INTO public.prescriptions VALUES (134, 34, 'Control de glucosa y dieta para diabetes.');
INSERT INTO public.prescriptions VALUES (135, 35, 'Antibiótico por absceso en la pata.');
INSERT INTO public.prescriptions VALUES (136, 36, 'Cuidado posquirúrgico con antibiótico y antiinflamatorio.');
INSERT INTO public.prescriptions VALUES (137, 37, 'Tratamiento para alergia estacional.');
INSERT INTO public.prescriptions VALUES (138, 38, 'Baños medicados y ungüento por dermatitis.');
INSERT INTO public.prescriptions VALUES (139, 39, 'Antiinflamatorio leve por golpe reciente.');
INSERT INTO public.prescriptions VALUES (140, 40, 'Suplemento nutricional por pérdida de peso.');
INSERT INTO public.prescriptions VALUES (141, 41, 'Antibiótico por infección dental.');
INSERT INTO public.prescriptions VALUES (142, 42, 'Limpieza de oído y gotas antibacterianas.');
INSERT INTO public.prescriptions VALUES (143, 43, 'Tratamiento antipulgas reforzado.');
INSERT INTO public.prescriptions VALUES (144, 44, 'Desparasitación con control veterinario mensual.');
INSERT INTO public.prescriptions VALUES (145, 45, 'Antiinflamatorio y reposo de 5 días.');
INSERT INTO public.prescriptions VALUES (146, 46, 'Tratamiento por conjuntivitis viral.');
INSERT INTO public.prescriptions VALUES (147, 47, 'Antibiótico por herida superficial.');
INSERT INTO public.prescriptions VALUES (148, 48, 'Cuidado posparto con vitaminas y calcio.');
INSERT INTO public.prescriptions VALUES (149, 49, 'Control de peso con alimento bajo en calorías.');
INSERT INTO public.prescriptions VALUES (150, 50, 'Baños medicados por sarna demodécica.');
INSERT INTO public.prescriptions VALUES (151, 51, 'Antibiótico oral por fiebre leve.');
INSERT INTO public.prescriptions VALUES (152, 52, 'Cuidado poscirugía de esterilización.');
INSERT INTO public.prescriptions VALUES (153, 53, 'Limpieza dental con analgésico post procedimiento.');
INSERT INTO public.prescriptions VALUES (154, 54, 'Suplemento de hierro por anemia.');
INSERT INTO public.prescriptions VALUES (155, 55, 'Antiparasitario para giardiasis.');
INSERT INTO public.prescriptions VALUES (156, 56, 'Antibiótico por tos persistente.');
INSERT INTO public.prescriptions VALUES (157, 57, 'Pomada cicatrizante en zona de herida.');
INSERT INTO public.prescriptions VALUES (158, 58, 'Analgésico leve tras vacunación.');
INSERT INTO public.prescriptions VALUES (159, 59, 'Dieta rica en proteínas por recuperación muscular.');
INSERT INTO public.prescriptions VALUES (160, 60, 'Desparasitación completa.');
INSERT INTO public.prescriptions VALUES (161, 61, 'Antiinflamatorio por artritis avanzada.');
INSERT INTO public.prescriptions VALUES (162, 62, 'Antibiótico tópico por irritación ocular.');
INSERT INTO public.prescriptions VALUES (163, 63, 'Baño medicado con clorhexidina.');
INSERT INTO public.prescriptions VALUES (164, 64, 'Dieta especial para control renal.');
INSERT INTO public.prescriptions VALUES (165, 65, 'Analgésico post extracción dental.');
INSERT INTO public.prescriptions VALUES (166, 66, 'Antiparasitario para control de tenias.');
INSERT INTO public.prescriptions VALUES (167, 67, 'Tratamiento antihistamínico por alergia.');
INSERT INTO public.prescriptions VALUES (168, 68, 'Antibiótico oral por otitis.');
INSERT INTO public.prescriptions VALUES (169, 69, 'Gotas oftálmicas por sequedad ocular.');
INSERT INTO public.prescriptions VALUES (170, 70, 'Dieta hipocalórica para control de peso.');
INSERT INTO public.prescriptions VALUES (171, 71, 'Suplemento de omega 3 para piel y pelo.');
INSERT INTO public.prescriptions VALUES (172, 72, 'Antiparasitario externo mensual.');
INSERT INTO public.prescriptions VALUES (173, 73, 'Antibiótico y antiinflamatorio por herida profunda.');
INSERT INTO public.prescriptions VALUES (174, 74, 'Limpieza y curación de herida con yodo.');
INSERT INTO public.prescriptions VALUES (175, 75, 'Control de vacunas al día.');
INSERT INTO public.prescriptions VALUES (176, 76, 'Dieta rica en fibra por estreñimiento.');
INSERT INTO public.prescriptions VALUES (177, 77, 'Tratamiento preventivo por tos de las perreras.');
INSERT INTO public.prescriptions VALUES (178, 78, 'Antibiótico y reposo tras cirugía menor.');
INSERT INTO public.prescriptions VALUES (179, 79, 'Suplemento de calcio por fractura.');
INSERT INTO public.prescriptions VALUES (180, 80, 'Cuidado dental preventivo.');
INSERT INTO public.prescriptions VALUES (181, 81, 'Analgésico y fisioterapia por artritis.');
INSERT INTO public.prescriptions VALUES (182, 82, 'Tratamiento dermatológico tópico.');
INSERT INTO public.prescriptions VALUES (183, 83, 'Baño medicado semanal por hongos.');
INSERT INTO public.prescriptions VALUES (184, 84, 'Antibiótico oral por infección respiratoria.');
INSERT INTO public.prescriptions VALUES (185, 85, 'Pomada ocular antibacteriana.');
INSERT INTO public.prescriptions VALUES (186, 86, 'Dieta blanda post cirugía abdominal.');
INSERT INTO public.prescriptions VALUES (187, 87, 'Analgésico por dolor muscular.');
INSERT INTO public.prescriptions VALUES (188, 88, 'Limpieza de heridas con solución salina.');
INSERT INTO public.prescriptions VALUES (189, 89, 'Suplemento vitamínico y control anual.');
INSERT INTO public.prescriptions VALUES (190, 90, 'Tratamiento para alergia cutánea.');
INSERT INTO public.prescriptions VALUES (191, 91, 'Antibiótico tópico en zona de sutura.');
INSERT INTO public.prescriptions VALUES (192, 92, 'Dieta especial por enfermedad hepática.');
INSERT INTO public.prescriptions VALUES (193, 93, 'Desparasitación general.');
INSERT INTO public.prescriptions VALUES (194, 94, 'Antibiótico y pomada por herida en oreja.');
INSERT INTO public.prescriptions VALUES (195, 95, 'Cuidado dental y limpieza profunda.');
INSERT INTO public.prescriptions VALUES (196, 96, 'Antiinflamatorio por golpe.');
INSERT INTO public.prescriptions VALUES (197, 97, 'Tratamiento por diarrea leve.');
INSERT INTO public.prescriptions VALUES (198, 98, 'Antibiótico oral tras cirugía.');
INSERT INTO public.prescriptions VALUES (199, 99, 'Control antipulgas mensual.');
INSERT INTO public.prescriptions VALUES (200, 100, 'Suplemento energético y control veterinario.');


--
-- TOC entry 3659 (class 0 OID 131193)
-- Dependencies: 254
-- Data for Name: prescriptions_audit; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3633 (class 0 OID 106560)
-- Dependencies: 228
-- Data for Name: procedures; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.procedures VALUES (1, 1, 'Consulta general', 'Revisión física completa del paciente.', 35000.00);
INSERT INTO public.procedures VALUES (2, 2, 'Vacunación anual', 'Aplicación de vacunas según calendario.', 45000.00);
INSERT INTO public.procedures VALUES (3, 3, 'Desparasitación interna', 'Administración de antiparasitario oral.', 30000.00);
INSERT INTO public.procedures VALUES (4, 4, 'Desparasitación externa', 'Aplicación tópica contra pulgas y garrapatas.', 32000.00);
INSERT INTO public.procedures VALUES (5, 5, 'Corte de uñas', 'Recorte y limpieza de uñas en extremidades.', 20000.00);
INSERT INTO public.procedures VALUES (6, 6, 'Baño medicado', 'Baño con shampoo terapéutico para piel sensible.', 28000.00);
INSERT INTO public.procedures VALUES (7, 7, 'Limpieza dental', 'Profilaxis dental con ultrasonido.', 60000.00);
INSERT INTO public.procedures VALUES (8, 8, 'Esterilización hembra', 'Cirugía para control reproductivo.', 180000.00);
INSERT INTO public.procedures VALUES (9, 9, 'Castración macho', 'Cirugía de esterilización para machos.', 150000.00);
INSERT INTO public.procedures VALUES (10, 10, 'Ecografía abdominal', 'Evaluación ecográfica de órganos internos.', 80000.00);
INSERT INTO public.procedures VALUES (11, 11, 'Radiografía simple', 'Toma de imagen de diagnóstico óseo.', 70000.00);
INSERT INTO public.procedures VALUES (12, 12, 'Radiografía de tórax', 'Evaluación pulmonar y cardíaca.', 75000.00);
INSERT INTO public.procedures VALUES (13, 13, 'Curación de herida', 'Limpieza, desinfección y vendaje.', 40000.00);
INSERT INTO public.procedures VALUES (14, 14, 'Suturas menores', 'Cierre de heridas superficiales.', 50000.00);
INSERT INTO public.procedures VALUES (15, 15, 'Hospitalización corta', 'Observación por menos de 24 horas.', 90000.00);
INSERT INTO public.procedures VALUES (16, 16, 'Hospitalización prolongada', 'Cuidado hospitalario de más de 24 horas.', 180000.00);
INSERT INTO public.procedures VALUES (17, 17, 'Aplicación de suero', 'Hidratación intravenosa.', 60000.00);
INSERT INTO public.procedures VALUES (18, 18, 'Toma de muestra sanguínea', 'Extracción de sangre para análisis.', 30000.00);
INSERT INTO public.procedures VALUES (19, 19, 'Toma de muestra urinaria', 'Recolección de orina para diagnóstico.', 25000.00);
INSERT INTO public.procedures VALUES (20, 20, 'Toma de muestra fecal', 'Examen coprológico para parásitos.', 20000.00);
INSERT INTO public.procedures VALUES (21, 21, 'Cirugía menor', 'Procedimiento ambulatorio sin hospitalización.', 120000.00);
INSERT INTO public.procedures VALUES (22, 22, 'Cirugía mayor', 'Procedimiento quirúrgico con anestesia general.', 250000.00);
INSERT INTO public.procedures VALUES (23, 23, 'Anestesia general', 'Inducción anestésica para cirugía.', 70000.00);
INSERT INTO public.procedures VALUES (24, 24, 'Anestesia local', 'Bloqueo anestésico localizado.', 40000.00);
INSERT INTO public.procedures VALUES (25, 25, 'Terapia de fluidos', 'Administración de líquidos intravenosos.', 55000.00);
INSERT INTO public.procedures VALUES (26, 26, 'Limpieza ótica', 'Limpieza profunda de conductos auditivos.', 30000.00);
INSERT INTO public.procedures VALUES (27, 27, 'Limpieza ocular', 'Retiro de secreciones y aplicación de colirio.', 25000.00);
INSERT INTO public.procedures VALUES (28, 28, 'Control postoperatorio', 'Revisión de herida quirúrgica y retiro de puntos.', 35000.00);
INSERT INTO public.procedures VALUES (29, 29, 'Vacunación antirrábica', 'Aplicación de vacuna antirrábica anual.', 40000.00);
INSERT INTO public.procedures VALUES (30, 30, 'Vacuna múltiple', 'Aplicación de vacuna polivalente.', 50000.00);
INSERT INTO public.procedures VALUES (31, 31, 'Vacuna triple felina', 'Vacuna combinada contra enfermedades comunes.', 48000.00);
INSERT INTO public.procedures VALUES (32, 32, 'Desparasitación mixta', 'Tratamiento combinado interno y externo.', 35000.00);
INSERT INTO public.procedures VALUES (33, 33, 'Control de peso', 'Evaluación nutricional y control de dieta.', 20000.00);
INSERT INTO public.procedures VALUES (34, 34, 'Análisis de sangre', 'Exámenes hematológicos básicos.', 70000.00);
INSERT INTO public.procedures VALUES (35, 35, 'Análisis bioquímico', 'Examen de funciones hepáticas y renales.', 75000.00);
INSERT INTO public.procedures VALUES (36, 36, 'Test de parvovirus', 'Prueba rápida de diagnóstico de parvovirus.', 50000.00);
INSERT INTO public.procedures VALUES (37, 37, 'Test de moquillo', 'Diagnóstico rápido de distemper.', 48000.00);
INSERT INTO public.procedures VALUES (38, 38, 'Análisis de orina', 'Evaluación de infecciones o cristales.', 40000.00);
INSERT INTO public.procedures VALUES (39, 39, 'Análisis coprológico', 'Detección de parásitos intestinales.', 30000.00);
INSERT INTO public.procedures VALUES (40, 40, 'Evaluación cardiaca', 'Revisión con auscultación y ECG.', 90000.00);
INSERT INTO public.procedures VALUES (41, 41, 'Electrocardiograma', 'Medición de la actividad eléctrica del corazón.', 95000.00);
INSERT INTO public.procedures VALUES (42, 42, 'Chequeo geriátrico', 'Revisión general para mascotas mayores.', 85000.00);
INSERT INTO public.procedures VALUES (43, 43, 'Terapia con antibióticos', 'Tratamiento inyectable por infección.', 40000.00);
INSERT INTO public.procedures VALUES (44, 44, 'Terapia antiinflamatoria', 'Aplicación de antiinflamatorios inyectables.', 35000.00);
INSERT INTO public.procedures VALUES (45, 45, 'Terapia antiparasitaria', 'Administración de antiparasitarios específicos.', 30000.00);
INSERT INTO public.procedures VALUES (46, 46, 'Tratamiento dermatológico', 'Atención de afecciones cutáneas.', 60000.00);
INSERT INTO public.procedures VALUES (47, 47, 'Tratamiento oftálmico', 'Colirios o pomadas para enfermedades oculares.', 55000.00);
INSERT INTO public.procedures VALUES (48, 48, 'Tratamiento otológico', 'Limpieza y medicación para otitis.', 50000.00);
INSERT INTO public.procedures VALUES (49, 49, 'Terapia del dolor', 'Aplicación de analgésicos o AINEs.', 45000.00);
INSERT INTO public.procedures VALUES (50, 50, 'Revisión prequirúrgica', 'Evaluación antes de procedimientos quirúrgicos.', 50000.00);
INSERT INTO public.procedures VALUES (51, 51, 'Curación de quemaduras', 'Tratamiento de lesiones térmicas o químicas.', 65000.00);
INSERT INTO public.procedures VALUES (52, 52, 'Terapia con sueros vitamínicos', 'Aplicación de complejos vitamínicos.', 70000.00);
INSERT INTO public.procedures VALUES (53, 53, 'Terapia nutricional', 'Soporte alimentario por vía oral o IV.', 80000.00);
INSERT INTO public.procedures VALUES (54, 54, 'Control de vacunación', 'Actualización del esquema de vacunas.', 25000.00);
INSERT INTO public.procedures VALUES (55, 55, 'Retiro de puntos', 'Extracción de suturas quirúrgicas.', 20000.00);
INSERT INTO public.procedures VALUES (56, 56, 'Terapia con láser', 'Tratamiento fisioterapéutico para dolor crónico.', 95000.00);
INSERT INTO public.procedures VALUES (57, 57, 'Fisioterapia postquirúrgica', 'Recuperación motora tras cirugía.', 100000.00);
INSERT INTO public.procedures VALUES (58, 58, 'Tratamiento de fracturas', 'Reducción y estabilización ósea.', 220000.00);
INSERT INTO public.procedures VALUES (59, 59, 'Colocación de vendaje', 'Inmovilización temporal por lesión.', 35000.00);
INSERT INTO public.procedures VALUES (60, 60, 'Cambio de vendaje', 'Revisión y sustitución de vendajes.', 20000.00);
INSERT INTO public.procedures VALUES (61, 61, 'Control reproductivo', 'Valoración hormonal o de celo.', 40000.00);
INSERT INTO public.procedures VALUES (62, 62, 'Inseminación artificial', 'Procedimiento reproductivo asistido.', 180000.00);
INSERT INTO public.procedures VALUES (63, 63, 'Diagnóstico de gestación', 'Confirmación ecográfica de embarazo.', 75000.00);
INSERT INTO public.procedures VALUES (64, 64, 'Atención de parto', 'Asistencia durante el alumbramiento.', 200000.00);
INSERT INTO public.procedures VALUES (65, 65, 'Cesárea', 'Procedimiento quirúrgico para parto asistido.', 300000.00);
INSERT INTO public.procedures VALUES (66, 66, 'Control pediátrico', 'Revisión de cachorros o gatitos.', 45000.00);
INSERT INTO public.procedures VALUES (67, 67, 'Evaluación dental', 'Inspección y diagnóstico oral.', 30000.00);
INSERT INTO public.procedures VALUES (68, 68, 'Toma de radiografía dental', 'Imagen diagnóstica odontológica.', 60000.00);
INSERT INTO public.procedures VALUES (69, 69, 'Terapia antibiótica', 'Administración controlada de antibióticos.', 40000.00);
INSERT INTO public.procedures VALUES (70, 70, 'Tratamiento de diarrea', 'Terapia oral y rehidratación.', 50000.00);
INSERT INTO public.procedures VALUES (71, 71, 'Tratamiento de vómito', 'Aplicación de antieméticos y dieta.', 45000.00);
INSERT INTO public.procedures VALUES (72, 72, 'Evaluación neurológica', 'Pruebas de reflejos y respuesta motora.', 85000.00);
INSERT INTO public.procedures VALUES (73, 73, 'Tratamiento para epilepsia', 'Administración de anticonvulsivos.', 70000.00);
INSERT INTO public.procedures VALUES (74, 74, 'Evaluación endocrina', 'Pruebas hormonales básicas.', 80000.00);
INSERT INTO public.procedures VALUES (75, 75, 'Tratamiento hormonal', 'Aplicación o ajuste de dosis hormonales.', 65000.00);
INSERT INTO public.procedures VALUES (76, 76, 'Terapia de insulina', 'Control de glucemia en animales diabéticos.', 90000.00);
INSERT INTO public.procedures VALUES (77, 77, 'Curación de absceso', 'Drenaje y limpieza de absceso cutáneo.', 60000.00);
INSERT INTO public.procedures VALUES (78, 78, 'Tratamiento para otitis', 'Limpieza profunda y medicación.', 50000.00);
INSERT INTO public.procedures VALUES (79, 79, 'Lavado gástrico', 'Procedimiento de desintoxicación.', 95000.00);
INSERT INTO public.procedures VALUES (80, 80, 'Desintoxicación por fármacos', 'Tratamiento por intoxicación accidental.', 100000.00);
INSERT INTO public.procedures VALUES (81, 81, 'Control parasitológico', 'Revisión y profilaxis contra parásitos.', 35000.00);
INSERT INTO public.procedures VALUES (82, 82, 'Control nutricional', 'Seguimiento de dieta especializada.', 30000.00);
INSERT INTO public.procedures VALUES (83, 83, 'Terapia inmunológica', 'Fortalecimiento del sistema inmune.', 85000.00);
INSERT INTO public.procedures VALUES (84, 84, 'Terapia respiratoria', 'Tratamiento de infecciones respiratorias.', 80000.00);
INSERT INTO public.procedures VALUES (85, 85, 'Aspiración traqueal', 'Extracción de secreciones respiratorias.', 90000.00);
INSERT INTO public.procedures VALUES (86, 86, 'Oxigenoterapia', 'Administración de oxígeno controlado.', 95000.00);
INSERT INTO public.procedures VALUES (87, 87, 'Limpieza profunda', 'Baño con corte sanitario y limpieza general.', 50000.00);
INSERT INTO public.procedures VALUES (88, 88, 'Corte higiénico', 'Aseo de zonas sensibles y recorte.', 35000.00);
INSERT INTO public.procedures VALUES (89, 89, 'Cepillado dental', 'Remoción de placa bacteriana.', 25000.00);
INSERT INTO public.procedures VALUES (90, 90, 'Aplicación de colirio', 'Tratamiento ocular diario.', 20000.00);
INSERT INTO public.procedures VALUES (91, 91, 'Evaluación dermatológica', 'Diagnóstico de problemas de piel.', 60000.00);
INSERT INTO public.procedures VALUES (92, 92, 'Tratamiento antipruriginoso', 'Terapia para picazón y alergias.', 55000.00);
INSERT INTO public.procedures VALUES (93, 93, 'Control de artritis', 'Aplicación de antiinflamatorios articulares.', 75000.00);
INSERT INTO public.procedures VALUES (94, 94, 'Terapia rehabilitadora', 'Ejercicios asistidos para movilidad.', 85000.00);
INSERT INTO public.procedures VALUES (95, 95, 'Control postvacunal', 'Revisión tras vacunación.', 25000.00);
INSERT INTO public.procedures VALUES (96, 96, 'Tratamiento de heridas profundas', 'Suturas y limpieza profunda.', 90000.00);
INSERT INTO public.procedures VALUES (97, 97, 'Limpieza dental avanzada', 'Profilaxis completa con anestesia.', 130000.00);
INSERT INTO public.procedures VALUES (98, 98, 'Control oftalmológico', 'Evaluación visual y medicación.', 70000.00);
INSERT INTO public.procedures VALUES (99, 99, 'Examen preadopción', 'Evaluación general de mascota para adopción.', 40000.00);
INSERT INTO public.procedures VALUES (100, 100, 'Chequeo general anual', 'Revisión completa con control de laboratorio.', 95000.00);


--
-- TOC entry 3637 (class 0 OID 106583)
-- Dependencies: 232
-- Data for Name: vaccine_applications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.vaccine_applications VALUES (1, 1, 1, '2024-01-10');
INSERT INTO public.vaccine_applications VALUES (2, 2, 2, '2024-01-12');
INSERT INTO public.vaccine_applications VALUES (3, 3, 3, '2024-01-15');
INSERT INTO public.vaccine_applications VALUES (4, 4, 4, '2024-01-18');
INSERT INTO public.vaccine_applications VALUES (5, 5, 5, '2024-01-22');
INSERT INTO public.vaccine_applications VALUES (6, 6, 6, '2024-01-25');
INSERT INTO public.vaccine_applications VALUES (7, 7, 7, '2024-01-28');
INSERT INTO public.vaccine_applications VALUES (8, 8, 8, '2024-02-01');
INSERT INTO public.vaccine_applications VALUES (9, 9, 9, '2024-02-04');
INSERT INTO public.vaccine_applications VALUES (10, 10, 10, '2024-02-06');
INSERT INTO public.vaccine_applications VALUES (11, 11, 11, '2024-02-10');
INSERT INTO public.vaccine_applications VALUES (12, 12, 12, '2024-02-13');
INSERT INTO public.vaccine_applications VALUES (13, 13, 13, '2024-02-15');
INSERT INTO public.vaccine_applications VALUES (14, 14, 14, '2024-02-18');
INSERT INTO public.vaccine_applications VALUES (15, 15, 15, '2024-02-20');
INSERT INTO public.vaccine_applications VALUES (16, 16, 16, '2024-02-23');
INSERT INTO public.vaccine_applications VALUES (17, 17, 17, '2024-02-26');
INSERT INTO public.vaccine_applications VALUES (18, 18, 18, '2024-03-01');
INSERT INTO public.vaccine_applications VALUES (19, 19, 19, '2024-03-04');
INSERT INTO public.vaccine_applications VALUES (20, 20, 20, '2024-03-06');
INSERT INTO public.vaccine_applications VALUES (21, 21, 21, '2024-03-10');
INSERT INTO public.vaccine_applications VALUES (22, 22, 22, '2024-03-13');
INSERT INTO public.vaccine_applications VALUES (23, 23, 23, '2024-03-15');
INSERT INTO public.vaccine_applications VALUES (24, 24, 24, '2024-03-18');
INSERT INTO public.vaccine_applications VALUES (25, 25, 25, '2024-03-22');
INSERT INTO public.vaccine_applications VALUES (26, 26, 26, '2024-03-25');
INSERT INTO public.vaccine_applications VALUES (27, 27, 27, '2024-03-27');
INSERT INTO public.vaccine_applications VALUES (28, 28, 28, '2024-03-30');
INSERT INTO public.vaccine_applications VALUES (29, 29, 29, '2024-04-02');
INSERT INTO public.vaccine_applications VALUES (30, 30, 30, '2024-04-05');
INSERT INTO public.vaccine_applications VALUES (31, 31, 31, '2024-04-07');
INSERT INTO public.vaccine_applications VALUES (32, 32, 32, '2024-04-10');
INSERT INTO public.vaccine_applications VALUES (33, 33, 33, '2024-04-12');
INSERT INTO public.vaccine_applications VALUES (34, 34, 34, '2024-04-15');
INSERT INTO public.vaccine_applications VALUES (35, 35, 35, '2024-04-18');
INSERT INTO public.vaccine_applications VALUES (36, 36, 36, '2024-04-20');
INSERT INTO public.vaccine_applications VALUES (37, 37, 37, '2024-04-23');
INSERT INTO public.vaccine_applications VALUES (38, 38, 38, '2024-04-26');
INSERT INTO public.vaccine_applications VALUES (39, 39, 39, '2024-04-29');
INSERT INTO public.vaccine_applications VALUES (40, 40, 40, '2024-05-01');
INSERT INTO public.vaccine_applications VALUES (41, 41, 41, '2024-05-04');
INSERT INTO public.vaccine_applications VALUES (42, 42, 42, '2024-05-07');
INSERT INTO public.vaccine_applications VALUES (43, 43, 43, '2024-05-10');
INSERT INTO public.vaccine_applications VALUES (44, 44, 44, '2024-05-13');
INSERT INTO public.vaccine_applications VALUES (45, 45, 45, '2024-05-16');
INSERT INTO public.vaccine_applications VALUES (46, 46, 46, '2024-05-19');
INSERT INTO public.vaccine_applications VALUES (47, 47, 47, '2024-05-22');
INSERT INTO public.vaccine_applications VALUES (48, 48, 48, '2024-05-25');
INSERT INTO public.vaccine_applications VALUES (49, 49, 49, '2024-05-28');
INSERT INTO public.vaccine_applications VALUES (50, 50, 50, '2024-06-01');
INSERT INTO public.vaccine_applications VALUES (51, 51, 51, '2024-06-04');
INSERT INTO public.vaccine_applications VALUES (52, 52, 52, '2024-06-07');
INSERT INTO public.vaccine_applications VALUES (53, 53, 53, '2024-06-10');
INSERT INTO public.vaccine_applications VALUES (54, 54, 54, '2024-06-13');
INSERT INTO public.vaccine_applications VALUES (55, 55, 55, '2024-06-16');
INSERT INTO public.vaccine_applications VALUES (56, 56, 56, '2024-06-19');
INSERT INTO public.vaccine_applications VALUES (57, 57, 57, '2024-06-22');
INSERT INTO public.vaccine_applications VALUES (58, 58, 58, '2024-06-25');
INSERT INTO public.vaccine_applications VALUES (59, 59, 59, '2024-06-28');
INSERT INTO public.vaccine_applications VALUES (60, 60, 60, '2024-07-01');
INSERT INTO public.vaccine_applications VALUES (61, 61, 61, '2024-07-04');
INSERT INTO public.vaccine_applications VALUES (62, 62, 62, '2024-07-07');
INSERT INTO public.vaccine_applications VALUES (63, 63, 63, '2024-07-10');
INSERT INTO public.vaccine_applications VALUES (64, 64, 64, '2024-07-13');
INSERT INTO public.vaccine_applications VALUES (65, 65, 65, '2024-07-16');
INSERT INTO public.vaccine_applications VALUES (66, 66, 66, '2024-07-19');
INSERT INTO public.vaccine_applications VALUES (67, 67, 67, '2024-07-22');
INSERT INTO public.vaccine_applications VALUES (68, 68, 68, '2024-07-25');
INSERT INTO public.vaccine_applications VALUES (69, 69, 69, '2024-07-28');
INSERT INTO public.vaccine_applications VALUES (70, 70, 70, '2024-08-01');
INSERT INTO public.vaccine_applications VALUES (71, 71, 71, '2024-08-04');
INSERT INTO public.vaccine_applications VALUES (72, 72, 72, '2024-08-07');
INSERT INTO public.vaccine_applications VALUES (73, 73, 73, '2024-08-10');
INSERT INTO public.vaccine_applications VALUES (74, 74, 74, '2024-08-13');
INSERT INTO public.vaccine_applications VALUES (75, 75, 75, '2024-08-16');
INSERT INTO public.vaccine_applications VALUES (76, 76, 76, '2024-08-19');
INSERT INTO public.vaccine_applications VALUES (77, 77, 77, '2024-08-22');
INSERT INTO public.vaccine_applications VALUES (78, 78, 78, '2024-08-25');
INSERT INTO public.vaccine_applications VALUES (79, 79, 79, '2024-08-28');
INSERT INTO public.vaccine_applications VALUES (80, 80, 80, '2024-09-01');
INSERT INTO public.vaccine_applications VALUES (81, 81, 81, '2024-09-04');
INSERT INTO public.vaccine_applications VALUES (82, 82, 82, '2024-09-07');
INSERT INTO public.vaccine_applications VALUES (83, 83, 83, '2024-09-10');
INSERT INTO public.vaccine_applications VALUES (84, 84, 84, '2024-09-13');
INSERT INTO public.vaccine_applications VALUES (85, 85, 85, '2024-09-16');
INSERT INTO public.vaccine_applications VALUES (86, 86, 86, '2024-09-19');
INSERT INTO public.vaccine_applications VALUES (87, 87, 87, '2024-09-22');
INSERT INTO public.vaccine_applications VALUES (88, 88, 88, '2024-09-25');
INSERT INTO public.vaccine_applications VALUES (89, 89, 89, '2024-09-28');
INSERT INTO public.vaccine_applications VALUES (90, 90, 90, '2024-10-01');
INSERT INTO public.vaccine_applications VALUES (91, 91, 91, '2024-10-04');
INSERT INTO public.vaccine_applications VALUES (92, 92, 92, '2024-10-07');
INSERT INTO public.vaccine_applications VALUES (93, 93, 93, '2024-10-10');
INSERT INTO public.vaccine_applications VALUES (94, 94, 94, '2024-10-13');
INSERT INTO public.vaccine_applications VALUES (95, 95, 95, '2024-10-16');
INSERT INTO public.vaccine_applications VALUES (96, 96, 96, '2024-10-19');
INSERT INTO public.vaccine_applications VALUES (97, 97, 97, '2024-10-22');
INSERT INTO public.vaccine_applications VALUES (98, 98, 98, '2024-10-25');
INSERT INTO public.vaccine_applications VALUES (99, 99, 99, '2024-10-28');
INSERT INTO public.vaccine_applications VALUES (100, 100, 100, '2024-10-31');


--
-- TOC entry 3635 (class 0 OID 106574)
-- Dependencies: 230
-- Data for Name: vaccines; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.vaccines VALUES (1, 'Vacuna antirrábica', 'Prevención de la rabia en perros y gatos.');
INSERT INTO public.vaccines VALUES (2, 'Vacuna múltiple canina', 'Protege contra parvovirus, moquillo, hepatitis y leptospirosis.');
INSERT INTO public.vaccines VALUES (3, 'Vacuna múltiple felina', 'Protege contra panleucopenia, calicivirus y rinotraqueítis.');
INSERT INTO public.vaccines VALUES (4, 'Vacuna contra parvovirus', 'Prevención de parvovirus canino.');
INSERT INTO public.vaccines VALUES (5, 'Vacuna contra moquillo', 'Prevención de moquillo canino.');
INSERT INTO public.vaccines VALUES (6, 'Vacuna contra hepatitis', 'Prevención de hepatitis canina.');
INSERT INTO public.vaccines VALUES (7, 'Vacuna contra leptospirosis', 'Prevención de leptospirosis en perros.');
INSERT INTO public.vaccines VALUES (8, 'Vacuna contra rinotraqueítis', 'Prevención de rinotraqueítis felina.');
INSERT INTO public.vaccines VALUES (9, 'Vacuna contra calicivirus', 'Prevención de calicivirus felino.');
INSERT INTO public.vaccines VALUES (10, 'Vacuna contra leucemia felina', 'Prevención de leucemia en gatos.');
INSERT INTO public.vaccines VALUES (11, 'Vacuna contra tos de las perreras', 'Prevención de traqueobronquitis infecciosa canina.');
INSERT INTO public.vaccines VALUES (12, 'Vacuna contra giardiasis', 'Prevención de giardiasis en perros y gatos.');
INSERT INTO public.vaccines VALUES (13, 'Vacuna contra coronavirus canino', 'Prevención de coronavirus intestinal canino.');
INSERT INTO public.vaccines VALUES (14, 'Vacuna contra enfermedad de Lyme', 'Prevención de enfermedad de Lyme transmitida por garrapatas.');
INSERT INTO public.vaccines VALUES (15, 'Vacuna contra tos felina', 'Prevención de traqueobronquitis felina.');
INSERT INTO public.vaccines VALUES (16, 'Vacuna contra leptospirosis tipo 2', 'Prevención específica contra leptospirosis serovariedad 2.');
INSERT INTO public.vaccines VALUES (17, 'Vacuna contra rabia felina', 'Prevención de la rabia en gatos.');
INSERT INTO public.vaccines VALUES (18, 'Vacuna contra clostridiosis', 'Prevención de clostridiosis en animales de granja y mascotas.');
INSERT INTO public.vaccines VALUES (19, 'Vacuna contra parainfluenza', 'Prevención de parainfluenza canina.');
INSERT INTO public.vaccines VALUES (20, 'Vacuna contra coronavirus felino', 'Prevención de coronavirus intestinal en gatos.');
INSERT INTO public.vaccines VALUES (21, 'Vacuna antitetánica', 'Prevención de tétanos en animales susceptibles.');
INSERT INTO public.vaccines VALUES (22, 'Vacuna contra fiebre aftosa', 'Prevención de fiebre aftosa en animales de granja.');
INSERT INTO public.vaccines VALUES (23, 'Vacuna contra brucelosis', 'Prevención de brucelosis en animales.');
INSERT INTO public.vaccines VALUES (24, 'Vacuna contra moquillo felino', 'Prevención de moquillo felino.');
INSERT INTO public.vaccines VALUES (25, 'Vacuna contra panleucopenia', 'Prevención de panleucopenia felina.');
INSERT INTO public.vaccines VALUES (26, 'Vacuna contra ehrlichiosis', 'Prevención de ehrlichiosis transmitida por garrapatas.');
INSERT INTO public.vaccines VALUES (27, 'Vacuna contra toxoplasmosis', 'Prevención de toxoplasmosis felina.');
INSERT INTO public.vaccines VALUES (28, 'Vacuna contra distemper felino', 'Prevención de distemper en gatos.');
INSERT INTO public.vaccines VALUES (29, 'Vacuna contra adenovirus', 'Prevención de adenovirus canino.');
INSERT INTO public.vaccines VALUES (30, 'Vacuna contra parvovirus felino', 'Prevención de parvovirus en gatos.');
INSERT INTO public.vaccines VALUES (31, 'Vacuna contra influenza canina', 'Prevención de influenza canina.');
INSERT INTO public.vaccines VALUES (32, 'Vacuna contra coronavirus bovino', 'Prevención de coronavirus en bovinos.');
INSERT INTO public.vaccines VALUES (33, 'Vacuna contra rabia bovina', 'Prevención de rabia en bovinos.');
INSERT INTO public.vaccines VALUES (34, 'Vacuna contra paratuberculosis', 'Prevención de enfermedad de Johne.');
INSERT INTO public.vaccines VALUES (35, 'Vacuna contra leptospirosis bovina', 'Prevención de leptospirosis en bovinos.');
INSERT INTO public.vaccines VALUES (36, 'Vacuna contra fiebre aftosa tipo O', 'Prevención de fiebre aftosa serotipo O.');
INSERT INTO public.vaccines VALUES (37, 'Vacuna contra fiebre aftosa tipo A', 'Prevención de fiebre aftosa serotipo A.');
INSERT INTO public.vaccines VALUES (38, 'Vacuna contra leucemia bovina', 'Prevención de leucemia en bovinos.');
INSERT INTO public.vaccines VALUES (39, 'Vacuna contra parainfluenza bovina', 'Prevención de parainfluenza en bovinos.');
INSERT INTO public.vaccines VALUES (40, 'Vacuna contra brucelosis bovina', 'Prevención de brucelosis en bovinos.');
INSERT INTO public.vaccines VALUES (41, 'Vacuna contra rabia ovina', 'Prevención de rabia en ovejas.');
INSERT INTO public.vaccines VALUES (42, 'Vacuna contra clostridiosis ovina', 'Prevención de clostridiosis en ovejas.');
INSERT INTO public.vaccines VALUES (43, 'Vacuna contra fiebre aftosa ovina', 'Prevención de fiebre aftosa en ovejas.');
INSERT INTO public.vaccines VALUES (44, 'Vacuna contra influenza felina', 'Prevención de influenza en gatos.');
INSERT INTO public.vaccines VALUES (45, 'Vacuna antirrábica canina', 'Prevención de rabia en perros.');
INSERT INTO public.vaccines VALUES (46, 'Vacuna múltiple canina avanzada', 'Protege contra moquillo, parvovirus, hepatitis, leptospirosis y tos de las perreras.');
INSERT INTO public.vaccines VALUES (47, 'Vacuna múltiple felina avanzada', 'Protege contra panleucopenia, rinotraqueítis, calicivirus y leucemia.');
INSERT INTO public.vaccines VALUES (48, 'Vacuna de refuerzo rabia', 'Aplicar como refuerzo anual.');
INSERT INTO public.vaccines VALUES (49, 'Vacuna de refuerzo múltiple', 'Aplicar como refuerzo anual según protocolo.');
INSERT INTO public.vaccines VALUES (50, 'Vacuna contra micoplasma', 'Prevención de infecciones respiratorias por micoplasma.');
INSERT INTO public.vaccines VALUES (51, 'Vacuna contra bordetella', 'Prevención de bordetella en perros.');
INSERT INTO public.vaccines VALUES (52, 'Vacuna contra parvovirus tipo 2', 'Prevención de parvovirus tipo 2 en perros.');
INSERT INTO public.vaccines VALUES (53, 'Vacuna contra adenovirus tipo 2', 'Prevención de adenovirus tipo 2 en perros.');
INSERT INTO public.vaccines VALUES (54, 'Vacuna contra toxoplasmosis bovina', 'Prevención de toxoplasmosis en bovinos.');
INSERT INTO public.vaccines VALUES (55, 'Vacuna contra brucelosis canina', 'Prevención de brucelosis en perros.');
INSERT INTO public.vaccines VALUES (56, 'Vacuna contra fiebre aftosa tipo C', 'Prevención de fiebre aftosa serotipo C.');
INSERT INTO public.vaccines VALUES (57, 'Vacuna contra moquillo tipo 2', 'Prevención de moquillo tipo 2 en perros.');
INSERT INTO public.vaccines VALUES (58, 'Vacuna antirrábica felina avanzada', 'Prevención de rabia en gatos con mayor duración.');
INSERT INTO public.vaccines VALUES (59, 'Vacuna antirrábica canina avanzada', 'Prevención de rabia en perros con mayor duración.');
INSERT INTO public.vaccines VALUES (60, 'Vacuna múltiple felina refuerzo', 'Refuerzo anual de vacuna múltiple felina.');
INSERT INTO public.vaccines VALUES (61, 'Vacuna múltiple canina refuerzo', 'Refuerzo anual de vacuna múltiple canina.');
INSERT INTO public.vaccines VALUES (62, 'Vacuna contra panleucopenia refuerzo', 'Refuerzo anual de panleucopenia.');
INSERT INTO public.vaccines VALUES (63, 'Vacuna contra parvovirus refuerzo', 'Refuerzo anual de parvovirus canino.');
INSERT INTO public.vaccines VALUES (64, 'Vacuna contra moquillo refuerzo', 'Refuerzo anual de moquillo canino.');
INSERT INTO public.vaccines VALUES (65, 'Vacuna contra leucemia felina refuerzo', 'Refuerzo anual de leucemia felina.');
INSERT INTO public.vaccines VALUES (66, 'Vacuna contra rinotraqueítis refuerzo', 'Refuerzo anual de rinotraqueítis felina.');
INSERT INTO public.vaccines VALUES (67, 'Vacuna contra calicivirus refuerzo', 'Refuerzo anual de calicivirus felino.');
INSERT INTO public.vaccines VALUES (68, 'Vacuna contra tos de las perreras refuerzo', 'Refuerzo anual de tos de las perreras.');
INSERT INTO public.vaccines VALUES (69, 'Vacuna contra leptospirosis refuerzo', 'Refuerzo anual de leptospirosis en perros.');
INSERT INTO public.vaccines VALUES (70, 'Vacuna contra influenza refuerzo', 'Refuerzo anual de influenza canina.');
INSERT INTO public.vaccines VALUES (71, 'Vacuna antirrábica refuerzo', 'Refuerzo anual de vacuna antirrábica.');
INSERT INTO public.vaccines VALUES (72, 'Vacuna múltiple avanzada refuerzo', 'Refuerzo anual de vacunas múltiples avanzadas.');
INSERT INTO public.vaccines VALUES (73, 'Vacuna contra giardiasis refuerzo', 'Refuerzo anual de prevención de giardiasis.');
INSERT INTO public.vaccines VALUES (74, 'Vacuna contra coronavirus refuerzo', 'Refuerzo anual de coronavirus intestinal.');
INSERT INTO public.vaccines VALUES (75, 'Vacuna contra clostridiosis refuerzo', 'Refuerzo anual de clostridiosis.');
INSERT INTO public.vaccines VALUES (76, 'Vacuna contra parainfluenza refuerzo', 'Refuerzo anual de parainfluenza canina.');
INSERT INTO public.vaccines VALUES (77, 'Vacuna contra brucelosis refuerzo', 'Refuerzo anual de brucelosis.');
INSERT INTO public.vaccines VALUES (78, 'Vacuna contra toxoplasmosis refuerzo', 'Refuerzo anual de toxoplasmosis felina.');
INSERT INTO public.vaccines VALUES (79, 'Vacuna contra distemper refuerzo', 'Refuerzo anual de distemper felino.');
INSERT INTO public.vaccines VALUES (80, 'Vacuna contra panleucopenia felina avanzada', 'Protección extendida contra panleucopenia felina.');
INSERT INTO public.vaccines VALUES (81, 'Vacuna contra calicivirus avanzada', 'Protección extendida contra calicivirus felino.');
INSERT INTO public.vaccines VALUES (82, 'Vacuna contra rinotraqueítis avanzada', 'Protección extendida contra rinotraqueítis felina.');
INSERT INTO public.vaccines VALUES (83, 'Vacuna contra leptospirosis avanzada', 'Protección extendida contra leptospirosis canina.');
INSERT INTO public.vaccines VALUES (84, 'Vacuna contra moquillo avanzada', 'Protección extendida contra moquillo canino.');
INSERT INTO public.vaccines VALUES (85, 'Vacuna contra parvovirus avanzada', 'Protección extendida contra parvovirus canino.');
INSERT INTO public.vaccines VALUES (86, 'Vacuna contra leucemia avanzada', 'Protección extendida contra leucemia felina.');
INSERT INTO public.vaccines VALUES (87, 'Vacuna combinada triple canina', 'Combina protección contra moquillo, hepatitis y parvovirus.');
INSERT INTO public.vaccines VALUES (88, 'Vacuna combinada triple felina', 'Protege contra panleucopenia, calicivirus y rinotraqueítis.');
INSERT INTO public.vaccines VALUES (89, 'Vacuna tetravalente canina', 'Protección contra cuatro enfermedades principales.');
INSERT INTO public.vaccines VALUES (90, 'Vacuna pentavalente canina', 'Protección contra cinco enfermedades.');
INSERT INTO public.vaccines VALUES (91, 'Vacuna hexavalente canina', 'Protección completa contra seis enfermedades.');
INSERT INTO public.vaccines VALUES (92, 'Vacuna heptavalente canina', 'Cobertura contra siete enfermedades.');
INSERT INTO public.vaccines VALUES (93, 'Vacuna polivalente felina', 'Protección extendida para gatos domésticos.');
INSERT INTO public.vaccines VALUES (94, 'Vacuna contra coronavirus felino avanzada', 'Protección extendida contra coronavirus intestinal felino.');
INSERT INTO public.vaccines VALUES (95, 'Vacuna contra rabia reforzada', 'Versión mejorada de vacuna antirrábica.');
INSERT INTO public.vaccines VALUES (96, 'Vacuna combinada canina avanzada', 'Protección combinada de amplio espectro.');
INSERT INTO public.vaccines VALUES (97, 'Vacuna combinada felina avanzada', 'Protección combinada contra virus respiratorios y digestivos.');
INSERT INTO public.vaccines VALUES (98, 'Vacuna contra leptospirosis tipo 4', 'Protección frente a cuatro serovariedades.');
INSERT INTO public.vaccines VALUES (99, 'Vacuna contra moquillo y parvovirus', 'Vacuna doble de amplio uso veterinario.');
INSERT INTO public.vaccines VALUES (100, 'Vacuna contra brucelosis tipo B', 'Prevención avanzada contra brucelosis bovina.');
INSERT INTO public.vaccines VALUES (101, 'Vacuna contra fiebre aftosa avanzada', 'Prevención mejorada contra fiebre aftosa.');
INSERT INTO public.vaccines VALUES (102, 'Vacuna combinada antirrábica', 'Vacuna combinada para perros y gatos.');
INSERT INTO public.vaccines VALUES (103, 'Vacuna antirrábica trivalente', 'Protección extendida contra cepas múltiples de rabia.');
INSERT INTO public.vaccines VALUES (104, 'Vacuna universal felina', 'Protección integral para gatos domésticos.');
INSERT INTO public.vaccines VALUES (105, 'Vacuna universal canina', 'Protección integral para perros domésticos.');


--
-- TOC entry 3629 (class 0 OID 106536)
-- Dependencies: 224
-- Data for Name: veterinarians; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.veterinarians VALUES (1, 'Dr. Carlos Ramírez', 'Medicina Interna');
INSERT INTO public.veterinarians VALUES (2, 'Dra. Laura Gómez', 'Cirugía General');
INSERT INTO public.veterinarians VALUES (3, 'Dr. Andrés López', 'Dermatología');
INSERT INTO public.veterinarians VALUES (4, 'Dra. Paola Fernández', 'Odontología Veterinaria');
INSERT INTO public.veterinarians VALUES (5, 'Dr. Sebastián Torres', 'Cardiología');
INSERT INTO public.veterinarians VALUES (6, 'Dra. Natalia Rojas', 'Neurología');
INSERT INTO public.veterinarians VALUES (7, 'Dr. Daniel Martínez', 'Oftalmología');
INSERT INTO public.veterinarians VALUES (8, 'Dra. Juliana Vargas', 'Traumatología');
INSERT INTO public.veterinarians VALUES (9, 'Dr. Felipe Herrera', 'Anestesiología');
INSERT INTO public.veterinarians VALUES (10, 'Dra. Carolina Castro', 'Medicina Felina');
INSERT INTO public.veterinarians VALUES (11, 'Dr. Jorge Arias', 'Ortopedia');
INSERT INTO public.veterinarians VALUES (12, 'Dra. Daniela Suárez', 'Rehabilitación y Fisioterapia');
INSERT INTO public.veterinarians VALUES (13, 'Dr. Miguel Ospina', 'Reproducción Animal');
INSERT INTO public.veterinarians VALUES (14, 'Dra. Ana Beltrán', 'Zootecnia');
INSERT INTO public.veterinarians VALUES (15, 'Dr. Santiago Pérez', 'Nutrición Animal');
INSERT INTO public.veterinarians VALUES (16, 'Dra. Catalina Morales', 'Etología');
INSERT INTO public.veterinarians VALUES (17, 'Dr. David Gutiérrez', 'Radiología');
INSERT INTO public.veterinarians VALUES (18, 'Dra. Valentina Jiménez', 'Medicina Preventiva');
INSERT INTO public.veterinarians VALUES (19, 'Dr. Mauricio Cárdenas', 'Urgencias');
INSERT INTO public.veterinarians VALUES (20, 'Dra. Andrea Rincón', 'Anestesia y Control del Dolor');
INSERT INTO public.veterinarians VALUES (21, 'Dr. Juan Esteban Díaz', 'Endocrinología');
INSERT INTO public.veterinarians VALUES (22, 'Dra. Lorena Vargas', 'Oncología');
INSERT INTO public.veterinarians VALUES (23, 'Dr. Ricardo Méndez', 'Epidemiología');
INSERT INTO public.veterinarians VALUES (24, 'Dra. Isabel Montoya', 'Farmacología');
INSERT INTO public.veterinarians VALUES (25, 'Dr. Cristian Pardo', 'Microbiología');
INSERT INTO public.veterinarians VALUES (26, 'Dra. Manuela Torres', 'Patología Clínica');
INSERT INTO public.veterinarians VALUES (27, 'Dr. Nicolás Rivas', 'Cardiología');
INSERT INTO public.veterinarians VALUES (28, 'Dra. Marcela Cano', 'Reproducción');
INSERT INTO public.veterinarians VALUES (29, 'Dr. Julián Ortiz', 'Dermatología');
INSERT INTO public.veterinarians VALUES (30, 'Dra. Sofía Mejía', 'Medicina Interna');
INSERT INTO public.veterinarians VALUES (31, 'Dr. Óscar Cifuentes', 'Cirugía General');
INSERT INTO public.veterinarians VALUES (32, 'Dra. Angélica Duarte', 'Ortopedia');
INSERT INTO public.veterinarians VALUES (33, 'Dr. Luis Prieto', 'Traumatología');
INSERT INTO public.veterinarians VALUES (34, 'Dra. Karol Sánchez', 'Medicina Preventiva');
INSERT INTO public.veterinarians VALUES (35, 'Dr. Camilo Pérez', 'Anestesiología');
INSERT INTO public.veterinarians VALUES (36, 'Dra. Alejandra Ruiz', 'Fisioterapia');
INSERT INTO public.veterinarians VALUES (37, 'Dr. Diego Marín', 'Oftalmología');
INSERT INTO public.veterinarians VALUES (38, 'Dra. Lina Gómez', 'Rehabilitación');
INSERT INTO public.veterinarians VALUES (39, 'Dr. Juan Camilo Rojas', 'Cardiología');
INSERT INTO public.veterinarians VALUES (40, 'Dra. Tatiana López', 'Medicina Felina');
INSERT INTO public.veterinarians VALUES (41, 'Dr. Jorge Muñoz', 'Neurología');
INSERT INTO public.veterinarians VALUES (42, 'Dra. Paola Castillo', 'Zootecnia');
INSERT INTO public.veterinarians VALUES (43, 'Dr. Iván Silva', 'Endocrinología');
INSERT INTO public.veterinarians VALUES (44, 'Dra. Estefanía Roldán', 'Cirugía General');
INSERT INTO public.veterinarians VALUES (45, 'Dr. Kevin Ocampo', 'Reproducción Animal');
INSERT INTO public.veterinarians VALUES (46, 'Dra. Diana Castro', 'Anestesiología');
INSERT INTO public.veterinarians VALUES (47, 'Dr. Andrés Cárdenas', 'Dermatología');
INSERT INTO public.veterinarians VALUES (48, 'Dra. Laura Torres', 'Nutrición');
INSERT INTO public.veterinarians VALUES (49, 'Dr. Cristian Gómez', 'Oncología');
INSERT INTO public.veterinarians VALUES (50, 'Dra. Gabriela Salazar', 'Medicina Interna');
INSERT INTO public.veterinarians VALUES (51, 'Dr. Alejandro Molina', 'Traumatología');
INSERT INTO public.veterinarians VALUES (52, 'Dra. Mónica Herrera', 'Rehabilitación');
INSERT INTO public.veterinarians VALUES (53, 'Dr. Henry Rodríguez', 'Urgencias');
INSERT INTO public.veterinarians VALUES (54, 'Dra. Natalia Arango', 'Etología');
INSERT INTO public.veterinarians VALUES (55, 'Dr. Mauricio Vargas', 'Reproducción');
INSERT INTO public.veterinarians VALUES (56, 'Dra. Andrea Morales', 'Oftalmología');
INSERT INTO public.veterinarians VALUES (57, 'Dr. Julián Ruiz', 'Ortopedia');
INSERT INTO public.veterinarians VALUES (58, 'Dra. Karina Medina', 'Anestesiología');
INSERT INTO public.veterinarians VALUES (59, 'Dr. Luis Castaño', 'Cardiología');
INSERT INTO public.veterinarians VALUES (60, 'Dra. Daniela Rojas', 'Dermatología');
INSERT INTO public.veterinarians VALUES (61, 'Dr. Sebastián Álvarez', 'Medicina Preventiva');
INSERT INTO public.veterinarians VALUES (62, 'Dra. Carolina Ruiz', 'Nutrición');
INSERT INTO public.veterinarians VALUES (63, 'Dr. Juan Herrera', 'Zootecnia');
INSERT INTO public.veterinarians VALUES (64, 'Dra. Patricia Osorio', 'Medicina Interna');
INSERT INTO public.veterinarians VALUES (65, 'Dr. Felipe Díaz', 'Traumatología');
INSERT INTO public.veterinarians VALUES (66, 'Dra. Liliana López', 'Cirugía General');
INSERT INTO public.veterinarians VALUES (67, 'Dr. Andrés Jiménez', 'Neurología');
INSERT INTO public.veterinarians VALUES (68, 'Dra. Catalina Ramírez', 'Oncología');
INSERT INTO public.veterinarians VALUES (69, 'Dr. David Romero', 'Cardiología');
INSERT INTO public.veterinarians VALUES (70, 'Dra. Paula Acosta', 'Fisioterapia');
INSERT INTO public.veterinarians VALUES (71, 'Dr. Jorge Torres', 'Urgencias');
INSERT INTO public.veterinarians VALUES (72, 'Dra. Sandra Méndez', 'Rehabilitación');
INSERT INTO public.veterinarians VALUES (73, 'Dr. Miguel Gómez', 'Cirugía General');
INSERT INTO public.veterinarians VALUES (74, 'Dra. Natalia Patiño', 'Dermatología');
INSERT INTO public.veterinarians VALUES (75, 'Dr. Camilo Arias', 'Reproducción');
INSERT INTO public.veterinarians VALUES (76, 'Dra. Sofía Rincón', 'Medicina Preventiva');
INSERT INTO public.veterinarians VALUES (77, 'Dr. Diego Morales', 'Oftalmología');
INSERT INTO public.veterinarians VALUES (78, 'Dra. Valeria Pardo', 'Anestesia');
INSERT INTO public.veterinarians VALUES (79, 'Dr. Cristian López', 'Endocrinología');
INSERT INTO public.veterinarians VALUES (80, 'Dra. Laura Castillo', 'Etología');
INSERT INTO public.veterinarians VALUES (81, 'Dr. Santiago Mejía', 'Ortopedia');
INSERT INTO public.veterinarians VALUES (82, 'Dra. Julieta Marín', 'Zootecnia');
INSERT INTO public.veterinarians VALUES (83, 'Dr. Andrés Ruiz', 'Nutrición');
INSERT INTO public.veterinarians VALUES (84, 'Dra. Paula Herrera', 'Medicina Interna');
INSERT INTO public.veterinarians VALUES (85, 'Dr. Nicolás Gaitán', 'Traumatología');
INSERT INTO public.veterinarians VALUES (86, 'Dra. Tatiana Rivas', 'Cardiología');
INSERT INTO public.veterinarians VALUES (87, 'Dr. Kevin Beltrán', 'Anestesiología');
INSERT INTO public.veterinarians VALUES (88, 'Dra. Mariana Ospina', 'Dermatología');
INSERT INTO public.veterinarians VALUES (89, 'Dr. Jorge Vélez', 'Oncología');
INSERT INTO public.veterinarians VALUES (90, 'Dra. Daniela González', 'Fisioterapia');
INSERT INTO public.veterinarians VALUES (91, 'Dr. Esteban Pardo', 'Reproducción');
INSERT INTO public.veterinarians VALUES (92, 'Dra. Andrea Ramírez', 'Cirugía General');
INSERT INTO public.veterinarians VALUES (93, 'Dr. Ricardo López', 'Urgencias');
INSERT INTO public.veterinarians VALUES (94, 'Dra. Carolina Jiménez', 'Medicina Felina');
INSERT INTO public.veterinarians VALUES (95, 'Dr. Felipe Suárez', 'Neurología');
INSERT INTO public.veterinarians VALUES (96, 'Dra. Natalia Cárdenas', 'Traumatología');
INSERT INTO public.veterinarians VALUES (97, 'Dr. Juan Torres', 'Ortopedia');
INSERT INTO public.veterinarians VALUES (98, 'Dra. Valentina Rojas', 'Cardiología');
INSERT INTO public.veterinarians VALUES (99, 'Dr. Sebastián Castro', 'Rehabilitación');
INSERT INTO public.veterinarians VALUES (100, 'Dr. Mauricio Díaz', 'Oncología Veterinaria');


--
-- TOC entry 3688 (class 0 OID 0)
-- Dependencies: 243
-- Name: appointments_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.appointments_audit_id_seq', 1, false);


--
-- TOC entry 3689 (class 0 OID 0)
-- Dependencies: 225
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.appointments_id_seq', 100, true);


--
-- TOC entry 3690 (class 0 OID 0)
-- Dependencies: 241
-- Name: laboratories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.laboratories_id_seq', 100, true);


--
-- TOC entry 3691 (class 0 OID 0)
-- Dependencies: 245
-- Name: medical_histories_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.medical_histories_audit_id_seq', 1, false);


--
-- TOC entry 3692 (class 0 OID 0)
-- Dependencies: 221
-- Name: medical_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.medical_histories_id_seq', 100, true);


--
-- TOC entry 3693 (class 0 OID 0)
-- Dependencies: 233
-- Name: medications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.medications_id_seq', 103, true);


--
-- TOC entry 3694 (class 0 OID 0)
-- Dependencies: 247
-- Name: owners_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.owners_audit_id_seq', 1, false);


--
-- TOC entry 3695 (class 0 OID 0)
-- Dependencies: 217
-- Name: owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.owners_id_seq', 103, true);


--
-- TOC entry 3696 (class 0 OID 0)
-- Dependencies: 249
-- Name: payments_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payments_audit_id_seq', 1, false);


--
-- TOC entry 3697 (class 0 OID 0)
-- Dependencies: 239
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payments_id_seq', 100, true);


--
-- TOC entry 3698 (class 0 OID 0)
-- Dependencies: 251
-- Name: pets_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pets_audit_id_seq', 1, false);


--
-- TOC entry 3699 (class 0 OID 0)
-- Dependencies: 219
-- Name: pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pets_id_seq', 101, true);


--
-- TOC entry 3700 (class 0 OID 0)
-- Dependencies: 255
-- Name: prescription_medications_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.prescription_medications_audit_id_seq', 1, false);


--
-- TOC entry 3701 (class 0 OID 0)
-- Dependencies: 237
-- Name: prescription_medications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.prescription_medications_id_seq', 100, true);


--
-- TOC entry 3702 (class 0 OID 0)
-- Dependencies: 253
-- Name: prescriptions_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.prescriptions_audit_id_seq', 1, false);


--
-- TOC entry 3703 (class 0 OID 0)
-- Dependencies: 235
-- Name: prescriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.prescriptions_id_seq', 200, true);


--
-- TOC entry 3704 (class 0 OID 0)
-- Dependencies: 227
-- Name: procedures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.procedures_id_seq', 100, true);


--
-- TOC entry 3705 (class 0 OID 0)
-- Dependencies: 231
-- Name: vaccine_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vaccine_applications_id_seq', 100, true);


--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 229
-- Name: vaccines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vaccines_id_seq', 105, true);


--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 223
-- Name: veterinarians_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.veterinarians_id_seq', 100, true);


--
-- TOC entry 3410 (class 2606 OID 131091)
-- Name: appointments_audit appointments_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.appointments_audit
    ADD CONSTRAINT appointments_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3392 (class 2606 OID 106548)
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- TOC entry 3408 (class 2606 OID 106661)
-- Name: laboratories laboratories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.laboratories
    ADD CONSTRAINT laboratories_pkey PRIMARY KEY (id);


--
-- TOC entry 3412 (class 2606 OID 131113)
-- Name: medical_histories_audit medical_histories_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medical_histories_audit
    ADD CONSTRAINT medical_histories_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3386 (class 2606 OID 106529)
-- Name: medical_histories medical_histories_pet_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medical_histories
    ADD CONSTRAINT medical_histories_pet_id_key UNIQUE (pet_id);


--
-- TOC entry 3388 (class 2606 OID 106527)
-- Name: medical_histories medical_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medical_histories
    ADD CONSTRAINT medical_histories_pkey PRIMARY KEY (id);


--
-- TOC entry 3400 (class 2606 OID 106607)
-- Name: medications medications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medications
    ADD CONSTRAINT medications_pkey PRIMARY KEY (id);


--
-- TOC entry 3414 (class 2606 OID 131135)
-- Name: owners_audit owners_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.owners_audit
    ADD CONSTRAINT owners_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3382 (class 2606 OID 106505)
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);


--
-- TOC entry 3416 (class 2606 OID 131157)
-- Name: payments_audit payments_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments_audit
    ADD CONSTRAINT payments_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3406 (class 2606 OID 106647)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 3418 (class 2606 OID 131179)
-- Name: pets_audit pets_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pets_audit
    ADD CONSTRAINT pets_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3384 (class 2606 OID 106512)
-- Name: pets pets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (id);


--
-- TOC entry 3422 (class 2606 OID 131223)
-- Name: prescription_medications_audit prescription_medications_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prescription_medications_audit
    ADD CONSTRAINT prescription_medications_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3404 (class 2606 OID 106630)
-- Name: prescription_medications prescription_medications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prescription_medications
    ADD CONSTRAINT prescription_medications_pkey PRIMARY KEY (id);


--
-- TOC entry 3420 (class 2606 OID 131201)
-- Name: prescriptions_audit prescriptions_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prescriptions_audit
    ADD CONSTRAINT prescriptions_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3402 (class 2606 OID 106616)
-- Name: prescriptions prescriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_pkey PRIMARY KEY (id);


--
-- TOC entry 3394 (class 2606 OID 106567)
-- Name: procedures procedures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.procedures
    ADD CONSTRAINT procedures_pkey PRIMARY KEY (id);


--
-- TOC entry 3398 (class 2606 OID 106588)
-- Name: vaccine_applications vaccine_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vaccine_applications
    ADD CONSTRAINT vaccine_applications_pkey PRIMARY KEY (id);


--
-- TOC entry 3396 (class 2606 OID 106581)
-- Name: vaccines vaccines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vaccines
    ADD CONSTRAINT vaccines_pkey PRIMARY KEY (id);


--
-- TOC entry 3390 (class 2606 OID 106541)
-- Name: veterinarians veterinarians_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.veterinarians
    ADD CONSTRAINT veterinarians_pkey PRIMARY KEY (id);


--
-- TOC entry 3444 (class 2620 OID 131097)
-- Name: appointments ad_appointments; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ad_appointments AFTER DELETE ON public.appointments FOR EACH ROW EXECUTE FUNCTION public.trg_ad_appointments();


--
-- TOC entry 3441 (class 2620 OID 131119)
-- Name: medical_histories ad_medical_histories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ad_medical_histories AFTER DELETE ON public.medical_histories FOR EACH ROW EXECUTE FUNCTION public.trg_ad_medical_histories();


--
-- TOC entry 3435 (class 2620 OID 131141)
-- Name: owners ad_owners; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ad_owners AFTER DELETE ON public.owners FOR EACH ROW EXECUTE FUNCTION public.trg_ad_owners();


--
-- TOC entry 3453 (class 2620 OID 131163)
-- Name: payments ad_payments; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ad_payments AFTER DELETE ON public.payments FOR EACH ROW EXECUTE FUNCTION public.trg_ad_payments();


--
-- TOC entry 3438 (class 2620 OID 131185)
-- Name: pets ad_pets; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ad_pets AFTER DELETE ON public.pets FOR EACH ROW EXECUTE FUNCTION public.trg_ad_pets();


--
-- TOC entry 3450 (class 2620 OID 131229)
-- Name: prescription_medications ad_prescription_medications; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ad_prescription_medications AFTER DELETE ON public.prescription_medications FOR EACH ROW EXECUTE FUNCTION public.trg_ad_prescription_medications();


--
-- TOC entry 3447 (class 2620 OID 131207)
-- Name: prescriptions ad_prescriptions; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ad_prescriptions AFTER DELETE ON public.prescriptions FOR EACH ROW EXECUTE FUNCTION public.trg_ad_prescriptions();


--
-- TOC entry 3445 (class 2620 OID 131093)
-- Name: appointments ai_appointments; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ai_appointments AFTER INSERT ON public.appointments FOR EACH ROW EXECUTE FUNCTION public.trg_ai_appointments();


--
-- TOC entry 3442 (class 2620 OID 131115)
-- Name: medical_histories ai_medical_histories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ai_medical_histories AFTER INSERT ON public.medical_histories FOR EACH ROW EXECUTE FUNCTION public.trg_ai_medical_histories();


--
-- TOC entry 3436 (class 2620 OID 131137)
-- Name: owners ai_owners; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ai_owners AFTER INSERT ON public.owners FOR EACH ROW EXECUTE FUNCTION public.trg_ai_owners();


--
-- TOC entry 3454 (class 2620 OID 131159)
-- Name: payments ai_payments; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ai_payments AFTER INSERT ON public.payments FOR EACH ROW EXECUTE FUNCTION public.trg_ai_payments();


--
-- TOC entry 3439 (class 2620 OID 131181)
-- Name: pets ai_pets; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ai_pets AFTER INSERT ON public.pets FOR EACH ROW EXECUTE FUNCTION public.trg_ai_pets();


--
-- TOC entry 3451 (class 2620 OID 131225)
-- Name: prescription_medications ai_prescription_medications; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ai_prescription_medications AFTER INSERT ON public.prescription_medications FOR EACH ROW EXECUTE FUNCTION public.trg_ai_prescription_medications();


--
-- TOC entry 3448 (class 2620 OID 131203)
-- Name: prescriptions ai_prescriptions; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ai_prescriptions AFTER INSERT ON public.prescriptions FOR EACH ROW EXECUTE FUNCTION public.trg_ai_prescriptions();


--
-- TOC entry 3446 (class 2620 OID 131095)
-- Name: appointments au_appointments; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER au_appointments AFTER UPDATE ON public.appointments FOR EACH ROW EXECUTE FUNCTION public.trg_au_appointments();


--
-- TOC entry 3443 (class 2620 OID 131117)
-- Name: medical_histories au_medical_histories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER au_medical_histories AFTER UPDATE ON public.medical_histories FOR EACH ROW EXECUTE FUNCTION public.trg_au_medical_histories();


--
-- TOC entry 3437 (class 2620 OID 131139)
-- Name: owners au_owners; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER au_owners AFTER UPDATE ON public.owners FOR EACH ROW EXECUTE FUNCTION public.trg_au_owners();


--
-- TOC entry 3455 (class 2620 OID 131161)
-- Name: payments au_payments; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER au_payments AFTER UPDATE ON public.payments FOR EACH ROW EXECUTE FUNCTION public.trg_au_payments();


--
-- TOC entry 3440 (class 2620 OID 131183)
-- Name: pets au_pets; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER au_pets AFTER UPDATE ON public.pets FOR EACH ROW EXECUTE FUNCTION public.trg_au_pets();


--
-- TOC entry 3452 (class 2620 OID 131227)
-- Name: prescription_medications au_prescription_medications; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER au_prescription_medications AFTER UPDATE ON public.prescription_medications FOR EACH ROW EXECUTE FUNCTION public.trg_au_prescription_medications();


--
-- TOC entry 3449 (class 2620 OID 131205)
-- Name: prescriptions au_prescriptions; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER au_prescriptions AFTER UPDATE ON public.prescriptions FOR EACH ROW EXECUTE FUNCTION public.trg_au_prescriptions();


--
-- TOC entry 3456 (class 2620 OID 131101)
-- Name: appointments_audit bid_appointments_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bid_appointments_audit BEFORE DELETE ON public.appointments_audit FOR EACH ROW EXECUTE FUNCTION public.trg_bid_appointments_audit();


--
-- TOC entry 3459 (class 2620 OID 131123)
-- Name: medical_histories_audit bid_medical_histories_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bid_medical_histories_audit BEFORE DELETE ON public.medical_histories_audit FOR EACH ROW EXECUTE FUNCTION public.trg_bid_medical_histories_audit();


--
-- TOC entry 3462 (class 2620 OID 131145)
-- Name: owners_audit bid_owners_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bid_owners_audit BEFORE DELETE ON public.owners_audit FOR EACH ROW EXECUTE FUNCTION public.trg_bid_owners_audit();


--
-- TOC entry 3465 (class 2620 OID 131167)
-- Name: payments_audit bid_payments_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bid_payments_audit BEFORE DELETE ON public.payments_audit FOR EACH ROW EXECUTE FUNCTION public.trg_bid_payments_audit();


--
-- TOC entry 3468 (class 2620 OID 131189)
-- Name: pets_audit bid_pets_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bid_pets_audit BEFORE DELETE ON public.pets_audit FOR EACH ROW EXECUTE FUNCTION public.trg_bid_pets_audit();


--
-- TOC entry 3474 (class 2620 OID 131233)
-- Name: prescription_medications_audit bid_prescription_medications_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bid_prescription_medications_audit BEFORE DELETE ON public.prescription_medications_audit FOR EACH ROW EXECUTE FUNCTION public.trg_bid_prescription_medications_audit();


--
-- TOC entry 3471 (class 2620 OID 131211)
-- Name: prescriptions_audit bid_prescriptions_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bid_prescriptions_audit BEFORE DELETE ON public.prescriptions_audit FOR EACH ROW EXECUTE FUNCTION public.trg_bid_prescriptions_audit();


--
-- TOC entry 3457 (class 2620 OID 131103)
-- Name: appointments_audit bii_appointments_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bii_appointments_audit BEFORE INSERT ON public.appointments_audit FOR EACH ROW EXECUTE FUNCTION public.trg_bii_appointments_audit();


--
-- TOC entry 3460 (class 2620 OID 131125)
-- Name: medical_histories_audit bii_medical_histories_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bii_medical_histories_audit BEFORE INSERT ON public.medical_histories_audit FOR EACH ROW EXECUTE FUNCTION public.trg_bii_medical_histories_audit();


--
-- TOC entry 3463 (class 2620 OID 131147)
-- Name: owners_audit bii_owners_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bii_owners_audit BEFORE INSERT ON public.owners_audit FOR EACH ROW EXECUTE FUNCTION public.trg_bii_owners_audit();


--
-- TOC entry 3466 (class 2620 OID 131169)
-- Name: payments_audit bii_payments_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bii_payments_audit BEFORE INSERT ON public.payments_audit FOR EACH ROW EXECUTE FUNCTION public.trg_bii_payments_audit();


--
-- TOC entry 3469 (class 2620 OID 131191)
-- Name: pets_audit bii_pets_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bii_pets_audit BEFORE INSERT ON public.pets_audit FOR EACH ROW EXECUTE FUNCTION public.trg_bii_pets_audit();


--
-- TOC entry 3475 (class 2620 OID 131235)
-- Name: prescription_medications_audit bii_prescription_medications_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bii_prescription_medications_audit BEFORE INSERT ON public.prescription_medications_audit FOR EACH ROW EXECUTE FUNCTION public.trg_bii_prescription_medications_audit();


--
-- TOC entry 3472 (class 2620 OID 131213)
-- Name: prescriptions_audit bii_prescriptions_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bii_prescriptions_audit BEFORE INSERT ON public.prescriptions_audit FOR EACH ROW EXECUTE FUNCTION public.trg_bii_prescriptions_audit();


--
-- TOC entry 3458 (class 2620 OID 131099)
-- Name: appointments_audit biu_appointments_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER biu_appointments_audit BEFORE UPDATE ON public.appointments_audit FOR EACH ROW EXECUTE FUNCTION public.trg_biu_appointments_audit();


--
-- TOC entry 3461 (class 2620 OID 131121)
-- Name: medical_histories_audit biu_medical_histories_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER biu_medical_histories_audit BEFORE UPDATE ON public.medical_histories_audit FOR EACH ROW EXECUTE FUNCTION public.trg_biu_medical_histories_audit();


--
-- TOC entry 3464 (class 2620 OID 131143)
-- Name: owners_audit biu_owners_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER biu_owners_audit BEFORE UPDATE ON public.owners_audit FOR EACH ROW EXECUTE FUNCTION public.trg_biu_owners_audit();


--
-- TOC entry 3467 (class 2620 OID 131165)
-- Name: payments_audit biu_payments_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER biu_payments_audit BEFORE UPDATE ON public.payments_audit FOR EACH ROW EXECUTE FUNCTION public.trg_biu_payments_audit();


--
-- TOC entry 3470 (class 2620 OID 131187)
-- Name: pets_audit biu_pets_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER biu_pets_audit BEFORE UPDATE ON public.pets_audit FOR EACH ROW EXECUTE FUNCTION public.trg_biu_pets_audit();


--
-- TOC entry 3476 (class 2620 OID 131231)
-- Name: prescription_medications_audit biu_prescription_medications_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER biu_prescription_medications_audit BEFORE UPDATE ON public.prescription_medications_audit FOR EACH ROW EXECUTE FUNCTION public.trg_biu_prescription_medications_audit();


--
-- TOC entry 3473 (class 2620 OID 131209)
-- Name: prescriptions_audit biu_prescriptions_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER biu_prescriptions_audit BEFORE UPDATE ON public.prescriptions_audit FOR EACH ROW EXECUTE FUNCTION public.trg_biu_prescriptions_audit();


--
-- TOC entry 3425 (class 2606 OID 106549)
-- Name: appointments fk_appointments_pet; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk_appointments_pet FOREIGN KEY (pet_id) REFERENCES public.pets(id) ON DELETE CASCADE;


--
-- TOC entry 3426 (class 2606 OID 106554)
-- Name: appointments fk_appointments_vet; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk_appointments_vet FOREIGN KEY (veterinarian_id) REFERENCES public.veterinarians(id) ON DELETE CASCADE;


--
-- TOC entry 3434 (class 2606 OID 106662)
-- Name: laboratories fk_laboratories_appointment; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.laboratories
    ADD CONSTRAINT fk_laboratories_appointment FOREIGN KEY (appointment_id) REFERENCES public.appointments(id) ON DELETE CASCADE;


--
-- TOC entry 3424 (class 2606 OID 106530)
-- Name: medical_histories fk_medical_histories_pet; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medical_histories
    ADD CONSTRAINT fk_medical_histories_pet FOREIGN KEY (pet_id) REFERENCES public.pets(id) ON DELETE CASCADE;


--
-- TOC entry 3433 (class 2606 OID 106648)
-- Name: payments fk_payments_appointment; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_payments_appointment FOREIGN KEY (appointment_id) REFERENCES public.appointments(id) ON DELETE CASCADE;


--
-- TOC entry 3423 (class 2606 OID 106513)
-- Name: pets fk_pets_owner; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT fk_pets_owner FOREIGN KEY (owner_id) REFERENCES public.owners(id) ON DELETE CASCADE;


--
-- TOC entry 3431 (class 2606 OID 106631)
-- Name: prescription_medications fk_prescription_med; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prescription_medications
    ADD CONSTRAINT fk_prescription_med FOREIGN KEY (prescription_id) REFERENCES public.prescriptions(id) ON DELETE CASCADE;


--
-- TOC entry 3432 (class 2606 OID 106636)
-- Name: prescription_medications fk_prescription_medication; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prescription_medications
    ADD CONSTRAINT fk_prescription_medication FOREIGN KEY (medication_id) REFERENCES public.medications(id) ON DELETE CASCADE;


--
-- TOC entry 3430 (class 2606 OID 106617)
-- Name: prescriptions fk_prescriptions_appointment; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT fk_prescriptions_appointment FOREIGN KEY (appointment_id) REFERENCES public.appointments(id) ON DELETE CASCADE;


--
-- TOC entry 3427 (class 2606 OID 106568)
-- Name: procedures fk_procedures_appointment; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.procedures
    ADD CONSTRAINT fk_procedures_appointment FOREIGN KEY (appointment_id) REFERENCES public.appointments(id) ON DELETE CASCADE;


--
-- TOC entry 3428 (class 2606 OID 106589)
-- Name: vaccine_applications fk_vaccine_applications_appointment; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vaccine_applications
    ADD CONSTRAINT fk_vaccine_applications_appointment FOREIGN KEY (appointment_id) REFERENCES public.appointments(id) ON DELETE CASCADE;


--
-- TOC entry 3429 (class 2606 OID 106594)
-- Name: vaccine_applications fk_vaccine_applications_vaccine; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vaccine_applications
    ADD CONSTRAINT fk_vaccine_applications_vaccine FOREIGN KEY (vaccine_id) REFERENCES public.vaccines(id) ON DELETE CASCADE;


-- Completed on 2025-10-15 22:13:49

--
-- PostgreSQL database dump complete
--

