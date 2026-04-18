--
-- PostgreSQL database dump
--

\restrict M7DRyf2e0FZvB3piGvsVQg6HQY8JBMdvhRgFuqfGWA0VBmDiTY5R78ixTJy40qW

-- Dumped from database version 18.3 (Debian 18.3-1.pgdg12+1)
-- Dumped by pg_dump version 18.3 (Ubuntu 18.3-1.pgdg24.04+1)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: dhan02_user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO dhan02_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO dhan02_user;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_attachments_id_seq OWNER TO dhan02_user;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO dhan02_user;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_blobs_id_seq OWNER TO dhan02_user;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO dhan02_user;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNER TO dhan02_user;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: affiliates; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.affiliates (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    middle_name character varying,
    email character varying,
    mobile character varying,
    address text,
    city character varying,
    state character varying,
    pincode character varying,
    pan_no character varying,
    gst_no character varying,
    commission_percentage numeric(5,2),
    bank_name character varying,
    account_no character varying,
    ifsc_code character varying,
    account_holder_name character varying,
    account_type character varying,
    upi_id character varying,
    status boolean DEFAULT true,
    notes text,
    auto_generated_password character varying,
    joining_date date,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    company_name character varying,
    username character varying
);


ALTER TABLE public.affiliates OWNER TO dhan02_user;

--
-- Name: affiliates_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.affiliates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.affiliates_id_seq OWNER TO dhan02_user;

--
-- Name: affiliates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.affiliates_id_seq OWNED BY public.affiliates.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO dhan02_user;

--
-- Name: banners; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.banners (
    id bigint NOT NULL,
    title character varying,
    description text,
    redirect_link character varying,
    display_start_date date,
    display_end_date date,
    display_location character varying,
    status boolean DEFAULT true,
    display_order integer DEFAULT 0,
    image character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    image_url character varying
);


ALTER TABLE public.banners OWNER TO dhan02_user;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banners_id_seq OWNER TO dhan02_user;

--
-- Name: banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.banners_id_seq OWNED BY public.banners.id;


--
-- Name: booking_invoices; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.booking_invoices (
    id bigint NOT NULL,
    booking_id bigint NOT NULL,
    customer_id bigint,
    invoice_number character varying,
    invoice_date timestamp(6) without time zone,
    due_date timestamp(6) without time zone,
    subtotal numeric(10,2),
    tax_amount numeric(10,2),
    discount_amount numeric(10,2),
    total_amount numeric(10,2),
    payment_status integer,
    status integer,
    notes text,
    invoice_items text,
    paid_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    share_token character varying
);


ALTER TABLE public.booking_invoices OWNER TO dhan02_user;

--
-- Name: booking_invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.booking_invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.booking_invoices_id_seq OWNER TO dhan02_user;

--
-- Name: booking_invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.booking_invoices_id_seq OWNED BY public.booking_invoices.id;


--
-- Name: booking_items; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.booking_items (
    id bigint NOT NULL,
    booking_id integer,
    product_id integer,
    quantity numeric(8,2),
    price numeric,
    total numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.booking_items OWNER TO dhan02_user;

--
-- Name: booking_items_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.booking_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.booking_items_id_seq OWNER TO dhan02_user;

--
-- Name: booking_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.booking_items_id_seq OWNED BY public.booking_items.id;


--
-- Name: booking_schedules; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.booking_schedules (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    product_id bigint NOT NULL,
    schedule_type character varying,
    frequency character varying,
    start_date date,
    end_date date,
    quantity integer,
    delivery_time time without time zone,
    delivery_address text,
    pincode character varying,
    latitude numeric,
    longitude numeric,
    status character varying,
    next_booking_date date,
    total_bookings_generated integer,
    notes text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.booking_schedules OWNER TO dhan02_user;

--
-- Name: booking_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.booking_schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.booking_schedules_id_seq OWNER TO dhan02_user;

--
-- Name: booking_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.booking_schedules_id_seq OWNED BY public.booking_schedules.id;


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.bookings (
    id bigint NOT NULL,
    customer_id integer,
    user_id integer,
    booking_number character varying,
    booking_date timestamp(6) without time zone,
    status character varying,
    payment_method character varying,
    payment_status character varying,
    subtotal numeric,
    tax_amount numeric,
    discount_amount numeric,
    total_amount numeric,
    notes text,
    booking_items text,
    customer_name character varying,
    customer_email character varying,
    customer_phone character varying,
    delivery_address text,
    invoice_generated boolean,
    invoice_number character varying,
    cash_received numeric,
    change_amount numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    booking_schedule_id bigint,
    stage character varying,
    courier_service character varying,
    tracking_number character varying,
    shipping_charges numeric(10,2),
    expected_delivery_date date,
    delivery_person character varying,
    delivery_contact character varying,
    delivered_to character varying,
    delivery_time timestamp(6) without time zone,
    customer_satisfaction integer,
    processing_team character varying,
    expected_completion_time timestamp(6) without time zone,
    estimated_processing_time character varying,
    estimated_delivery_time character varying,
    package_weight numeric(8,2),
    package_dimensions character varying,
    quality_status character varying,
    cancellation_reason character varying,
    return_reason character varying,
    return_condition character varying,
    refund_amount numeric(10,2),
    refund_method character varying,
    transition_notes text,
    stage_history text,
    stage_updated_at timestamp(6) without time zone,
    stage_updated_by integer,
    store_id bigint,
    subscription_id integer,
    is_subscription boolean,
    final_amount_after_discount numeric,
    delivery_person_id bigint,
    franchise_id bigint,
    quick_invoice boolean DEFAULT false,
    booked_by character varying DEFAULT 'admin'::character varying
);


ALTER TABLE public.bookings OWNER TO dhan02_user;

--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_id_seq OWNER TO dhan02_user;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    image character varying,
    status boolean DEFAULT true,
    display_order integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    image_backup_url character varying
);


ALTER TABLE public.categories OWNER TO dhan02_user;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO dhan02_user;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: client_requests; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.client_requests (
    id bigint NOT NULL,
    title character varying,
    description text,
    status character varying DEFAULT 'pending'::character varying,
    priority character varying DEFAULT 'medium'::character varying,
    customer_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    stage character varying DEFAULT 'new'::character varying,
    stage_updated_at timestamp(6) without time zone,
    stage_history text,
    assignee_id integer,
    department character varying,
    estimated_resolution_time timestamp(6) without time zone,
    actual_resolution_time timestamp(6) without time zone,
    name character varying,
    email character varying,
    phone_number character varying,
    ticket_number character varying,
    admin_response text,
    resolved_by_id integer,
    submitted_at timestamp(6) without time zone,
    resolved_at timestamp(6) without time zone
);


ALTER TABLE public.client_requests OWNER TO dhan02_user;

--
-- Name: client_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.client_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.client_requests_id_seq OWNER TO dhan02_user;

--
-- Name: client_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.client_requests_id_seq OWNED BY public.client_requests.id;


--
-- Name: coupons; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.coupons (
    id bigint NOT NULL,
    code character varying,
    description text,
    discount_type character varying,
    discount_value numeric,
    minimum_amount numeric,
    maximum_discount numeric,
    usage_limit integer,
    used_count integer,
    valid_from timestamp(6) without time zone,
    valid_until timestamp(6) without time zone,
    status boolean,
    applicable_products text,
    applicable_categories text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.coupons OWNER TO dhan02_user;

--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupons_id_seq OWNER TO dhan02_user;

--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.coupons_id_seq OWNED BY public.coupons.id;


--
-- Name: customer_addresses; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.customer_addresses (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    name character varying,
    mobile character varying,
    address_type character varying,
    address text,
    landmark character varying,
    city character varying,
    state character varying,
    pincode character varying,
    latitude numeric,
    longitude numeric,
    is_default boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.customer_addresses OWNER TO dhan02_user;

--
-- Name: customer_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.customer_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_addresses_id_seq OWNER TO dhan02_user;

--
-- Name: customer_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.customer_addresses_id_seq OWNED BY public.customer_addresses.id;


--
-- Name: customer_formats; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.customer_formats (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    pattern character varying,
    quantity numeric,
    product_id bigint NOT NULL,
    delivery_person_id bigint NOT NULL,
    status character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    days text
);


ALTER TABLE public.customer_formats OWNER TO dhan02_user;

--
-- Name: customer_formats_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.customer_formats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_formats_id_seq OWNER TO dhan02_user;

--
-- Name: customer_formats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.customer_formats_id_seq OWNED BY public.customer_formats.id;


--
-- Name: customer_wallets; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.customer_wallets (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    balance numeric(10,2) DEFAULT 0.0,
    status boolean DEFAULT true,
    notes text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.customer_wallets OWNER TO dhan02_user;

--
-- Name: customer_wallets_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.customer_wallets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_wallets_id_seq OWNER TO dhan02_user;

--
-- Name: customer_wallets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.customer_wallets_id_seq OWNED BY public.customer_wallets.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    mobile character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    longitude numeric(10,8),
    latitude numeric(10,8),
    whatsapp_number character varying,
    auto_generated_password character varying,
    location_obtained_at timestamp(6) without time zone,
    location_accuracy numeric(8,2),
    password_digest character varying,
    middle_name character varying,
    address text,
    birth_date date,
    gender character varying,
    marital_status character varying,
    pan_no character varying,
    gst_no character varying,
    company_name character varying,
    occupation character varying,
    annual_income numeric,
    emergency_contact_name character varying,
    emergency_contact_number character varying,
    blood_group character varying,
    nationality character varying,
    preferred_language character varying,
    notes text,
    status boolean DEFAULT true NOT NULL,
    is_registered_by_mobile boolean
);


ALTER TABLE public.customers OWNER TO dhan02_user;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_id_seq OWNER TO dhan02_user;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: delivery_people; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.delivery_people (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    mobile character varying,
    vehicle_type character varying,
    vehicle_number character varying,
    license_number character varying,
    address text,
    city character varying,
    state character varying,
    pincode character varying,
    emergency_contact_name character varying,
    emergency_contact_mobile character varying,
    joining_date date,
    salary numeric,
    status boolean,
    profile_picture character varying,
    bank_name character varying,
    account_no character varying,
    ifsc_code character varying,
    account_holder_name character varying,
    delivery_areas text,
    notes text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    password_digest character varying,
    auto_generated_password character varying
);


ALTER TABLE public.delivery_people OWNER TO dhan02_user;

--
-- Name: delivery_people_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.delivery_people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.delivery_people_id_seq OWNER TO dhan02_user;

--
-- Name: delivery_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.delivery_people_id_seq OWNED BY public.delivery_people.id;


--
-- Name: delivery_rules; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.delivery_rules (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    rule_type character varying NOT NULL,
    location_data text,
    is_excluded boolean DEFAULT false,
    delivery_days integer,
    delivery_charge numeric(8,2) DEFAULT 0.0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.delivery_rules OWNER TO dhan02_user;

--
-- Name: delivery_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.delivery_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.delivery_rules_id_seq OWNER TO dhan02_user;

--
-- Name: delivery_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.delivery_rules_id_seq OWNED BY public.delivery_rules.id;


--
-- Name: device_tokens; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.device_tokens (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    delivery_person_id bigint NOT NULL,
    token character varying,
    device_type character varying,
    active boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.device_tokens OWNER TO dhan02_user;

--
-- Name: device_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.device_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.device_tokens_id_seq OWNER TO dhan02_user;

--
-- Name: device_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.device_tokens_id_seq OWNED BY public.device_tokens.id;


--
-- Name: expenses; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.expenses (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    created_by_id bigint NOT NULL,
    title character varying NOT NULL,
    description text,
    amount numeric(10,2) NOT NULL,
    category character varying NOT NULL,
    expense_date date NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.expenses OWNER TO dhan02_user;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.expenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.expenses_id_seq OWNER TO dhan02_user;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.expenses_id_seq OWNED BY public.expenses.id;


--
-- Name: franchises; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.franchises (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    mobile character varying,
    contact_person_name character varying,
    business_type character varying,
    address text,
    city character varying,
    state character varying,
    pincode character varying,
    pan_no character varying,
    gst_no character varying,
    license_no character varying,
    establishment_date date,
    territory character varying,
    franchise_fee numeric,
    commission_percentage numeric,
    status boolean,
    notes text,
    password_digest character varying,
    auto_generated_password character varying,
    longitude numeric,
    latitude numeric,
    whatsapp_number character varying,
    profile_image character varying,
    business_documents text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.franchises OWNER TO dhan02_user;

--
-- Name: franchises_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.franchises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.franchises_id_seq OWNER TO dhan02_user;

--
-- Name: franchises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.franchises_id_seq OWNED BY public.franchises.id;


--
-- Name: invoice_items; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.invoice_items (
    id bigint NOT NULL,
    invoice_id bigint NOT NULL,
    milk_delivery_task_id bigint,
    description text,
    quantity numeric,
    unit_price numeric,
    total_amount numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    product_id bigint
);


ALTER TABLE public.invoice_items OWNER TO dhan02_user;

--
-- Name: invoice_items_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.invoice_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoice_items_id_seq OWNER TO dhan02_user;

--
-- Name: invoice_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.invoice_items_id_seq OWNED BY public.invoice_items.id;


--
-- Name: invoices; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.invoices (
    id bigint NOT NULL,
    invoice_number character varying,
    payout_type character varying,
    payout_id integer,
    total_amount numeric,
    status character varying,
    invoice_date date,
    due_date date,
    paid_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    customer_id integer,
    payment_status integer,
    share_token character varying,
    quick_invoice boolean DEFAULT false,
    paid_amount numeric(10,2) DEFAULT 0.0
);


ALTER TABLE public.invoices OWNER TO dhan02_user;

--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoices_id_seq OWNER TO dhan02_user;

--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.invoices_id_seq OWNED BY public.invoices.id;


--
-- Name: leads; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.leads (
    id bigint NOT NULL,
    name character varying,
    contact_number character varying,
    email character varying,
    current_stage character varying,
    lead_source character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    product_category character varying,
    product_subcategory character varying,
    customer_type character varying,
    affiliate_id integer,
    is_direct boolean,
    first_name character varying,
    last_name character varying,
    middle_name character varying,
    company_name character varying,
    gender character varying,
    marital_status character varying,
    pan_no character varying,
    gst_no character varying,
    height numeric,
    weight numeric,
    annual_income numeric,
    business_job character varying
);


ALTER TABLE public.leads OWNER TO dhan02_user;

--
-- Name: leads_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.leads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.leads_id_seq OWNER TO dhan02_user;

--
-- Name: leads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.leads_id_seq OWNED BY public.leads.id;


--
-- Name: milk_delivery_tasks; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.milk_delivery_tasks (
    id bigint NOT NULL,
    subscription_id bigint,
    customer_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity numeric(10,2),
    unit character varying,
    delivery_date date,
    delivery_person_id bigint,
    status character varying DEFAULT 'pending'::character varying,
    assigned_at timestamp(6) without time zone,
    completed_at timestamp(6) without time zone,
    delivery_notes text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    invoiced boolean DEFAULT false,
    invoiced_at timestamp(6) without time zone
);


ALTER TABLE public.milk_delivery_tasks OWNER TO dhan02_user;

--
-- Name: milk_delivery_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.milk_delivery_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.milk_delivery_tasks_id_seq OWNER TO dhan02_user;

--
-- Name: milk_delivery_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.milk_delivery_tasks_id_seq OWNED BY public.milk_delivery_tasks.id;


--
-- Name: milk_subscriptions; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.milk_subscriptions (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity numeric(10,2),
    unit character varying DEFAULT 'liter'::character varying,
    start_date date,
    end_date date,
    delivery_time character varying DEFAULT 'morning'::character varying,
    delivery_pattern character varying DEFAULT 'daily'::character varying,
    specific_dates text,
    total_amount numeric(10,2),
    status character varying DEFAULT 'active'::character varying,
    is_active boolean DEFAULT true,
    created_by integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    delivery_person_id integer
);


ALTER TABLE public.milk_subscriptions OWNER TO dhan02_user;

--
-- Name: milk_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.milk_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.milk_subscriptions_id_seq OWNER TO dhan02_user;

--
-- Name: milk_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.milk_subscriptions_id_seq OWNED BY public.milk_subscriptions.id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.notes (
    id bigint NOT NULL,
    title character varying NOT NULL,
    paid_to character varying NOT NULL,
    amount numeric(10,2) NOT NULL,
    payment_method character varying NOT NULL,
    reference_number character varying,
    description text,
    status character varying DEFAULT 'pending'::character varying,
    note_date date DEFAULT CURRENT_DATE NOT NULL,
    created_by_user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    paid_from character varying,
    paid_to_category character varying
);


ALTER TABLE public.notes OWNER TO dhan02_user;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notes_id_seq OWNER TO dhan02_user;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    title character varying,
    message text,
    notification_type character varying,
    data json,
    read boolean,
    read_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.notifications OWNER TO dhan02_user;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO dhan02_user;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.order_items (
    id bigint NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer,
    price numeric,
    total numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.order_items OWNER TO dhan02_user;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_id_seq OWNER TO dhan02_user;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    customer_id integer,
    user_id integer,
    order_number character varying,
    order_date timestamp(6) without time zone,
    status character varying,
    payment_method character varying,
    payment_status character varying,
    subtotal numeric,
    tax_amount numeric,
    discount_amount numeric,
    shipping_amount numeric,
    total_amount numeric,
    notes text,
    order_items text,
    customer_name character varying,
    customer_email character varying,
    customer_phone character varying,
    delivery_address text,
    tracking_number character varying,
    delivered_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    processing_notes text,
    estimated_processing_time integer,
    processing_started_at timestamp(6) without time zone,
    packed_by character varying,
    package_weight numeric,
    package_dimensions character varying,
    packing_notes text,
    packed_at timestamp(6) without time zone,
    shipping_carrier character varying,
    estimated_delivery_date date,
    shipping_cost numeric,
    shipping_notes text,
    shipped_at timestamp(6) without time zone,
    delivered_to character varying,
    delivery_location character varying,
    delivery_notes text,
    cancelled_at timestamp(6) without time zone,
    cancellation_reason character varying,
    refund_method character varying,
    refund_amount numeric,
    cancellation_notes text,
    invoice_generated boolean DEFAULT false,
    invoice_number character varying,
    cash_received numeric(10,2),
    change_amount numeric(10,2),
    order_stage character varying DEFAULT 'draft'::character varying,
    booking_date timestamp(6) without time zone,
    booking_id integer
);


ALTER TABLE public.orders OWNER TO dhan02_user;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO dhan02_user;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: pending_amounts; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.pending_amounts (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    amount numeric,
    description text,
    pending_date date,
    status integer,
    notes text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.pending_amounts OWNER TO dhan02_user;

--
-- Name: pending_amounts_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.pending_amounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pending_amounts_id_seq OWNER TO dhan02_user;

--
-- Name: pending_amounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.pending_amounts_id_seq OWNED BY public.pending_amounts.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying NOT NULL,
    resource character varying,
    action character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.permissions OWNER TO dhan02_user;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO dhan02_user;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: product_ratings; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.product_ratings (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    customer_id bigint,
    user_id bigint,
    rating integer NOT NULL,
    comment text,
    status integer DEFAULT 0,
    reviewer_name character varying,
    reviewer_email character varying,
    verified_purchase boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.product_ratings OWNER TO dhan02_user;

--
-- Name: product_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.product_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_ratings_id_seq OWNER TO dhan02_user;

--
-- Name: product_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.product_ratings_id_seq OWNED BY public.product_ratings.id;


--
-- Name: product_reviews; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.product_reviews (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    customer_id bigint,
    user_id bigint,
    rating integer NOT NULL,
    comment text,
    reviewer_name character varying,
    reviewer_email character varying,
    status integer DEFAULT 0,
    verified_purchase boolean DEFAULT false,
    helpful_count integer DEFAULT 0,
    pros text,
    cons text,
    title character varying,
    images_data json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.product_reviews OWNER TO dhan02_user;

--
-- Name: product_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.product_reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_reviews_id_seq OWNER TO dhan02_user;

--
-- Name: product_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.product_reviews_id_seq OWNED BY public.product_reviews.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    category_id bigint NOT NULL,
    price numeric(10,2) NOT NULL,
    discount_price numeric(10,2),
    stock integer DEFAULT 0,
    status character varying DEFAULT 'active'::character varying,
    sku character varying NOT NULL,
    weight numeric(8,3),
    dimensions character varying,
    meta_title text,
    meta_description text,
    tags text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    discount_type character varying,
    discount_value numeric(10,2),
    original_price numeric(10,2),
    discount_amount numeric(10,2),
    is_discounted boolean DEFAULT false,
    gst_enabled boolean DEFAULT false,
    gst_percentage numeric(5,2),
    cgst_percentage numeric(5,2),
    sgst_percentage numeric(5,2),
    igst_percentage numeric(5,2),
    gst_amount numeric(10,2),
    cgst_amount numeric(10,2),
    sgst_amount numeric(10,2),
    igst_amount numeric(10,2),
    final_amount_with_gst numeric(10,2),
    buying_price numeric(10,2),
    yesterday_price numeric(10,2),
    today_price numeric(10,2),
    price_change_percentage numeric(5,2),
    last_price_update timestamp(6) without time zone,
    price_history text,
    is_occasional_product boolean DEFAULT false NOT NULL,
    occasional_start_date timestamp(6) without time zone,
    occasional_end_date timestamp(6) without time zone,
    occasional_description text,
    occasional_auto_hide boolean DEFAULT true NOT NULL,
    product_type character varying DEFAULT 'Grocery'::character varying,
    occasional_schedule_type character varying,
    occasional_recurring_from_day character varying,
    occasional_recurring_from_time time without time zone,
    occasional_recurring_to_day character varying,
    occasional_recurring_to_time time without time zone,
    is_subscription_enabled boolean DEFAULT false,
    unit_type character varying,
    minimum_stock_alert integer,
    default_selling_price numeric,
    hsn_code character varying,
    image_url character varying,
    additional_images_urls text,
    display_order integer,
    base_price_excluding_gst numeric
);


ALTER TABLE public.products OWNER TO dhan02_user;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO dhan02_user;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: referrals; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.referrals (
    id bigint NOT NULL,
    affiliate_id bigint,
    referred_name character varying,
    referred_mobile character varying,
    referred_email character varying,
    referral_date date,
    status character varying,
    notes text,
    converted_at timestamp(6) without time zone,
    customer_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    referring_customer_id bigint,
    referral_source character varying DEFAULT 'affiliate'::character varying
);


ALTER TABLE public.referrals OWNER TO dhan02_user;

--
-- Name: referrals_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.referrals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.referrals_id_seq OWNER TO dhan02_user;

--
-- Name: referrals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.referrals_id_seq OWNED BY public.referrals.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    description text,
    status boolean,
    permissions text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO dhan02_user;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO dhan02_user;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: sale_items; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.sale_items (
    id bigint NOT NULL,
    booking_id bigint NOT NULL,
    product_id bigint NOT NULL,
    stock_batch_id bigint NOT NULL,
    quantity numeric,
    selling_price numeric,
    purchase_price numeric,
    profit_amount numeric,
    line_total numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.sale_items OWNER TO dhan02_user;

--
-- Name: sale_items_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.sale_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sale_items_id_seq OWNER TO dhan02_user;

--
-- Name: sale_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.sale_items_id_seq OWNED BY public.sale_items.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO dhan02_user;

--
-- Name: solid_cache_entries; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.solid_cache_entries (
    id bigint NOT NULL,
    key bytea NOT NULL,
    value bytea NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    key_hash bigint NOT NULL,
    byte_size integer NOT NULL
);


ALTER TABLE public.solid_cache_entries OWNER TO dhan02_user;

--
-- Name: solid_cache_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.solid_cache_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_cache_entries_id_seq OWNER TO dhan02_user;

--
-- Name: solid_cache_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.solid_cache_entries_id_seq OWNED BY public.solid_cache_entries.id;


--
-- Name: solid_queue_blocked_executions; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.solid_queue_blocked_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    queue_name character varying NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    concurrency_key character varying NOT NULL,
    expires_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_blocked_executions OWNER TO dhan02_user;

--
-- Name: solid_queue_blocked_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.solid_queue_blocked_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_blocked_executions_id_seq OWNER TO dhan02_user;

--
-- Name: solid_queue_blocked_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.solid_queue_blocked_executions_id_seq OWNED BY public.solid_queue_blocked_executions.id;


--
-- Name: solid_queue_claimed_executions; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.solid_queue_claimed_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    process_id bigint,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_claimed_executions OWNER TO dhan02_user;

--
-- Name: solid_queue_claimed_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.solid_queue_claimed_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_claimed_executions_id_seq OWNER TO dhan02_user;

--
-- Name: solid_queue_claimed_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.solid_queue_claimed_executions_id_seq OWNED BY public.solid_queue_claimed_executions.id;


--
-- Name: solid_queue_failed_executions; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.solid_queue_failed_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    error text,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_failed_executions OWNER TO dhan02_user;

--
-- Name: solid_queue_failed_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.solid_queue_failed_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_failed_executions_id_seq OWNER TO dhan02_user;

--
-- Name: solid_queue_failed_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.solid_queue_failed_executions_id_seq OWNED BY public.solid_queue_failed_executions.id;


--
-- Name: solid_queue_jobs; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.solid_queue_jobs (
    id bigint NOT NULL,
    queue_name character varying NOT NULL,
    class_name character varying NOT NULL,
    arguments text,
    priority integer DEFAULT 0 NOT NULL,
    active_job_id character varying,
    scheduled_at timestamp(6) without time zone,
    finished_at timestamp(6) without time zone,
    concurrency_key character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_jobs OWNER TO dhan02_user;

--
-- Name: solid_queue_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.solid_queue_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_jobs_id_seq OWNER TO dhan02_user;

--
-- Name: solid_queue_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.solid_queue_jobs_id_seq OWNED BY public.solid_queue_jobs.id;


--
-- Name: solid_queue_pauses; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.solid_queue_pauses (
    id bigint NOT NULL,
    queue_name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_pauses OWNER TO dhan02_user;

--
-- Name: solid_queue_pauses_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.solid_queue_pauses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_pauses_id_seq OWNER TO dhan02_user;

--
-- Name: solid_queue_pauses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.solid_queue_pauses_id_seq OWNED BY public.solid_queue_pauses.id;


--
-- Name: solid_queue_processes; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.solid_queue_processes (
    id bigint NOT NULL,
    kind character varying NOT NULL,
    last_heartbeat_at timestamp(6) without time zone NOT NULL,
    supervisor_id bigint,
    pid integer NOT NULL,
    hostname character varying,
    metadata text,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.solid_queue_processes OWNER TO dhan02_user;

--
-- Name: solid_queue_processes_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.solid_queue_processes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_processes_id_seq OWNER TO dhan02_user;

--
-- Name: solid_queue_processes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.solid_queue_processes_id_seq OWNED BY public.solid_queue_processes.id;


--
-- Name: solid_queue_ready_executions; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.solid_queue_ready_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    queue_name character varying NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_ready_executions OWNER TO dhan02_user;

--
-- Name: solid_queue_ready_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.solid_queue_ready_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_ready_executions_id_seq OWNER TO dhan02_user;

--
-- Name: solid_queue_ready_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.solid_queue_ready_executions_id_seq OWNED BY public.solid_queue_ready_executions.id;


--
-- Name: solid_queue_recurring_executions; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.solid_queue_recurring_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    task_key character varying NOT NULL,
    run_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_recurring_executions OWNER TO dhan02_user;

--
-- Name: solid_queue_recurring_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.solid_queue_recurring_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_recurring_executions_id_seq OWNER TO dhan02_user;

--
-- Name: solid_queue_recurring_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.solid_queue_recurring_executions_id_seq OWNED BY public.solid_queue_recurring_executions.id;


--
-- Name: solid_queue_recurring_tasks; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.solid_queue_recurring_tasks (
    id bigint NOT NULL,
    key character varying NOT NULL,
    schedule character varying NOT NULL,
    command character varying(2048),
    class_name character varying,
    arguments text,
    queue_name character varying,
    priority integer DEFAULT 0,
    static boolean DEFAULT true NOT NULL,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_recurring_tasks OWNER TO dhan02_user;

--
-- Name: solid_queue_recurring_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.solid_queue_recurring_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_recurring_tasks_id_seq OWNER TO dhan02_user;

--
-- Name: solid_queue_recurring_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.solid_queue_recurring_tasks_id_seq OWNED BY public.solid_queue_recurring_tasks.id;


--
-- Name: solid_queue_scheduled_executions; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.solid_queue_scheduled_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    queue_name character varying NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    scheduled_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_scheduled_executions OWNER TO dhan02_user;

--
-- Name: solid_queue_scheduled_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.solid_queue_scheduled_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_scheduled_executions_id_seq OWNER TO dhan02_user;

--
-- Name: solid_queue_scheduled_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.solid_queue_scheduled_executions_id_seq OWNED BY public.solid_queue_scheduled_executions.id;


--
-- Name: solid_queue_semaphores; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.solid_queue_semaphores (
    id bigint NOT NULL,
    key character varying NOT NULL,
    value integer DEFAULT 1 NOT NULL,
    expires_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_semaphores OWNER TO dhan02_user;

--
-- Name: solid_queue_semaphores_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.solid_queue_semaphores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_semaphores_id_seq OWNER TO dhan02_user;

--
-- Name: solid_queue_semaphores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.solid_queue_semaphores_id_seq OWNED BY public.solid_queue_semaphores.id;


--
-- Name: stock_batches; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.stock_batches (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    vendor_id bigint NOT NULL,
    vendor_purchase_id bigint,
    quantity_purchased numeric,
    quantity_remaining numeric,
    purchase_price numeric,
    selling_price numeric,
    batch_date date,
    status character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    store_id bigint
);


ALTER TABLE public.stock_batches OWNER TO dhan02_user;

--
-- Name: stock_batches_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.stock_batches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_batches_id_seq OWNER TO dhan02_user;

--
-- Name: stock_batches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.stock_batches_id_seq OWNED BY public.stock_batches.id;


--
-- Name: stock_movements; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.stock_movements (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    reference_type character varying NOT NULL,
    reference_id integer,
    movement_type character varying NOT NULL,
    quantity numeric(10,2) NOT NULL,
    stock_before numeric(10,2) NOT NULL,
    stock_after numeric(10,2) NOT NULL,
    notes text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    store_id bigint
);


ALTER TABLE public.stock_movements OWNER TO dhan02_user;

--
-- Name: stock_movements_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.stock_movements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_movements_id_seq OWNER TO dhan02_user;

--
-- Name: stock_movements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.stock_movements_id_seq OWNED BY public.stock_movements.id;


--
-- Name: store_inventory_transfers; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.store_inventory_transfers (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    from_store_id bigint,
    to_store_id bigint NOT NULL,
    initiated_by_id bigint NOT NULL,
    approved_by_id bigint,
    quantity numeric(8,2) NOT NULL,
    transfer_price numeric(10,2),
    status character varying DEFAULT 'pending'::character varying NOT NULL,
    notes text,
    transfer_reference_number character varying,
    courier_details character varying,
    tracking_number character varying,
    initiated_at timestamp(6) without time zone,
    approved_at timestamp(6) without time zone,
    shipped_at timestamp(6) without time zone,
    completed_at timestamp(6) without time zone,
    cancelled_at timestamp(6) without time zone,
    transfer_metadata json,
    shipping_cost numeric(8,2),
    estimated_delivery_days integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    CONSTRAINT positive_quantity CHECK ((quantity > (0)::numeric))
);


ALTER TABLE public.store_inventory_transfers OWNER TO dhan02_user;

--
-- Name: store_inventory_transfers_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.store_inventory_transfers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.store_inventory_transfers_id_seq OWNER TO dhan02_user;

--
-- Name: store_inventory_transfers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.store_inventory_transfers_id_seq OWNED BY public.store_inventory_transfers.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.stores (
    id bigint NOT NULL,
    name character varying,
    description text,
    address text,
    city character varying,
    state character varying,
    pincode character varying,
    contact_person character varying,
    contact_mobile character varying,
    email character varying,
    status boolean,
    gst_no character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    store_admin_user_id bigint,
    inventory_management_enabled boolean DEFAULT true,
    auto_transfer_threshold numeric(8,2) DEFAULT 10.0,
    manager_email character varying,
    operating_hours text,
    timezone character varying DEFAULT 'UTC'::character varying,
    admin_plain_password character varying
);


ALTER TABLE public.stores OWNER TO dhan02_user;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stores_id_seq OWNER TO dhan02_user;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- Name: sub_agents; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.sub_agents (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    middle_name character varying,
    email character varying,
    mobile character varying,
    password_digest character varying,
    plain_password character varying,
    original_password character varying,
    role_id integer,
    gender character varying,
    birth_date date,
    pan_no character varying,
    aadhar_no character varying,
    gst_no character varying,
    company_name character varying,
    address text,
    city character varying,
    state character varying,
    pincode character varying,
    country character varying,
    profile_picture character varying,
    bank_name character varying,
    account_no character varying,
    ifsc_code character varying,
    account_holder_name character varying,
    account_type character varying,
    upi_id character varying,
    emergency_contact_name character varying,
    emergency_contact_mobile character varying,
    joining_date date,
    salary numeric(10,2),
    notes text,
    status integer DEFAULT 0,
    distributor_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.sub_agents OWNER TO dhan02_user;

--
-- Name: sub_agents_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.sub_agents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sub_agents_id_seq OWNER TO dhan02_user;

--
-- Name: sub_agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.sub_agents_id_seq OWNED BY public.sub_agents.id;


--
-- Name: subscription_templates; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.subscription_templates (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    product_id bigint NOT NULL,
    delivery_person_id bigint,
    quantity numeric(8,2),
    unit character varying,
    price numeric(10,2),
    delivery_time character varying,
    is_active boolean,
    template_name character varying,
    notes text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.subscription_templates OWNER TO dhan02_user;

--
-- Name: subscription_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.subscription_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscription_templates_id_seq OWNER TO dhan02_user;

--
-- Name: subscription_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.subscription_templates_id_seq OWNED BY public.subscription_templates.id;


--
-- Name: system_settings; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.system_settings (
    id bigint NOT NULL,
    key character varying,
    value text,
    setting_type character varying,
    description text,
    default_main_agent_commission numeric,
    default_affiliate_commission numeric,
    default_ambassador_commission numeric,
    default_company_expenses numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    business_name character varying,
    address text,
    mobile character varying,
    email character varying,
    gstin character varying,
    pan_number character varying,
    account_holder_name character varying,
    bank_name character varying,
    account_number character varying,
    ifsc_code character varying,
    upi_id character varying,
    qr_code_path character varying,
    terms_and_conditions text,
    collect_from_store_enabled boolean
);


ALTER TABLE public.system_settings OWNER TO dhan02_user;

--
-- Name: system_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.system_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.system_settings_id_seq OWNER TO dhan02_user;

--
-- Name: system_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.system_settings_id_seq OWNED BY public.system_settings.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.user_roles (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    active boolean DEFAULT true,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.user_roles OWNER TO dhan02_user;

--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_roles_id_seq OWNER TO dhan02_user;

--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.user_roles_id_seq OWNED BY public.user_roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    email character varying NOT NULL,
    mobile character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    middle_name character varying,
    encrypted_password character varying,
    user_type character varying DEFAULT 'admin'::character varying,
    role character varying DEFAULT 'super_admin'::character varying,
    role_id integer,
    status boolean DEFAULT true,
    is_active boolean DEFAULT true,
    is_verified boolean DEFAULT false,
    birth_date date,
    gender character varying,
    pan_no character varying,
    aadhar_no character varying,
    gst_no character varying,
    company_name character varying,
    address text,
    city character varying,
    state character varying,
    pincode character varying,
    country character varying DEFAULT 'India'::character varying,
    profile_picture character varying,
    bank_name character varying,
    account_no character varying,
    ifsc_code character varying,
    account_holder_name character varying,
    account_type character varying,
    upi_id character varying,
    emergency_contact_name character varying,
    emergency_contact_mobile character varying,
    department character varying,
    designation character varying,
    joining_date date,
    salary numeric(10,2),
    employee_id character varying,
    reporting_manager_id integer,
    permissions text,
    sidebar_permissions text,
    last_login_at timestamp(6) without time zone,
    login_count integer DEFAULT 0,
    email_verified_at timestamp(6) without time zone,
    mobile_verified_at timestamp(6) without time zone,
    two_factor_enabled boolean DEFAULT false,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp(6) without time zone,
    last_sign_in_at timestamp(6) without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    confirmation_token character varying,
    confirmed_at timestamp(6) without time zone,
    confirmation_sent_at timestamp(6) without time zone,
    unlock_token character varying,
    locked_at timestamp(6) without time zone,
    failed_attempts integer DEFAULT 0,
    notes text,
    created_by integer,
    updated_by integer,
    deleted_at timestamp(6) without time zone,
    original_password character varying,
    authenticatable_type character varying,
    authenticatable_id bigint,
    assigned_store_id bigint,
    store_permissions json DEFAULT '{}'::json,
    last_store_access timestamp(6) without time zone,
    store_access_logs json DEFAULT '[]'::json,
    notification_preferences json DEFAULT '{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}'::json
);


ALTER TABLE public.users OWNER TO dhan02_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO dhan02_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vendor_invoices; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.vendor_invoices (
    id bigint NOT NULL,
    vendor_purchase_id bigint NOT NULL,
    invoice_number character varying,
    total_amount numeric,
    status integer,
    invoice_date date,
    share_token character varying,
    notes text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.vendor_invoices OWNER TO dhan02_user;

--
-- Name: vendor_invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.vendor_invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendor_invoices_id_seq OWNER TO dhan02_user;

--
-- Name: vendor_invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.vendor_invoices_id_seq OWNED BY public.vendor_invoices.id;


--
-- Name: vendor_payments; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.vendor_payments (
    id bigint NOT NULL,
    vendor_id bigint NOT NULL,
    vendor_purchase_id bigint NOT NULL,
    amount_paid numeric,
    payment_date date,
    payment_mode character varying,
    notes text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.vendor_payments OWNER TO dhan02_user;

--
-- Name: vendor_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.vendor_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendor_payments_id_seq OWNER TO dhan02_user;

--
-- Name: vendor_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.vendor_payments_id_seq OWNED BY public.vendor_payments.id;


--
-- Name: vendor_purchase_items; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.vendor_purchase_items (
    id bigint NOT NULL,
    vendor_purchase_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity numeric,
    purchase_price numeric,
    selling_price numeric,
    line_total numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.vendor_purchase_items OWNER TO dhan02_user;

--
-- Name: vendor_purchase_items_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.vendor_purchase_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendor_purchase_items_id_seq OWNER TO dhan02_user;

--
-- Name: vendor_purchase_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.vendor_purchase_items_id_seq OWNED BY public.vendor_purchase_items.id;


--
-- Name: vendor_purchases; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.vendor_purchases (
    id bigint NOT NULL,
    vendor_id bigint NOT NULL,
    purchase_date date,
    total_amount numeric,
    paid_amount numeric,
    status character varying,
    notes text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.vendor_purchases OWNER TO dhan02_user;

--
-- Name: vendor_purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.vendor_purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendor_purchases_id_seq OWNER TO dhan02_user;

--
-- Name: vendor_purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.vendor_purchases_id_seq OWNED BY public.vendor_purchases.id;


--
-- Name: vendors; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.vendors (
    id bigint NOT NULL,
    name character varying,
    phone character varying,
    email character varying,
    address text,
    payment_type character varying,
    opening_balance numeric,
    status boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.vendors OWNER TO dhan02_user;

--
-- Name: vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendors_id_seq OWNER TO dhan02_user;

--
-- Name: vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.vendors_id_seq OWNED BY public.vendors.id;


--
-- Name: wallet_transactions; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.wallet_transactions (
    id bigint NOT NULL,
    customer_wallet_id bigint NOT NULL,
    transaction_type character varying,
    amount numeric(10,2),
    balance_after numeric(10,2),
    description character varying,
    reference_number character varying,
    metadata json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.wallet_transactions OWNER TO dhan02_user;

--
-- Name: wallet_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.wallet_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wallet_transactions_id_seq OWNER TO dhan02_user;

--
-- Name: wallet_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.wallet_transactions_id_seq OWNED BY public.wallet_transactions.id;


--
-- Name: wishlists; Type: TABLE; Schema: public; Owner: dhan02_user
--

CREATE TABLE public.wishlists (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.wishlists OWNER TO dhan02_user;

--
-- Name: wishlists_id_seq; Type: SEQUENCE; Schema: public; Owner: dhan02_user
--

CREATE SEQUENCE public.wishlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wishlists_id_seq OWNER TO dhan02_user;

--
-- Name: wishlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhan02_user
--

ALTER SEQUENCE public.wishlists_id_seq OWNED BY public.wishlists.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: affiliates id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.affiliates ALTER COLUMN id SET DEFAULT nextval('public.affiliates_id_seq'::regclass);


--
-- Name: banners id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.banners ALTER COLUMN id SET DEFAULT nextval('public.banners_id_seq'::regclass);


--
-- Name: booking_invoices id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.booking_invoices ALTER COLUMN id SET DEFAULT nextval('public.booking_invoices_id_seq'::regclass);


--
-- Name: booking_items id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.booking_items ALTER COLUMN id SET DEFAULT nextval('public.booking_items_id_seq'::regclass);


--
-- Name: booking_schedules id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.booking_schedules ALTER COLUMN id SET DEFAULT nextval('public.booking_schedules_id_seq'::regclass);


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: client_requests id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.client_requests ALTER COLUMN id SET DEFAULT nextval('public.client_requests_id_seq'::regclass);


--
-- Name: coupons id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);


--
-- Name: customer_addresses id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.customer_addresses ALTER COLUMN id SET DEFAULT nextval('public.customer_addresses_id_seq'::regclass);


--
-- Name: customer_formats id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.customer_formats ALTER COLUMN id SET DEFAULT nextval('public.customer_formats_id_seq'::regclass);


--
-- Name: customer_wallets id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.customer_wallets ALTER COLUMN id SET DEFAULT nextval('public.customer_wallets_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: delivery_people id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.delivery_people ALTER COLUMN id SET DEFAULT nextval('public.delivery_people_id_seq'::regclass);


--
-- Name: delivery_rules id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.delivery_rules ALTER COLUMN id SET DEFAULT nextval('public.delivery_rules_id_seq'::regclass);


--
-- Name: device_tokens id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.device_tokens ALTER COLUMN id SET DEFAULT nextval('public.device_tokens_id_seq'::regclass);


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_id_seq'::regclass);


--
-- Name: franchises id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.franchises ALTER COLUMN id SET DEFAULT nextval('public.franchises_id_seq'::regclass);


--
-- Name: invoice_items id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.invoice_items ALTER COLUMN id SET DEFAULT nextval('public.invoice_items_id_seq'::regclass);


--
-- Name: invoices id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.invoices ALTER COLUMN id SET DEFAULT nextval('public.invoices_id_seq'::regclass);


--
-- Name: leads id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.leads ALTER COLUMN id SET DEFAULT nextval('public.leads_id_seq'::regclass);


--
-- Name: milk_delivery_tasks id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.milk_delivery_tasks ALTER COLUMN id SET DEFAULT nextval('public.milk_delivery_tasks_id_seq'::regclass);


--
-- Name: milk_subscriptions id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.milk_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.milk_subscriptions_id_seq'::regclass);


--
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: pending_amounts id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.pending_amounts ALTER COLUMN id SET DEFAULT nextval('public.pending_amounts_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: product_ratings id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.product_ratings ALTER COLUMN id SET DEFAULT nextval('public.product_ratings_id_seq'::regclass);


--
-- Name: product_reviews id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.product_reviews ALTER COLUMN id SET DEFAULT nextval('public.product_reviews_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: referrals id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.referrals ALTER COLUMN id SET DEFAULT nextval('public.referrals_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: sale_items id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.sale_items ALTER COLUMN id SET DEFAULT nextval('public.sale_items_id_seq'::regclass);


--
-- Name: solid_cache_entries id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_cache_entries ALTER COLUMN id SET DEFAULT nextval('public.solid_cache_entries_id_seq'::regclass);


--
-- Name: solid_queue_blocked_executions id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_blocked_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_blocked_executions_id_seq'::regclass);


--
-- Name: solid_queue_claimed_executions id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_claimed_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_claimed_executions_id_seq'::regclass);


--
-- Name: solid_queue_failed_executions id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_failed_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_failed_executions_id_seq'::regclass);


--
-- Name: solid_queue_jobs id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_jobs ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_jobs_id_seq'::regclass);


--
-- Name: solid_queue_pauses id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_pauses ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_pauses_id_seq'::regclass);


--
-- Name: solid_queue_processes id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_processes ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_processes_id_seq'::regclass);


--
-- Name: solid_queue_ready_executions id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_ready_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_ready_executions_id_seq'::regclass);


--
-- Name: solid_queue_recurring_executions id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_recurring_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_recurring_executions_id_seq'::regclass);


--
-- Name: solid_queue_recurring_tasks id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_recurring_tasks ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_recurring_tasks_id_seq'::regclass);


--
-- Name: solid_queue_scheduled_executions id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_scheduled_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_scheduled_executions_id_seq'::regclass);


--
-- Name: solid_queue_semaphores id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_semaphores ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_semaphores_id_seq'::regclass);


--
-- Name: stock_batches id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.stock_batches ALTER COLUMN id SET DEFAULT nextval('public.stock_batches_id_seq'::regclass);


--
-- Name: stock_movements id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.stock_movements ALTER COLUMN id SET DEFAULT nextval('public.stock_movements_id_seq'::regclass);


--
-- Name: store_inventory_transfers id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.store_inventory_transfers ALTER COLUMN id SET DEFAULT nextval('public.store_inventory_transfers_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- Name: sub_agents id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.sub_agents ALTER COLUMN id SET DEFAULT nextval('public.sub_agents_id_seq'::regclass);


--
-- Name: subscription_templates id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.subscription_templates ALTER COLUMN id SET DEFAULT nextval('public.subscription_templates_id_seq'::regclass);


--
-- Name: system_settings id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.system_settings ALTER COLUMN id SET DEFAULT nextval('public.system_settings_id_seq'::regclass);


--
-- Name: user_roles id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.user_roles ALTER COLUMN id SET DEFAULT nextval('public.user_roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vendor_invoices id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendor_invoices ALTER COLUMN id SET DEFAULT nextval('public.vendor_invoices_id_seq'::regclass);


--
-- Name: vendor_payments id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendor_payments ALTER COLUMN id SET DEFAULT nextval('public.vendor_payments_id_seq'::regclass);


--
-- Name: vendor_purchase_items id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendor_purchase_items ALTER COLUMN id SET DEFAULT nextval('public.vendor_purchase_items_id_seq'::regclass);


--
-- Name: vendor_purchases id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendor_purchases ALTER COLUMN id SET DEFAULT nextval('public.vendor_purchases_id_seq'::regclass);


--
-- Name: vendors id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendors ALTER COLUMN id SET DEFAULT nextval('public.vendors_id_seq'::regclass);


--
-- Name: wallet_transactions id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.wallet_transactions ALTER COLUMN id SET DEFAULT nextval('public.wallet_transactions_id_seq'::regclass);


--
-- Name: wishlists id; Type: DEFAULT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.wishlists ALTER COLUMN id SET DEFAULT nextval('public.wishlists_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
4	image	Category	2	4	2026-02-12 16:43:18.90868
8	personal_image	Customer	2	8	2026-02-16 11:41:09.107367
9	image	Category	5	9	2026-02-16 15:33:45.176034
10	image	Category	4	10	2026-02-16 15:36:49.145211
11	image	Category	6	11	2026-02-16 15:40:00.723689
12	image	Category	7	12	2026-02-16 15:43:43.084157
13	personal_image	Customer	4	13	2026-02-16 15:57:33.158563
14	images	Product	6	14	2026-02-17 11:36:34.789557
15	image	Category	12	15	2026-02-21 10:11:28.03443
16	image	Category	13	16	2026-02-21 10:13:49.354861
18	personal_image	Customer	20	18	2026-02-21 12:14:15.154785
19	personal_image	Customer	18	19	2026-02-23 12:37:55.947709
20	house_image	Customer	18	20	2026-02-23 12:37:56.446492
21	personal_image	Customer	48	21	2026-02-24 01:34:54.410908
22	banner_image	Banner	2	22	2026-02-24 03:43:14.08865
23	banner_image	Banner	3	23	2026-02-24 03:43:45.911136
24	banner_image	Banner	4	24	2026-02-24 03:44:10.868693
25	image	Category	1	25	2026-02-27 00:42:18.108084
26	personal_image	Customer	469	26	2026-03-04 06:38:37.307697
27	personal_image	Customer	477	27	2026-03-13 14:56:22.234587
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
1	3t1l827fk1vzmzkquysqrq93k0oq	WhatsApp Image 2026-02-08 at 9.25.11 PM.jpeg	image/jpeg	{"identified":true}	local	22400	jl6yRAWPOl8M+oO/pe1gvg==	2026-02-12 11:54:12.716336
2	vhuvvt9jio63b6l39nxht19hbe6q	WhatsApp Image 2026-02-08 at 9.25.11 PM.jpeg	image/jpeg	{"identified":true}	local	22400	jl6yRAWPOl8M+oO/pe1gvg==	2026-02-12 13:21:23.988587
3	ygzl179oghvcnxckt5eocbgvx9j7	personal-care.png	image/png	{"identified":true}	local	4046	VgcfexvxBptpaTwlGk1YWw==	2026-02-12 16:39:33.274898
4	zt1kuuq8l3nf2gnfdpwdmktj1607	personal-care.png	image/png	{"identified":true}	local	4046	VgcfexvxBptpaTwlGk1YWw==	2026-02-12 16:43:18.783373
5	yn1mrxcw3vbldcriiucbl3xz2lhk	personal-care.png	image/png	{"identified":true}	local	4046	VgcfexvxBptpaTwlGk1YWw==	2026-02-12 16:45:24.682986
6	7s74a8nw3674ptsftayje2uuawom	personal-care.png	image/png	{"identified":true}	local	4046	VgcfexvxBptpaTwlGk1YWw==	2026-02-13 05:51:24.593515
7	nvf2nao6idmpl0vymxh2jqc8bxxi	personal-care.png	image/png	{"identified":true}	local	4046	VgcfexvxBptpaTwlGk1YWw==	2026-02-13 05:52:07.312809
8	9f0frgqvpg9cjalc9603r665d04y	WhatsApp Image 2026-02-08 at 9.25.11 PM.jpeg	image/jpeg	{"identified":true}	local	22400	jl6yRAWPOl8M+oO/pe1gvg==	2026-02-16 11:41:08.817681
9	jaz3ubzewvhtn77neu8ruuohq7zz	spices.png	image/png	{"identified":true}	local	45237	dAspij4PHNJoFdsZkn+LiQ==	2026-02-16 15:33:45.020741
10	tc15r646xou5d8flvvg0partcxqu	snacks.jpg	image/jpeg	{"identified":true}	local	34172	bXk3U1YuMI5BDUCkhgHwUA==	2026-02-16 15:36:49.018668
11	dy27b4phyoxwqirnzzltx96z2ziu	nuts.png	image/png	{"identified":true}	local	56205	WGHhqWyZvaux21dOAgXhtQ==	2026-02-16 15:40:00.590984
12	nh3f5gd6ntvfxndap2cvzdlg5wse	whole grain.jpg	image/jpeg	{"identified":true}	local	45428	DWrv7mWMUK7otw++v2Ce/g==	2026-02-16 15:43:42.956899
13	fjh1zqdph598cx6oqfoaiqyqnjhm	WhatsApp Image 2026-02-08 at 9.25.11 PM.jpeg	image/jpeg	{"identified":true}	local	22400	jl6yRAWPOl8M+oO/pe1gvg==	2026-02-16 15:57:33.008874
14	g5azzmt4v6zzy11lxhtrcjqwgw1x	IMG_0417.JPG.jpeg	image/jpeg	{"identified":true}	local	4067876	JvOuBFprbq1CFoPSwNm0YA==	2026-02-17 11:36:34.663576
15	o5voa6yzskkn47k1c5e9wnv3a3um	rice.png	image/png	{"identified":true}	local	5224	y1EouuVyZ5lB/m9hR17N2Q==	2026-02-21 10:11:27.916417
16	a8ux1f3qcf3bsjwg9tv5jykjbgum	vegetables.png	image/png	{"identified":true}	local	41944	vD9QCuNm2jyIwOuaPCY+9g==	2026-02-21 10:13:49.233074
17	nboq1rr17orjjxkjcpo2bpnh9l13	vegetables.png	image/png	{"identified":true}	local	41944	vD9QCuNm2jyIwOuaPCY+9g==	2026-02-21 10:15:07.687831
18	ubtvchb75fzy7yztblftq9og8h9x	Screenshot from 2026-02-07 09-03-44.png	image/png	{"identified":true}	local	685418	HUFnpChmydP1SW7+d+Diig==	2026-02-21 12:14:14.894435
19	6fvu5ef2jcyimnd4oo55901d6sa5	customer 1.png	image/png	{"identified":true}	local	26379	DoGnmczAvsxxCHXfQIn+tg==	2026-02-23 12:37:55.825003
20	d3ze7z5bkk95okr65ftmi6gfu98g	customer house.jpg	image/jpeg	{"identified":true}	local	36538	T38R2MKg0HTX2I3UCUrhoQ==	2026-02-23 12:37:56.326148
21	36282h2byxoioq30csq5mqgmphor	logo.jpeg	image/jpeg	{"identified":true}	local	22400	jl6yRAWPOl8M+oO/pe1gvg==	2026-02-24 01:34:54.13753
22	2aso4dabq6iaap4wf4om6ydngzyf	siddhadnt.jpeg	image/jpeg	{"identified":true}	local	12977	C7awdn7CLs24BA7wU3fmiQ==	2026-02-24 03:43:13.967668
23	cq4i0f7bqrg4w90juvy1fp32d3ye	siddhadnt.jpeg	image/jpeg	{"identified":true}	local	12977	C7awdn7CLs24BA7wU3fmiQ==	2026-02-24 03:43:45.790956
24	ary24yi1hov1l38yb3dpin9pxeub	siddhadnt.jpeg	image/jpeg	{"identified":true}	local	12977	C7awdn7CLs24BA7wU3fmiQ==	2026-02-24 03:44:10.748379
25	5pfk9e5jhpuxmgw9hziktiku8nz9	Screenshot from 2026-02-07 07-40-01.png	image/png	{"identified":true}	local	103977	MMlazV5x2k5IlxCZxk25dg==	2026-02-27 00:42:17.82227
26	vfairils192g7tnzi91fz2kdkp79	Screenshot from 2026-02-07 11-43-48.png	image/png	{"identified":true}	local	245237	7Raaaj42A+rSmSsDa6Ankw==	2026-03-04 06:38:37.306322
27	tafdif3tm1u8vpk3e1uxxsk1ital	customer 1.png	image/png	{"identified":true}	local	26379	DoGnmczAvsxxCHXfQIn+tg==	2026-03-13 14:56:22.230544
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: affiliates; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.affiliates (id, first_name, last_name, middle_name, email, mobile, address, city, state, pincode, pan_no, gst_no, commission_percentage, bank_name, account_no, ifsc_code, account_holder_name, account_type, upi_id, status, notes, auto_generated_password, joining_date, created_at, updated_at, company_name, username) FROM stdin;
4	Test	Affiliate	\N	test_affiliate_1772757232@example.com	+91 6666666666	123 Test Street	Bangalore	Karnataka	560001	\N	\N	5.00	\N	\N	\N	Test Affiliate	\N	\N	t	\N	TEST@2026	2026-03-06	2026-03-06 00:33:53.879271	2026-03-06 00:33:53.879271	\N	testaffiliate4
6	pramod	bhat		test_final_1772757316@example.com	+91 81305 99805	dfd	Bangalore	karnataka	560068			2.99				pramod			t		PRAM@2026	2026-03-05	2026-03-06 00:35:22.640528	2026-03-06 00:35:22.640528		pramodbhattest1772757316
7	pramod	bhat		909fre3939393fdfds@gmail.com	+91 78788 38383	dfd	Bangalore	karnataka	560068			34.00				pramod			t		PRAM@2026	2026-03-06	2026-03-06 00:40:52.371579	2026-03-06 00:40:52.371579		pramodbhat
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
schema_sha1	9c6777daaa6ce85cc74b26c38000144a7834a947	2026-02-12 02:44:06.897761	2026-02-12 02:44:06.897764
environment	development	2026-02-12 02:44:05.79552	2026-02-22 10:18:57.284237
\.


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.banners (id, title, description, redirect_link, display_start_date, display_end_date, display_location, status, display_order, image, created_at, updated_at, image_url) FROM stdin;
\.


--
-- Data for Name: booking_invoices; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.booking_invoices (id, booking_id, customer_id, invoice_number, invoice_date, due_date, subtotal, tax_amount, discount_amount, total_amount, payment_status, status, notes, invoice_items, paid_at, created_at, updated_at, share_token) FROM stdin;
5	5	\N	INV202603017CC077	2026-03-01 15:56:01.353026	2026-03-31 15:56:01.353048	4761.90	238.10	1000.00	4000.00	0	1	Invoice generated for booking #BK202603017718FC	[{"product_id":3,"product_name":"A2 Ghee","quantity":2,"price":"2500.0","total":"5000.0"}]	\N	2026-03-01 15:56:01.368443	2026-03-01 15:56:01.368443	LtTEGeHM5gcY3c0skGxX8r2vC-UltKQZJYefDoSl2pI
6	6	\N	INV20260301551DC8	2026-03-01 15:59:05.242414	2026-03-31 15:59:05.242477	57.15	2.85	0.00	60.00	0	1	Invoice generated for booking #BK2026030105171C	[{"product_id":8,"product_name":"Chandan Product","quantity":1,"price":"60.0","total":"60.0"}]	\N	2026-03-01 15:59:05.255412	2026-03-01 15:59:05.255412	J_HyzrQbf2AcmgYZyPYDldQZhdtLOJA5vQytnJZcC3g
\.


--
-- Data for Name: booking_items; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.booking_items (id, booking_id, product_id, quantity, price, total, created_at, updated_at) FROM stdin;
1	1	5	1.00	1889.46	1889.46	2026-03-01 11:45:13.960993	2026-03-01 11:45:13.960993
2	1	9	1.00	90.0	90.0	2026-03-01 11:45:14.038628	2026-03-01 11:45:14.038628
3	2	3	1.00	2625.0	2625.0	2026-03-01 11:54:34.752813	2026-03-01 11:54:34.752813
4	2	13	1.00	110.0	110.0	2026-03-01 11:54:38.23828	2026-03-01 11:54:38.23828
5	3	3	1.00	2500.0	2500.0	2026-03-01 13:19:36.935605	2026-03-01 13:19:36.935605
6	3	10	1.00	60.0	60.0	2026-03-01 13:19:36.96146	2026-03-01 13:19:36.96146
7	4	10	4.00	60.0	240.0	2026-03-01 13:26:28.41809	2026-03-01 13:26:28.41809
8	5	3	2.00	2500.0	5000.0	2026-03-01 15:56:01.157261	2026-03-01 15:56:01.157261
9	6	8	1.00	60.0	60.0	2026-03-01 15:59:05.17429	2026-03-01 15:59:05.17429
10	7	16	7.00	100.0	700.0	2026-03-02 06:53:23.634391	2026-03-02 06:53:23.634391
88	71	29	1.50	60.0	90.0	2026-03-13 14:58:53.963814	2026-03-13 14:58:53.963814
89	72	29	1.00	60.0	60.0	2026-03-21 03:29:27.421653	2026-03-21 03:29:27.421653
90	73	29	1.00	100.0	100.0	2026-03-21 04:02:51.818107	2026-03-21 04:02:51.818107
91	74	33	1.00	100.0	100.0	2026-03-23 00:32:56.657407	2026-03-23 00:32:56.657407
92	75	3	1.00	2500.0	2500.0	2026-03-30 11:22:54.508394	2026-03-30 11:22:54.508394
93	76	34	1.00	60.0	60.0	2026-03-31 14:58:27.430495	2026-03-31 14:58:27.430495
94	77	34	1.00	60.0	60.0	2026-03-31 15:06:25.677699	2026-03-31 15:06:25.677699
95	78	37	5.00	100.0	500.0	2026-03-31 15:15:39.978824	2026-03-31 15:15:39.978824
\.


--
-- Data for Name: booking_schedules; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.booking_schedules (id, customer_id, product_id, schedule_type, frequency, start_date, end_date, quantity, delivery_time, delivery_address, pincode, latitude, longitude, status, next_booking_date, total_bookings_generated, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.bookings (id, customer_id, user_id, booking_number, booking_date, status, payment_method, payment_status, subtotal, tax_amount, discount_amount, total_amount, notes, booking_items, customer_name, customer_email, customer_phone, delivery_address, invoice_generated, invoice_number, cash_received, change_amount, created_at, updated_at, booking_schedule_id, stage, courier_service, tracking_number, shipping_charges, expected_delivery_date, delivery_person, delivery_contact, delivered_to, delivery_time, customer_satisfaction, processing_team, expected_completion_time, estimated_processing_time, estimated_delivery_time, package_weight, package_dimensions, quality_status, cancellation_reason, return_reason, return_condition, refund_amount, refund_method, transition_notes, stage_history, stage_updated_at, stage_updated_by, store_id, subscription_id, is_subscription, final_amount_after_discount, delivery_person_id, franchise_id, quick_invoice, booked_by) FROM stdin;
5	\N	1	BK202603017718FC	2026-02-19 18:30:00	completed	0	unpaid	4761.9	238.1	1000.0	4000.0		\N	Suresh Golaratti		09945151165	Golarahatti	t	INV202603017CC077	\N	0.0	2026-03-01 15:56:01.15436	2026-03-01 15:57:11.136311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	4000.0	\N	\N	f	admin
11	169	\N	BK20260302DF08E4	2026-03-02 07:12:37.888032	completed	0	unpaid	11.0	0.0	\N	11.0	\N	\N	Divya Shree	\N	9902109170	Default Address	t	INV-000272	\N	\N	2026-03-02 07:12:39.049058	2026-03-02 23:45:43.426472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"from_stage":"draft","to_stage":"completed","timestamp":"2026-03-02T13:18:41.133+05:30","user_id":1,"user_name":"Admin User"}]	2026-03-02 07:48:41.134153	1	1	\N	\N	11.0	\N	\N	f	admin
10	169	\N	BK2026030271ED8F	2026-03-02 07:12:30.823186	completed	0	unpaid	55.0	0.0	\N	55.0	\N	\N	Divya Shree	\N	9902109170	Default Address	t	INV-000272	\N	\N	2026-03-02 07:12:33.964344	2026-03-02 23:45:45.108255	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"from_stage":"draft","to_stage":"completed","timestamp":"2026-03-02T13:19:11.881+05:30","user_id":1,"user_name":"Admin User"}]	2026-03-02 07:49:11.881905	1	1	\N	\N	55.0	\N	\N	f	admin
6	\N	1	BK2026030105171C	2026-02-25 18:30:00	completed	0	unpaid	57.15	2.85	0.0	60.0		\N	Suresh Golaratti		09945151165	Golarahatti	t	INV20260301551DC8	\N	0.0	2026-03-01 15:59:05.171296	2026-03-01 15:59:05.21991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	60.0	\N	\N	f	admin
72	477	1	BK20260321C991BF	2026-03-20 18:30:00	completed	0	unpaid	60.0	3.0	0.0	63.0		\N	Rohan Shetty	r.shetty@gmail.com	8899889900	s	t	INV20260321D2952B	\N	0.0	2026-03-21 03:29:27.416089	2026-03-21 03:29:39.511739	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	63.0	\N	\N	f	admin
74	378	1	BK20260323B60CAE	2026-03-22 18:30:00	completed	0	unpaid	94.0	6.0	0.0	100.0		\N	Ashok Annapurneshwari Nagar		7019330447	wq	t	INV2026032301F4A4	\N	0.0	2026-03-23 00:32:56.350912	2026-03-23 00:38:05.943866	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100.0	\N	\N	f	admin
76	304	1	BK202603315ECF00	2026-03-30 18:30:00	ordered_and_delivery_pending	0	unpaid	60.0	0.0	0.0	60.0		\N	Sagar Girinagar		9033555455	getr	t	INV2026033182A44E	60.0	0.0	2026-03-31 14:58:27.426372	2026-03-31 14:58:53.932286	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	60.0	\N	\N	f	admin
78	304	1	BK20260331468D97	2026-03-30 18:30:00	completed	0	unpaid	476.0	24.0	0.0	500.0		\N	Sagar Girinagar		9033555455	yu	t	INV20260331E5E066	500.0	0.0	2026-03-31 15:15:39.97419	2026-03-31 15:17:08.075378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500.0	\N	\N	f	admin
71	477	1	BK20260313FB0AB6	2026-03-12 18:30:00	completed	0	paid	90.0	4.5	0.0	94.5		\N	Rohan Shetty	r.shetty@gmail.com	8899889900	59, R K Layout	t	INV-03-00001	90.0	0.0	2026-03-13 14:58:53.956755	2026-03-13 14:58:54.235922	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	94.5	\N	\N	t	admin
73	477	1	BK2026032158D2FE	2026-03-20 18:30:00	completed	0	unpaid	95.24	4.76	0.0	100.0		\N	Rohan Shetty	r.shetty@gmail.com	8899889900	yh	t	INV20260321B253B9	\N	0.0	2026-03-21 04:02:51.813139	2026-03-22 10:41:15.417669	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100.0	\N	\N	f	admin
75	\N	111	BK2026033047D9B9	\N	\N	0	unpaid	2381.0	119.0	0.0	2500.0	ds	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-03-30 11:22:54.197597	2026-03-30 11:22:54.197597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	36	\N	\N	2500.0	\N	\N	f	admin
77	304	1	BK2026033131A94B	2026-03-30 18:30:00	completed	0	unpaid	60.0	0.0	0.0	60.0		\N	Sagar Girinagar		9033555455	sa	t	INV2026033147000F	60.0	0.0	2026-03-31 15:06:25.669549	2026-03-31 15:06:43.698276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	60.0	\N	\N	f	admin
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.categories (id, name, description, image, status, display_order, created_at, updated_at, image_backup_url) FROM stdin;
2	Groceries	Groceries	\N	t	0	2026-03-01 10:18:08.409457	2026-03-01 10:18:08.409457	/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6NCwicHVyIjoiYmxvYl9pZCJ9fQ==--82dc145056abd2d1d37d608ac4a0927562fbe847/personal-care.png
3	Cosmetics	Cosmetics	\N	t	3	2026-03-01 10:18:41.192157	2026-03-01 10:18:41.192157	\N
6	Gou Product		\N	t	0	2026-03-01 10:52:29.951082	2026-03-03 11:29:51.771159	/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MTEsInB1ciI6ImJsb2JfaWQifX0=--67f17167ea51d1d6c2ce0005d039bb1540b7b51d/nuts.png
4	Cold Pressed Oil	Oils	\N	t	3	2026-03-01 10:18:59.604057	2026-03-03 11:31:01.78999	/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MTAsInB1ciI6ImJsb2JfaWQifX0=--e5cb085e4088ac10db16990d38111bc32ad5cd4c/snacks.jpg
1	Desi Cow Milk Products	 Desi Milk Products\r\n	\N	t	7	2026-02-27 00:42:16.842571	2026-03-03 11:32:43.774052	/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MjUsInB1ciI6ImJsb2JfaWQifX0=--a965372284f5aa62a078442d3436c7771aa795f4/Screenshot%20from%202026-02-07%2007-40-01.png
7	Ayurvedic Prodects		\N	t	0	2026-03-03 11:34:10.29731	2026-03-03 11:34:10.29731	/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MTIsInB1ciI6ImJsb2JfaWQifX0=--bf7f225fee5760df2648da37e74bd0037c780a68/whole%20grain.jpg
8	Organic Fruits		\N	t	0	2026-03-03 11:35:06.115276	2026-03-03 11:35:06.115276	\N
9	Organic Vegitables		\N	t	0	2026-03-03 11:36:51.96302	2026-03-03 11:36:51.96302	\N
5	Home Made Masala		\N	t	10	2026-03-01 10:48:06.28617	2026-03-04 08:33:13.391565	/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6OSwicHVyIjoiYmxvYl9pZCJ9fQ==--3e40f33905c87d7f0fedf251c017d6edeadcf10f/spices.png
10	Goumata Craft works		\N	t	0	2026-03-04 08:34:54.205308	2026-03-04 08:34:54.205308	\N
11	Oils	Healthy Low fat Oils	\N	t	0	2026-03-14 08:59:17.435772	2026-03-14 08:59:17.435772	\N
12	Beverages	Organic Beverages category includes a wide range of natural and chemical-free drinks made from organically grown ingredients.\r\nThese beverages are produced without the use of synthetic pesticides, fertilizers, or artificial additives.\r\nOrganic drinks help support a healthy lifestyle by providing natural nutrition and better taste.\r\nThe category includes fresh juices, herbal drinks, plant-based milk, natural health mixes, and traditional beverages.\r\nAll products are sourced from trusted organic farms that follow sustainable farming practices.\r\nOrganic beverages are free from preservatives, artificial colors, and harmful chemicals.\r\nThey are suitable for daily consumption by children, adults, and elderly people.\r\nMany of these drinks are rich in vitamins, minerals, and antioxidants that improve immunity.\r\nCold-pressed juices in this category retain maximum nutrients and natural flavor.\r\nHerbal drinks help in digestion, detoxification, and overall wellness.\r\nPlant-based beverages such as almond milk and coconut milk are good alternatives to dairy.\r\nTraditional health drinks made from millets and grains provide long-lasting energy.\r\nOrganic beverages are carefully packed to maintain freshness and quality.\r\nAll items are tested to ensure safety and purity before delivery.\r\nThese drinks are ideal for people who prefer natural and eco-friendly food products.\r\nRegular use of organic beverages can support better metabolism and overall health.\r\nThe category also includes seasonal and festival special drinks prepared naturally.\r\nProducts are available in different sizes for daily use and family consumption.\r\nOur organic beverages are selected to give the best balance of taste and nutrition.\r\nChoose from this category to enjoy healthy, refreshing, and naturally prepared drinks every day.\r\n	\N	t	0	2026-03-14 09:00:54.970407	2026-03-14 09:00:54.970407	/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MTUsInB1ciI6ImJsb2JfaWQifX0=--7924a1d2f51547fc8e0255ca8e95bac974ef3fb4/rice.png
13	Health Care	Health Care Products	\N	t	0	2026-03-14 09:01:35.532671	2026-03-14 09:01:35.532671	/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MTYsInB1ciI6ImJsb2JfaWQifX0=--a90217915751dc7fcca4e3fe78f24dc27301e20c/vegetables.png
14	Personal Care	Personal Care Products	\N	t	0	2026-03-14 09:02:00.286592	2026-03-14 09:02:00.286592	\N
15	Rice	Rice grains	\N	t	0	2026-03-14 09:02:31.1519	2026-03-14 09:02:31.1519	\N
16	Dry Fruits	Dry Fruits	\N	t	0	2026-03-14 09:03:06.388421	2026-03-14 09:03:06.388421	\N
17	Millets	Millets	\N	t	0	2026-03-14 09:03:26.11331	2026-03-14 09:03:26.11331	\N
18	Chutney Powders	Chutney Powder	\N	t	0	2026-03-14 09:04:57.534705	2026-03-14 09:04:57.534705	\N
19	Dairy	Dairy products	\N	t	0	2026-03-20 02:25:57.923249	2026-03-20 02:25:57.923249	\N
20	Snacks	Snack items	\N	t	0	2026-03-20 02:26:01.064642	2026-03-20 02:26:01.064642	\N
\.


--
-- Data for Name: client_requests; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.client_requests (id, title, description, status, priority, customer_id, created_at, updated_at, stage, stage_updated_at, stage_history, assignee_id, department, estimated_resolution_time, actual_resolution_time, name, email, phone_number, ticket_number, admin_response, resolved_by_id, submitted_at, resolved_at) FROM stdin;
1	Test Support Request	This is a test support request to verify the system is working correctly.	pending	medium	169	2026-03-04 15:14:05.428455	2026-03-04 15:14:05.428455	new	2026-03-04 15:14:05.428104	\N	\N	technical	\N	\N	\N	\N	\N	TKT-20260304-0001	\N	\N	2026-03-04 15:14:04.825535	\N
2	Unable to place order	I am having trouble placing an order on the website. The cart page keeps showing an error message.	pending	high	169	2026-03-04 15:14:59.590771	2026-03-04 15:14:59.590771	new	2026-03-04 15:14:59.5897	\N	\N	technical	\N	\N	\N	\N	\N	TKT-20260304-0002	\N	\N	2026-03-04 15:14:59.297817	\N
3	Test Support Request	This is a test support request to verify the functionality	pending	medium	169	2026-03-05 14:29:13.088291	2026-03-05 14:29:13.088291	new	2026-03-05 14:29:13.088037	\N	\N	technical	\N	\N	Divya Shree	\N	9902109170	TKT-20260305-0001	\N	\N	2026-03-05 14:29:12.535972	\N
\.


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.coupons (id, code, description, discount_type, discount_value, minimum_amount, maximum_discount, usage_limit, used_count, valid_from, valid_until, status, applicable_products, applicable_categories, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: customer_addresses; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.customer_addresses (id, customer_id, name, mobile, address_type, address, landmark, city, state, pincode, latitude, longitude, is_default, created_at, updated_at) FROM stdin;
1	169	Divya Shree	9902109170	home	123 Test Street	Near Test Market	Test City	Test State	123456	\N	\N	t	2026-03-04 12:18:13.60283	2026-03-04 12:18:13.60283
\.


--
-- Data for Name: customer_formats; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.customer_formats (id, customer_id, pattern, quantity, product_id, delivery_person_id, status, created_at, updated_at, days) FROM stdin;
21	169	every_day	0.5	2	7	active	2026-02-28 00:14:46.534318	2026-02-28 00:14:46.534318	\N
22	170	every_day	0.5	2	7	active	2026-02-28 00:15:01.543885	2026-02-28 00:15:01.543885	\N
23	171	every_day	0.5	2	7	active	2026-02-28 00:16:00.403018	2026-02-28 00:16:00.403018	\N
24	172	every_day	1.0	2	7	active	2026-02-28 00:16:16.095567	2026-02-28 00:16:16.095567	\N
25	173	every_day	1.0	2	7	active	2026-02-28 00:16:33.810063	2026-02-28 00:16:33.810063	\N
26	174	every_day	1.0	2	7	active	2026-02-28 00:16:51.842345	2026-02-28 00:16:51.842345	\N
27	175	every_day	0.5	2	7	active	2026-02-28 00:17:08.646204	2026-02-28 00:17:08.646204	\N
28	176	every_day	1.0	2	7	active	2026-02-28 00:17:26.988847	2026-02-28 00:17:26.988847	\N
29	177	every_day	0.5	2	7	active	2026-02-28 00:17:44.717025	2026-02-28 00:17:44.717025	\N
30	178	every_day	1.5	2	7	active	2026-02-28 00:17:58.461959	2026-02-28 00:17:58.461959	\N
\.


--
-- Data for Name: customer_wallets; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.customer_wallets (id, customer_id, balance, status, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.customers (id, first_name, last_name, email, mobile, created_at, updated_at, longitude, latitude, whatsapp_number, auto_generated_password, location_obtained_at, location_accuracy, password_digest, middle_name, address, birth_date, gender, marital_status, pan_no, gst_no, company_name, occupation, annual_income, emergency_contact_name, emergency_contact_number, blood_group, nationality, preferred_language, notes, status, is_registered_by_mobile) FROM stdin;
169	Divya	Shree	\N	9902109170	2026-02-28 00:14:17.604893	2026-02-28 00:14:17.604893	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
170	Malar	Selvi	\N	6364612600	2026-02-28 00:14:47.933562	2026-02-28 00:14:47.933562	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
171	Vani	Hegde 405	\N	9448556554	2026-02-28 00:15:03.075939	2026-02-28 00:15:03.075939	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
172	Dr	NarsimhaMurty	\N	9739257459	2026-02-28 00:16:02.271898	2026-02-28 00:16:02.271898	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
173	Vittal	Prasad 007	\N	9060555868	2026-02-28 00:16:17.359758	2026-02-28 00:16:17.359758	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
174	Ganesh	Desai 004	\N	9845216091	2026-02-28 00:16:35.280342	2026-02-28 00:16:35.280342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
175	Ravi	Ulalla	\N	9945518570	2026-02-28 00:16:53.275698	2026-02-28 00:16:53.275698	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
176	Lingaraju		\N	9449503063	2026-02-28 00:17:10.181963	2026-02-28 00:17:10.181963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
177	Srinivas		\N	9845327469	2026-02-28 00:17:28.519255	2026-02-28 00:17:28.519255	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
178	Purnanand	ji	\N	8217285696	2026-02-28 00:17:45.959333	2026-02-28 00:17:45.959333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
214	Malhar	M 11	\N	7259800264	2026-02-28 00:29:53.662634	2026-02-28 00:29:53.662634	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
215	Divya	Malhar E13	\N	8861977333	2026-02-28 00:30:12.330086	2026-02-28 00:30:12.330086	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
216	Anand	KVV	\N	9036807044	2026-02-28 00:30:30.327221	2026-02-28 00:30:30.327221	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
217	Gym		\N	8050313274	2026-02-28 00:30:48.03761	2026-02-28 00:30:48.03761	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
218	Srikanth		\N	9686833238	2026-02-28 00:31:02.581366	2026-02-28 00:31:02.581366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
219	Shyila	KRS B803	\N	9538601439	2026-02-28 00:31:16.926608	2026-02-28 00:31:16.926608	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
220	KRS	B602	\N	9162216402	2026-02-28 00:31:34.62815	2026-02-28 00:31:34.62815	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
221	KRS	Near	\N	9986743585	2026-02-28 00:31:50.660496	2026-02-28 00:31:50.660496	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
222	Vidya	Yoga	\N	9448428806	2026-02-28 00:32:13.775741	2026-02-28 00:32:13.775741	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
223	Swapna	Yoga	\N	9741033553	2026-02-28 00:32:30.338471	2026-02-28 00:32:30.338471	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
224	Tejaswini		\N	9480116151	2026-02-28 00:32:48.360408	2026-02-28 00:32:48.360408	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
225	Anand	kengunte	\N	9008820530	2026-02-28 00:33:04.745608	2026-02-28 00:33:04.745608	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
226	Swarupa		\N	9986866025	2026-02-28 00:33:21.642985	2026-02-28 00:33:21.642985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
227	Balnath	sir Cusin	\N	9019602646	2026-02-28 00:33:42.976622	2026-02-28 00:33:42.976622	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
228	Vajreshwari	Theter	\N	9845923342	2026-02-28 00:33:59.126008	2026-02-28 00:33:59.126008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
229	Madhavi		\N	9844145993	2026-02-28 00:53:48.304093	2026-02-28 00:53:48.304093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
230	Latha	Kalyan Nagar	\N	7892292123	2026-02-28 00:54:05.712766	2026-02-28 00:54:05.712766	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
231	Purushotham	Agarbathi	\N	8095336993	2026-02-28 00:54:24.871166	2026-02-28 00:54:24.871166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
232	Vasanth	Andrawala	\N	8074690068	2026-02-28 00:54:46.975596	2026-02-28 00:54:46.975596	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
233	Chandranath		\N	9482534103	2026-02-28 00:55:07.864763	2026-02-28 00:55:07.864763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
234	Praveena	GKW	\N	9886116818	2026-02-28 00:55:27.118049	2026-02-28 00:55:27.118049	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
235	Venu	Madhava Praveena next	\N	8050974531	2026-02-28 00:55:46.779211	2026-02-28 00:55:46.779211	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
236	Raghav	GKW	\N	8123182524	2026-02-28 00:56:07.667578	2026-02-28 00:56:07.667578	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
237	Sudakar	gkw layout	\N	9686701372	2026-02-28 00:56:28.476378	2026-02-28 00:56:28.476378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
238	Sudakar	gkw Next	\N	9480577653	2026-02-28 00:56:48.338495	2026-02-28 00:56:48.338495	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
239	Chetan	GKW	\N	9535612383	2026-02-28 00:57:09.717327	2026-02-28 00:57:09.717327	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
240	Madhu	Gkw layout	\N	9353804045	2026-02-28 00:57:30.813589	2026-02-28 00:57:30.813589	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
241	Rajkumar	GKW	\N	9844114335	2026-02-28 00:58:11.155631	2026-02-28 00:58:11.155631	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
242	Asha		\N	9902436158	2026-02-28 00:58:29.382633	2026-02-28 00:58:29.382633	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
243	B4	Prashanth Katti	\N	9880143210	2026-02-28 00:58:51.074862	2026-02-28 00:58:51.074862	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
244	Sheetal	Bedi	\N	8431417773	2026-02-28 00:59:10.750967	2026-02-28 00:59:10.750967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
245	Arun	kumar Rss	\N	9880083260	2026-02-28 00:59:33.485813	2026-02-28 00:59:33.485813	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
246	Santhosh	Kadkal	\N	9742019746	2026-02-28 00:59:52.941462	2026-02-28 00:59:52.941462	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
247	Shivu	Bajrangdala	\N	9900000123	2026-02-28 01:00:14.340047	2026-02-28 01:00:14.340047	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
248	Sandya	Vijaynagar	\N	9741390005	2026-02-28 01:00:34.513143	2026-02-28 01:00:34.513143	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
249	Sharmila	Vijaynagar	\N	9482219168	2026-02-28 01:00:55.86967	2026-02-28 01:00:55.86967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
250	Ajmad		\N	9980813277	2026-02-28 01:01:16.086728	2026-02-28 01:01:16.086728	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
251	Srihari	Rss	\N	9886040520	2026-02-28 01:01:35.951772	2026-02-28 01:01:35.951772	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
252	Amulya		\N	9900080045	2026-02-28 01:01:55.429536	2026-02-28 01:01:55.429536	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
253	Sujatha	Vijaynagar	\N	9900511940	2026-02-28 01:02:16.922188	2026-02-28 01:02:16.922188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
254	Poornima		\N	8050532809	2026-02-28 01:02:37.802154	2026-02-28 01:02:37.802154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
256	Harshitha	Govindrajnagar	\N	9035065126	2026-02-28 01:03:16.417074	2026-02-28 01:03:16.417074	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
257	Padmini	Madam	\N	8310919899	2026-02-28 01:03:39.721664	2026-02-28 01:03:39.721664	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
258	Rekha		\N	9880936465	2026-02-28 01:04:01.310924	2026-02-28 01:04:01.310924	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
259	Pushpha	B Nagar	\N	9845059228	2026-02-28 01:04:21.838802	2026-02-28 01:04:21.838802	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
260	Lekha		\N	9980761070	2026-02-28 01:04:41.498162	2026-02-28 01:04:41.498162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
261	Sridhar	Sogadu	\N	9845567783	2026-02-28 01:05:03.802371	2026-02-28 01:05:03.802371	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
262	Manjula		\N	7411467312	2026-02-28 01:05:26.965444	2026-02-28 01:05:26.965444	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
263	Mamatha	Bhat	\N	8897610761	2026-02-28 01:05:46.624293	2026-02-28 01:05:46.624293	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
264	Chandu	Florence	\N	9741195837	2026-02-28 01:06:07.721153	2026-02-28 01:06:07.721153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
265	bharath	bushan	\N	7760637860	2026-02-28 01:06:27.790756	2026-02-28 01:06:27.790756	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
266	Virupaksh	Advacate	\N	9845720212	2026-02-28 01:06:49.499196	2026-02-28 01:06:49.499196	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
267	T	R Kamakshi	\N	9900710721	2026-02-28 01:07:09.774305	2026-02-28 01:07:09.774305	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
268	Murali		\N	9945939905	2026-02-28 01:07:30.252721	2026-02-28 01:07:30.252721	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
269	Pajwal	k Palya	\N	9980037780	2026-02-28 01:07:51.961585	2026-02-28 01:07:51.961585	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
270	Mohan	Prasad Kaveripura	\N	9739413261	2026-02-28 01:08:11.422622	2026-02-28 01:08:11.422622	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
271	Caveripura		\N	9164241313	2026-02-28 01:08:31.077732	2026-02-28 01:08:31.077732	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
272	Bharath	Belavadgi	\N	9986151008	2026-02-28 01:08:51.579351	2026-02-28 01:08:51.579351	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
273	Vishwanath	kumar	\N	9538065504	2026-02-28 07:40:51.951321	2026-02-28 07:40:51.951321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
274	Kiran	Chandra Layout	\N	9845291199	2026-02-28 07:41:10.889408	2026-02-28 07:41:10.889408	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
275	Abhilash	Dangi	\N	7019031899	2026-02-28 07:41:31.413167	2026-02-28 07:41:31.413167	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
276	Nanjundaswamy		\N	9880671871	2026-02-28 07:41:51.057189	2026-02-28 07:41:51.057189	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
277	J	Murthi	\N	9448057402	2026-02-28 07:42:09.844036	2026-02-28 07:42:09.844036	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
278	Chandan		\N	9632347817	2026-02-28 07:42:27.662542	2026-02-28 07:42:27.662542	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
279	Sridhar	Reddy	\N	9845013089	2026-02-28 07:42:47.826755	2026-02-28 07:42:47.826755	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
280	APS	Sridhar Reddy	\N	9845253244	2026-02-28 07:43:06.643439	2026-02-28 07:43:06.643439	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
281	Lakshmi	HEF	\N	7353768932	2026-02-28 07:43:28.366826	2026-02-28 07:43:28.366826	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
282	Deepa	Venugopal	\N	9538932120	2026-02-28 07:43:50.687811	2026-02-28 07:43:50.687811	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
283	Vinutha	R R Nagar	\N	9916130884	2026-02-28 07:44:12.600741	2026-02-28 07:44:12.600741	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
284	Shamala	Vishwanath Bootha Bunglow	\N	9945078045	2026-02-28 07:44:30.098306	2026-02-28 07:44:30.098306	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
285	Nithu	Milk c	\N	6362656429	2026-02-28 07:44:49.007309	2026-02-28 07:44:49.007309	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
286	Shwetha	Utthrahalli	\N	9591072072	2026-02-28 07:45:07.401828	2026-02-28 07:45:07.401828	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
287	Sathish	Rotary	\N	9845155492	2026-02-28 07:45:27.509159	2026-02-28 07:45:27.509159	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
288	Jagirdar		\N	9341227341	2026-02-28 07:45:50.54332	2026-02-28 07:45:50.54332	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
289	Jagirdar	next	\N	9243493391	2026-02-28 07:46:10.767773	2026-02-28 07:46:10.767773	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
290	Shridhar	N.R Colony	\N	8050079768	2026-02-28 07:46:29.372365	2026-02-28 07:46:29.372365	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
291	Raju	Belagavi	\N	9986572038	2026-02-28 07:46:52.344053	2026-02-28 07:46:52.344053	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
292	Chamarajpete		\N	9008053209	2026-02-28 07:47:12.879192	2026-02-28 07:47:12.879192	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
294	Kumar	Srinivas nagar	\N	9740344800	2026-02-28 07:47:58.375155	2026-02-28 07:47:58.375155	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
295	New		\N	8217671774	2026-02-28 07:48:18.780798	2026-02-28 07:48:18.780798	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
296	Jayram	Girinagar	\N	9880704373	2026-02-28 07:48:39.956029	2026-02-28 07:48:39.956029	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
297	Shrutha	Keerthi	\N	8971947111	2026-02-28 07:49:01.66588	2026-02-28 07:49:01.66588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
298	Srinivas	Girinagar	\N	7019223678	2026-02-28 07:49:23.57005	2026-02-28 07:49:23.57005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
299	Dr	Latha Shankar	\N	9448983383	2026-02-28 07:49:45.010924	2026-02-28 07:49:45.010924	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
300	Shruthi	Keerthana friend	\N	8496099150	2026-02-28 07:50:03.689153	2026-02-28 07:50:03.689153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
301	Jayaprakash	Rotry	\N	9972341661	2026-02-28 07:50:23.460325	2026-02-28 07:50:23.460325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
302	Keerthana		\N	9980802625	2026-02-28 07:50:46.069931	2026-02-28 07:50:46.069931	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
303	PES	Clg	\N	9448313566	2026-02-28 07:51:07.452791	2026-02-28 07:51:07.452791	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
304	Sagar	Girinagar	\N	9033555455	2026-02-28 07:51:28.760743	2026-02-28 07:51:28.760743	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
305	Nandini		\N	7829434946	2026-02-28 07:51:53.438068	2026-02-28 07:51:53.438068	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
306	Nithu	Milk c	\N	9738354908	2026-02-28 07:52:16.169765	2026-02-28 07:52:16.169765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
307	Aditi	Ambedkar clg	\N	9632050568	2026-02-28 08:57:12.712567	2026-02-28 08:57:12.712567	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
308	Ashwini	Mam Ngef	\N	8050235722	2026-02-28 08:57:45.884508	2026-02-28 08:57:45.884508	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
309	Dr	Ragesh	\N	9886081312	2026-02-28 09:00:01.505493	2026-02-28 09:00:01.505493	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
310	N	A Karkal	\N	9980409394	2026-02-28 09:00:40.294536	2026-02-28 09:00:40.294536	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
311	AJ	NGE Layout	\N	9844793670	2026-02-28 09:02:21.649536	2026-02-28 09:02:21.649536	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
312	Balakrishnan		\N	9900192221	2026-02-28 09:03:07.942144	2026-02-28 09:03:07.942144	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
313	Paresh	Naindhalli 23	\N	9900115511	2026-02-28 09:03:53.510224	2026-02-28 09:03:53.510224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
314	Paresh	Naindhalli 1702	\N	9035430359	2026-02-28 09:05:31.716836	2026-02-28 09:05:31.716836	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
315	Pooja	mam Birla 1109	\N	7975869481	2026-02-28 09:06:14.746546	2026-02-28 09:06:14.746546	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
316	T4	604	\N	9148051908	2026-02-28 09:07:31.087589	2026-02-28 09:07:31.087589	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
317	T4	601 Mohith Agarwal	\N	8892019525	2026-02-28 09:08:12.489847	2026-02-28 09:08:12.489847	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
318	T7	901	\N	8820021325	2026-02-28 09:08:51.464917	2026-02-28 09:08:51.464917	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
319	T3	1001 Shalini Anand	\N	7004249122	2026-02-28 09:09:09.954739	2026-02-28 09:09:09.954739	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
320	Deepika	Jain Sathva Melody	\N	9686879023	2026-02-28 09:09:27.037354	2026-02-28 09:09:27.037354	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
321	Sathva	Melody 1201	\N	8209488393	2026-02-28 09:09:43.0944	2026-02-28 09:09:43.0944	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
322	Vani	R R Nagar	\N	9739125609	2026-02-28 09:09:58.611993	2026-02-28 09:09:58.611993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
323	Smitha	Vani sis	\N	9986241741	2026-02-28 09:10:13.891602	2026-02-28 09:10:13.891602	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
324	Anand	Bavikati	\N	9481744637	2026-02-28 09:10:31.49436	2026-02-28 09:10:31.49436	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
325	Kamadhenu	Steel B 308	\N	9620368553	2026-02-28 09:10:51.508036	2026-02-28 09:10:51.508036	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
326	Kamadhenu	Steel C 001	\N	9986656582	2026-02-28 09:11:10.03071	2026-02-28 09:11:10.03071	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
327	Raj	Saran	\N	9986656729	2026-02-28 09:11:24.586092	2026-02-28 09:11:24.586092	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
328	R	R Nagar BBMP	\N	8884052990	2026-02-28 09:11:39.046475	2026-02-28 09:11:39.046475	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
329	Wadeyar	R R Nagar	\N	6366460664	2026-02-28 09:11:53.990361	2026-02-28 09:11:53.990361	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
330	New	RR	\N	9880688989	2026-02-28 09:12:11.417421	2026-02-28 09:12:11.417421	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
331	Police	R R Nagar	\N	9916924100	2026-02-28 09:12:30.885511	2026-02-28 09:12:30.885511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
332	Appu	Sir SFV - 3053	\N	9845666955	2026-02-28 09:12:52.367753	2026-02-28 09:12:52.367753	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
333	Shruthi	K SFV - 4175	\N	9972301846	2026-02-28 09:13:17.765021	2026-02-28 09:13:17.765021	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
334	SFV	- 7065	\N	9731803083	2026-02-28 09:13:38.962729	2026-02-28 09:13:38.962729	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
293	Madhuaudhan	Rao	\N	9980377456	2026-02-28 07:47:34.41242	2026-03-06 03:06:00.952582	\N	\N		\N	\N	\N	\N			\N							\N				Indian			t	\N
335	Sridevi	Kagalipura	\N	9880594910	2026-02-28 09:14:01.054466	2026-02-28 09:14:01.054466	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
336	Akhila	RR Nagar	\N	9449856754	2026-02-28 09:14:23.3794	2026-02-28 09:14:23.3794	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
337	Prasana	ji RSS	\N	7975263543	2026-02-28 09:14:44.885749	2026-02-28 09:14:44.885749	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
338	Chandrashekhr	Prasana ji	\N	9448412813	2026-02-28 09:15:04.145367	2026-02-28 09:15:04.145367	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
339	Sachidanand	ji 499	\N	9986487635	2026-02-28 09:25:19.364247	2026-02-28 09:25:19.364247	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
340	Bharani	# 79	\N	9066868549	2026-02-28 09:25:45.283836	2026-02-28 09:25:45.283836	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
341	Chandrashekar	Alternet	\N	9972871912	2026-02-28 09:26:01.161447	2026-02-28 09:26:01.161447	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
342	Shruthi	Kamal Mahal	\N	9449940166	2026-02-28 09:26:15.994192	2026-02-28 09:26:15.994192	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
343	Guru	Dath	\N	9945313404	2026-02-28 09:26:31.764957	2026-02-28 09:26:31.764957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
344	Anupama		\N	9986730740	2026-02-28 09:26:48.668765	2026-02-28 09:26:48.668765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
345	Nagendar	Bande maramma	\N	9342308808	2026-02-28 09:27:03.609042	2026-02-28 09:27:03.609042	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
346	Vilasa		\N	9886526617	2026-02-28 09:27:18.659959	2026-02-28 09:27:18.659959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
347	Chiru	Mane	\N	9964029888	2026-02-28 09:27:35.144825	2026-02-28 09:27:35.144825	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
348	Shailaja		\N	9901374980	2026-02-28 09:27:50.813981	2026-02-28 09:27:50.813981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
349	Ram	Pavan	\N	9980815190	2026-02-28 09:28:07.40063	2026-02-28 09:28:07.40063	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
350	Asha	Murthy 1st Floor BDA	\N	9964465963	2026-02-28 09:28:22.755576	2026-02-28 09:28:22.755576	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
351	Gowtham	Malagala	\N	8940678502	2026-02-28 09:28:38.830087	2026-02-28 09:28:38.830087	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
352	Gowtham	Malagala pakka	\N	8722055975	2026-02-28 09:28:58.287914	2026-02-28 09:28:58.287914	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
353	Lakshmi	Malgala	\N	9900139237	2026-02-28 09:29:14.146053	2026-02-28 09:29:14.146053	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
354	Prakash	Malagala	\N	9845660695	2026-02-28 09:29:29.296048	2026-02-28 09:29:29.296048	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
355	Matha	Borwell	\N	9845058522	2026-02-28 09:29:44.137815	2026-02-28 09:29:44.137815	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
356	Govindraj		\N	9513113136	2026-02-28 09:30:00.234941	2026-02-28 09:30:00.234941	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
357	Marenhalli	Alternet	\N	8123133839	2026-02-28 09:30:16.832789	2026-02-28 09:30:16.832789	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
358	Lakshmi	Vijaynagar	\N	9972577136	2026-02-28 09:30:34.835761	2026-02-28 09:30:34.835761	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
359	kumar		\N	9449718781	2026-02-28 09:30:51.320408	2026-02-28 09:30:51.320408	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
361	B4	Kenchappa	\N	8073603153	2026-02-28 09:31:25.086824	2026-02-28 09:31:25.086824	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
362	Asha	M V	\N	9972599180	2026-02-28 09:31:43.253506	2026-02-28 09:31:43.253506	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
363	Mukesh	Chikpet	\N	8880816888	2026-02-28 09:31:58.801282	2026-02-28 09:31:58.801282	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
364	Babu	Chikpet	\N	9738622286	2026-02-28 09:32:14.770154	2026-02-28 09:32:14.770154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
365	Vimala	Silai	\N	9845865085	2026-02-28 09:32:30.041319	2026-02-28 09:32:30.041319	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
366	Ankitha	Jain	\N	8317440442	2026-02-28 09:32:45.35488	2026-02-28 09:32:45.35488	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
367	DR	K S Murali	\N	9449597286	2026-02-28 09:33:30.817478	2026-02-28 09:33:30.817478	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
368	Raheja		\N	9645236148	2026-02-28 09:33:56.43739	2026-02-28 09:33:56.43739	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
369	Lingraj	Samparka	\N	9845747937	2026-02-28 09:34:27.023175	2026-02-28 09:34:27.023175	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
370	Dr	Jagdish sir	\N	8152052027	2026-02-28 09:34:45.458504	2026-02-28 09:34:45.458504	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
371	New	Sai Ganesh	\N	7975278919	2026-02-28 09:35:06.414359	2026-02-28 09:35:06.414359	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
372	PSI	Chandrsheka	\N	9986195032	2026-02-28 09:40:09.313869	2026-02-28 09:40:09.313869	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
373	Manoj	Nakshathra	\N	9886550389	2026-02-28 09:40:55.616078	2026-02-28 09:40:55.616078	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
374	Manjunath	Srigandha app	\N	9880290485	2026-02-28 09:41:28.732255	2026-02-28 09:41:28.732255	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
375	Mitesh	F7	\N	9611111079	2026-02-28 09:41:59.393689	2026-02-28 09:41:59.393689	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
376	Bindu		\N	9845399524	2026-02-28 09:42:42.1993	2026-02-28 09:42:42.1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
377	Kamal	Mahal sis	\N	6360948345	2026-02-28 09:43:35.405866	2026-02-28 09:43:35.405866	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
378	Ashok	Annapurneshwari Nagar	\N	7019330447	2026-02-28 09:44:50.83875	2026-02-28 09:44:50.83875	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
379	Narendrababu	10th Cross	\N	9164674175	2026-02-28 09:45:20.994282	2026-02-28 09:45:20.994282	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
380	Balnath		\N	9900117393	2026-02-28 09:45:39.69564	2026-02-28 09:45:39.69564	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
381	Manjula	mam	\N	9513266665	2026-02-28 09:45:58.414267	2026-02-28 09:45:58.414267	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
382	Ramesh	6TH Cross	\N	9900565106	2026-02-28 09:46:15.488849	2026-02-28 09:46:15.488849	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
383	Boregowda		\N	9448241151	2026-02-28 09:46:32.176317	2026-02-28 09:46:32.176317	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
384	Sambramma		\N	9036450918	2026-02-28 09:46:52.438274	2026-02-28 09:46:52.438274	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
385	Hanumanthe	Gowda New	\N	9980174422	2026-02-28 09:47:10.271957	2026-02-28 09:47:10.271957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
386	Kaushik		\N	9686800342	2026-02-28 09:47:59.232229	2026-02-28 09:47:59.232229	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
387	Kamla	Nagar	\N	9743323451	2026-02-28 09:48:47.124512	2026-02-28 09:48:47.124512	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
388	Cardinal	101	\N	8220378276	2026-02-28 09:49:02.701075	2026-02-28 09:49:02.701075	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
389	Dr	Chaya	\N	9945028319	2026-02-28 09:49:21.711514	2026-02-28 09:49:21.711514	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
390	Leela	Karatagi	\N	9480947665	2026-02-28 09:49:40.117218	2026-02-28 09:49:40.117218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
391	Prashanth	Hegade	\N	9483206627	2026-02-28 09:50:00.145243	2026-02-28 09:50:00.145243	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
392	Dr	Shwetha	\N	9972518220	2026-02-28 09:50:21.240467	2026-02-28 09:50:21.240467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
393	Mahaesh	Rajajinagar	\N	9845597155	2026-02-28 09:50:42.068297	2026-02-28 09:50:42.068297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
394	Nagaveni		\N	9945333648	2026-02-28 09:51:01.079051	2026-02-28 09:51:01.079051	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
395	Sunil	Valapurye 806	\N	9448876726	2026-02-28 09:51:20.526177	2026-02-28 09:51:20.526177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
396	Mantri	105	\N	9439729388	2026-02-28 09:51:40.936154	2026-02-28 09:51:40.936154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
397	Sreedevi	Kuvempu Metro	\N	9980403848	2026-02-28 09:52:02.711921	2026-02-28 09:52:02.711921	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
398	P	Sagar	\N	9740006707	2026-02-28 09:52:24.681912	2026-02-28 09:52:24.681912	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
399	Villa	51	\N	9742336665	2026-02-28 09:55:10.503047	2026-02-28 09:55:10.503047	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
400	Ram	Mohan	\N	9902346087	2026-02-28 09:55:36.708027	2026-02-28 09:55:36.708027	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
402	Vijay	B.N	\N	9740189689	2026-02-28 09:56:34.176694	2026-02-28 09:56:34.176694	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
404	Madhura		\N	8861418752	2026-02-28 09:58:00.55265	2026-02-28 09:58:00.55265	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
406	Tippeswamy		\N	8390750828	2026-02-28 09:58:41.829122	2026-02-28 09:58:41.829122	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
407	Eshwar		\N	9448913603	2026-02-28 09:59:13.106074	2026-02-28 09:59:13.106074	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
408	Sufiya	Banu	\N	7829055353	2026-02-28 09:59:39.882196	2026-02-28 09:59:39.882196	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
409	Mohan	kumar	\N	9741128522	2026-02-28 10:00:07.052088	2026-02-28 10:00:07.052088	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
410	Sachin	Satva	\N	8329013372	2026-02-28 10:00:39.3712	2026-02-28 10:00:39.3712	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
411	Siddhi	Sathva	\N	9923487637	2026-02-28 10:00:59.511449	2026-02-28 10:00:59.511449	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
412	Pratibha		\N	9483213366	2026-02-28 10:01:20.013453	2026-02-28 10:01:20.013453	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
414	Kumar		\N	9901470111	2026-02-28 10:02:01.567513	2026-02-28 10:02:01.567513	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
419	Gopalaya	Chanenhalli	\N	9845676800	2026-03-01 09:35:26.072999	2026-03-01 09:35:26.072999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
420	Rashi	Hemanth Sir	\N	9741354276	2026-03-01 09:35:37.994987	2026-03-01 09:35:37.994987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
421	Rashi	Near	\N	9886750694	2026-03-01 09:35:49.658589	2026-03-01 09:35:49.658589	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
422	Kanthraju		\N	9740368734	2026-03-01 09:36:00.868007	2026-03-01 09:36:00.868007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
423	Sudhindra		\N	9972666114	2026-03-01 09:36:12.22173	2026-03-01 09:36:12.22173	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
424	Namitha	Bhat	\N	9481451384	2026-03-01 09:36:23.439496	2026-03-01 09:36:23.439496	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
425	S	B Joshi	\N	9986022582	2026-03-01 09:36:34.796418	2026-03-01 09:36:34.796418	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
426	Madhusudan		\N	8050892669	2026-03-01 09:36:45.918847	2026-03-01 09:36:45.918847	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
427	Usha		\N	8073744479	2026-03-01 09:36:57.274555	2026-03-01 09:36:57.274555	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
428	Vinay	Gulbarga	\N	7892310626	2026-03-01 09:37:09.012229	2026-03-01 09:37:09.012229	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
429	Chandana		\N	9972662947	2026-03-01 09:37:20.286028	2026-03-01 09:37:20.286028	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
430	Shivananda		\N	9980019835	2026-03-01 09:37:31.559036	2026-03-01 09:37:31.559036	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
431	Prestige	4103	\N	9900069755	2026-03-01 09:37:42.685903	2026-03-01 09:37:42.685903	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
432	Prestige	2054	\N	9986131595	2026-03-01 09:37:57.229923	2026-03-01 09:37:57.229923	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
433	Prestige	1082	\N	9611955557	2026-03-01 09:38:08.697912	2026-03-01 09:38:08.697912	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
434	Prestige	1022	\N	9880380808	2026-03-01 09:38:20.307215	2026-03-01 09:38:20.307215	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
435	Prestige	2122	\N	9945008940	2026-03-01 09:38:31.559628	2026-03-01 09:38:31.559628	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
436	Srinivas	Syndicate	\N	9972444334	2026-03-01 10:15:44.638556	2026-03-01 10:15:44.638556	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
437	Krishna	Syndicate	\N	9980466855	2026-03-01 10:15:56.802801	2026-03-01 10:15:56.802801	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
438	EAF	Darshan	\N	9591671656	2026-03-01 10:16:08.885311	2026-03-01 10:16:08.885311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
439	DS	Max	\N	9844635988	2026-03-01 10:16:21.582053	2026-03-01 10:16:21.582053	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
440	Krishna	Prabhu	\N	9886571337	2026-03-01 10:16:33.976403	2026-03-01 10:16:33.976403	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
441	Bharath	Chandu	\N	9901234516	2026-03-01 10:16:46.20209	2026-03-01 10:16:46.20209	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
442	Uma	golrati	\N	6364099479	2026-03-01 10:16:58.625908	2026-03-01 10:16:58.625908	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
443	Pavithra		\N	8123400262	2026-03-01 10:17:10.635365	2026-03-01 10:17:10.635365	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
444	Chetan	Kadubgere	\N	9900260193	2026-03-01 10:17:22.986281	2026-03-01 10:17:22.986281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
445	Dr	Santhosh	\N	9535725499	2026-03-01 10:17:35.518905	2026-03-01 10:17:35.518905	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
446	Chandrakanth		\N	9731000699	2026-03-01 10:17:47.757385	2026-03-01 10:17:47.757385	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
447	Soni	Sharma	\N	9663289786	2026-03-01 10:18:00.304792	2026-03-01 10:18:00.304792	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
448	Vijaya	Bhat	\N	6363644187	2026-03-01 10:18:12.101462	2026-03-01 10:18:12.101462	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
449	Rajaji	Nagar	\N	9964512615	2026-03-01 10:18:24.491945	2026-03-01 10:18:24.491945	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
450	Chandru		\N	9902069554	2026-03-01 10:18:40.138129	2026-03-01 10:18:40.138129	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
451	Mohan		\N	9986816167	2026-03-01 10:18:59.721479	2026-03-01 10:18:59.721479	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
452	Umesh		\N	9481714865	2026-03-01 10:19:15.899523	2026-03-01 10:19:15.899523	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
453	Saraswathi		\N	9632249196	2026-03-01 10:19:28.356111	2026-03-01 10:19:28.356111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
454	Ashwini	Kengeri	\N	8861336000	2026-03-01 10:19:41.388673	2026-03-01 10:19:41.388673	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
455	Malhar	B30	\N	9945778660	2026-03-01 10:19:53.622831	2026-03-01 10:19:53.622831	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
456	Pavithra	Udbava	\N	8197398471	2026-03-01 10:20:05.709311	2026-03-01 10:20:05.709311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
457	Murthi		\N	7259033868	2026-03-01 10:20:18.343899	2026-03-01 10:20:18.343899	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
458	Shylesh		\N	9448350988	2026-03-01 10:20:30.864257	2026-03-01 10:20:30.864257	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
459	Navami	3001	\N	9035468680	2026-03-01 10:20:43.730242	2026-03-01 10:20:43.730242	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
460	Pavithra		\N	6363914936	2026-03-01 10:20:56.027913	2026-03-01 10:20:56.027913	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
461	Vasantha	Hoysala	\N	9880907450	2026-03-01 10:21:08.422494	2026-03-01 10:21:08.422494	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
462	Shashi 	Kiran	\N	8105839124	2026-03-03 06:58:17.301048	2026-03-03 06:58:17.301048	\N	\N	8105839124		\N	\N	$2a$12$Izl/yqaw5fDz4DH0wtPy4uOy.n7ScNLcXJF7xS0hCLgTiKye2trpC	\N		\N							\N				Indian			t	\N
465	Preethi	Mohan	\N	9663778293	2026-03-03 10:31:25.2624	2026-03-03 10:31:25.2624	\N	\N	9663778293		\N	\N	$2a$12$40h5vfRfJPu.Mn7fOKgznOQqGE0.r6NCs8wGjLN3IEQ2K7vBk35bG	\N		\N							\N				Indian			t	\N
466	Tahsildar	Vijay Nagar	\N	8431899981	2026-03-03 12:53:30.262764	2026-03-03 12:53:30.262764	\N	\N	8431899981		\N	\N	$2a$12$ue0u5e/SmK7vhm48mJTjQ.AlRBXDfD1Ka12Wqiwv9r4ZaIeBIY8mC	\N		\N							\N				Indian			t	\N
255	Prakash	G	\N	9448069883	2026-02-28 01:02:56.887188	2026-03-03 12:55:10.767619	\N	\N		\N	\N	\N	\N		Govindraj Nagar	\N							\N				Indian			t	\N
467	Madhavi 	Rajaji	\N	9986010770	2026-03-03 13:06:01.99856	2026-03-03 13:06:01.99856	\N	\N	9986010770		\N	\N	$2a$12$lvhKlHY9/blni1uN0XQNhepfaOLgJWUZCQmy7EC/Df5p6VH9caFQ2	\N	Rajaji Nagar	\N							\N				Indian			t	\N
468	Rajan	2052	\N	9890053382	2026-03-04 02:26:06.222794	2026-03-04 02:26:06.222794	\N	\N	9890053382		\N	\N	$2a$12$Z.gW9Jj2qgvN2dgUx5AP0us12r/Drk4NyYGpqSOcxf8uyduI.2xYS	\N		\N							\N				Indian			t	\N
469	Raju Test	Bahtd	9093939393fdsdfds@gmail.com	8737373737	2026-03-04 06:38:37.287503	2026-03-04 06:38:37.310948	77.54112590	12.93732410	8737373737	5gmVLWmd51@4	\N	\N	$2a$12$H0I6l5l5iPkN2jDcwLSLx.sQg0cTUkz1ThT75WbSkdAxuVXgMuQiK	\N	dffd	2026-02-10	male	single	BSRPB7676D	838383838383838	Prosperix	Teacher	-1000.0	43	+91 87373 73737		Indian	english	fdd	t	\N
470	Shobha	R	\N	9686963658	2026-03-04 08:45:23.984614	2026-03-04 08:45:23.984614	\N	\N	9686963658		\N	\N	$2a$12$oxb/atR2Tf.bqM92wixhD.aLVnMD4kk2uLfnWij5XmRQPQTceYb8W	\N		1989-12-31							\N				Indian			t	\N
472	Pramod 	A	\N	9632850872	2026-03-06 02:07:00.369427	2026-03-06 02:07:00.369427	\N	\N	9632850872		\N	\N	$2a$12$7uyN1Q1b0/PEwcRujqeCNOpPTooui6k4rWJiMlgfjuBEGCSm7HXL2	\N		\N							\N				Indian			t	\N
360	Bhavana	Vijaynagar	\N	7829935427	2026-02-28 09:31:08.714554	2026-03-06 03:19:43.342872	\N	\N		\N	\N	\N	\N			\N							\N				Indian			t	\N
474	Raghu	Kt	raghubit040@gmail.com	9844070041	2026-03-07 13:37:55.361062	2026-03-07 13:37:55.361062	\N	\N	\N	\N	\N	\N	$2a$12$bS9AlFyX7tTlohGmI7vvpOsPNhV.P354KwQulOswqN5oJnaWQVl66	\N	Ramamurthy Nagar 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
475	John	Doe	john.doe@example.com	9876543210	2026-03-08 00:35:50.364301	2026-03-08 00:35:50.364301	72.87770000	19.07600000	9876543210	JOHN@2026	\N	\N	$2a$12$uvEe5g4EDj0hgGP9emGTZOIIZ7l7NC.ZBLEHUJDKhnR/qg.CHs1sy	Kumar	123 Main Street, Mumbai, Maharashtra, 400001	1990-01-15	male	married	ABCDE1234F	GSTIN1234567890	ABC Private Limited	Software Engineer	1200000.0	Jane Doe	9876543211	A+	Indian	English	VIP Customer	t	\N
476	Priya	Sharma	priya.sharma@example.com	9876543211	2026-03-08 00:35:52.552147	2026-03-08 00:35:52.552147	77.20900000	28.61390000	9876543211	PRIY@2026	\N	\N	$2a$12$F5dqNTAHoUVHBrtcOCYbKe1b4iy4Daj5WdSLuAz2eDZ9r7ZP2fg/.	\N	456 Park Avenue, Delhi, 110001	1988-05-20	female	single	FGHIJ5678K	\N	\N	Doctor	800000.0	Raj Sharma	9876543212	B+	Indian	Hindi	Regular Customer	t	\N
477	Rohan	Shetty	r.shetty@gmail.com	8899889900	2026-03-13 14:56:22.129386	2026-03-13 14:56:22.237142	77.55743369	12.91418426	8899889900		\N	\N	$2a$12$/zTkYZFFEQGEledej/..4.GXfgzZSsRuwY5vaTTuIRBt95JM7IPd2	\N	#4th Main, 10th Cross, R K Layout, Padmanabha Nagar - 560070	2000-01-13	male	married					\N				Indian			t	\N
\.


--
-- Data for Name: delivery_people; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.delivery_people (id, first_name, last_name, email, mobile, vehicle_type, vehicle_number, license_number, address, city, state, pincode, emergency_contact_name, emergency_contact_mobile, joining_date, salary, status, profile_picture, bank_name, account_no, ifsc_code, account_holder_name, delivery_areas, notes, created_at, updated_at, password_digest, auto_generated_password) FROM stdin;
1	Sudarshan	Delivery	prakash1@gmail.com	7022479208	0	TEMP-9208	LIC-479208	Default Address for Sudarshan	Bangalore	Karnataka	560001	Emergency Contact	9999999999	2026-02-27	15000.0	t	\N	\N	\N	\N	\N		Route: R4	2026-02-27 01:09:48.310755	2026-02-27 01:09:48.310755	$2a$12$5dLhpQEHaWPo7qUKkBWNk.1yswnuJUWDD3bXcWaV1m9LZQwky7TpC	atma@123
2	Sunil	Delivery	shashank@gmail.com	6360180817	0	TEMP-0817	LIC-180817	Default Address for Sunil	Bangalore	Karnataka	560001	Emergency Contact	9999999999	2026-02-27	15000.0	t	\N	\N	\N	\N	\N	R6	Route: R6	2026-02-27 01:09:53.170267	2026-02-27 01:09:53.170267	$2a$12$sT4QftgcGc0tsLuZoEZ08uN4FASyXj4sQNYXv9XjmXdD/ou5yAp6W	atma@123
3	Balu	Night	sudarshan@gmail.com	8073631979	0	TEMP-1979	LIC-631979	Default Address for Balu	Bangalore	Karnataka	560001	Emergency Contact	9999999999	2026-02-27	15000.0	t	\N	\N	\N	\N	\N	R8	Route: R8	2026-02-27 01:09:57.866671	2026-02-27 01:09:57.866671	$2a$12$uE862Scl8zIsh1/8GiM2lOxgzWfymDtkiTZDr7qfzj8/CtKL2KiWy	atma@123
4	Vinay	Delivery	vinayvinay6118@gmail.com	8123281864	0	TEMP-1864	LIC-281864	Default Address for Vinay	Bangalore	Karnataka	560001	Emergency Contact	9999999999	2026-02-27	15000.0	t	\N	\N	\N	\N	\N	R1	Route: R1	2026-02-27 01:10:02.764234	2026-02-27 01:10:02.764234	$2a$12$MDSuI8gBXpaUbemWbYbK9urGEMDEZxoe5AoHSaVUq9OnSodcBZ0cq	atma@123
5	Suresh	Delivery	suresh@gmail.com	9945151165	0	TEMP-1165	LIC-151165	Default Address for Suresh	Bangalore	Karnataka	560001	Emergency Contact	9999999999	2026-02-27	15000.0	t	\N	\N	\N	\N	\N	R9	Route: R9	2026-02-27 01:10:07.667682	2026-02-27 01:10:07.667682	$2a$12$K92HeWVYTXnVLnGh7/.dmuwDSmUix5xw5adOXmc3Cp9wAvqGD2ova	atma@123
6	8th	Mail	rajeevjoshi1991@gmail.com	8792169096	0	TEMP-9096	LIC-169096	Default Address for 8th	Bangalore	Karnataka	560001	Emergency Contact	9999999999	2026-02-27	15000.0	t	\N	\N	\N	\N	\N	R7	Route: R7	2026-02-27 01:10:12.406935	2026-02-27 01:10:12.406935	$2a$12$eqN1yAABBz7LaaRJkQ7LBOvS.rRJNJhOXHIA6GGvz4Zus5x1Ug4r.	atma@123
7	Sharannu	Delivery	take12@email.com	8296805667	0	TEMP-5667	LIC-805667	Default Address for Sharannu	Bangalore	Karnataka	560001	Emergency Contact	9999999999	2026-02-27	15000.0	t	\N	\N	\N	\N	\N	R2	Route: R2	2026-02-27 01:10:17.677846	2026-02-27 01:10:17.677846	$2a$12$EPM6SvvgguM0GpQVDRyVjudqO1jqctNu8FPtWlF4/Rz27.xOaOjJS	atma@123
8	Ravi	Delivery	rajeevjoshi91@gmail.com	7483263539	0	TEMP-3539	LIC-263539	Default Address for Ravi	Bangalore	Karnataka	560001	Emergency Contact	9999999999	2026-02-27	15000.0	t	\N	\N	\N	\N	\N	R11	Route: R11	2026-02-27 01:10:22.431807	2026-02-27 01:10:22.431807	$2a$12$m04jddLe2QTFz7ynEjF.wekVEEiqrc0Z7wHNisGrx50p.9SpWiDye	atma@123
9	Banashankara	Delivery	bana@gmail.com	8310057511	0	TEMP-7511	LIC-057511	Default Address for Banashankara	Bangalore	Karnataka	560001	Emergency Contact	9999999999	2026-02-27	15000.0	t	\N	\N	\N	\N	\N	R5	Route: R5	2026-02-27 01:10:27.295829	2026-02-27 01:10:27.295829	$2a$12$6VouNdsS7fsjH/HUKLGGJuf1kLxuvX0UF4Msm/ohTt/Fr4Du.wF6S	atma@123
10	Office	Delivery	manjunath@gmail.com	8050158237	0	TEMP-8237	LIC-158237	Default Address for Office	Bangalore	Karnataka	560001	Emergency Contact	9999999999	2026-02-27	15000.0	t	\N	\N	\N	\N	\N	\N	\N	2026-02-27 01:10:32.020179	2026-02-27 01:10:32.020179	$2a$12$sw/y/g938UOYBWQRVGlIluu4GFfznOzcqFxG5/ZouKTL/.yxxHC.K	atma@123
11	Akash	B4	pramsdsdsodbha8@gmail.com	919010101010	0	32322343234343432	2133223RFDSFD43243SFDE3232	dfd Banaglore	Bangalore	Karnataka	560068	pramod bhat	919101019191	2026-02-28	222.98	t	\N							2026-02-28 08:50:31.542955	2026-02-28 08:50:31.542955	$2a$12$PYHZrdUceCa29D4fdpcvNeGjHONq1zAtmE6YJVZisI6EJmQ7SN0TC	\N
12	Night	Nigh	9898989898@gmail.com	919898989898	0	SSDDSW12323	DSDW22	9898989898 9898989898	Bangalore	Karnataka	560068	pramod bhat	919898989898	2026-02-28	19999.98	t	\N							2026-02-28 09:37:14.594815	2026-02-28 09:37:14.594815	$2a$12$eegbvA3/vPygKpWbDBXyfuMeErUJ3oqHwLWBl42YI2Tlw.KfUvJe2	\N
\.


--
-- Data for Name: delivery_rules; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.delivery_rules (id, product_id, rule_type, location_data, is_excluded, delivery_days, delivery_charge, created_at, updated_at) FROM stdin;
4	4	0	[]	f	7	0.00	2026-03-01 10:27:45.999581	2026-03-01 10:27:45.999581
9	9	0	[]	f	7	0.00	2026-03-01 10:51:00.769534	2026-03-01 16:02:23.519328
8	8	0	[]	f	7	0.00	2026-03-01 10:50:20.169023	2026-03-01 16:06:59.537155
1	1	0	[]	f	7	0.00	2026-02-27 00:43:56.16596	2026-03-02 23:46:35.373016
2	2	0	[]	f	7	0.00	2026-02-27 00:45:50.164198	2026-03-03 09:03:05.532915
3	3	0	[]	f	7	0.00	2026-02-27 02:16:53.026765	2026-03-03 12:23:03.599721
5	5	0	[]	f	7	0.00	2026-03-01 10:28:33.22064	2026-03-03 12:27:17.278858
7	7	0	[]	f	7	0.00	2026-03-01 10:29:48.45682	2026-03-04 10:08:23.611164
6	6	0	[]	f	7	0.00	2026-03-01 10:29:07.673052	2026-03-04 10:09:44.606897
10	10	0	[]	f	7	0.00	2026-03-01 10:51:32.736313	2026-03-04 10:13:32.001121
26	29	0	[]	f	7	0.00	2026-03-13 14:26:25.444684	2026-03-21 03:55:19.9784
27	33	0	[]	f	7	0.00	2026-03-23 00:18:56.919963	2026-03-23 00:21:50.378679
28	34	0	[]	f	7	0.00	2026-03-31 14:51:44.594431	2026-03-31 14:51:44.594431
29	35	0	[]	f	7	0.00	2026-03-31 15:03:16.945601	2026-03-31 15:04:41.345531
30	36	0	[]	f	7	0.00	2026-03-31 15:10:46.332751	2026-03-31 15:10:46.332751
31	37	0	[]	f	7	0.00	2026-03-31 15:14:05.3177	2026-03-31 15:14:05.3177
\.


--
-- Data for Name: device_tokens; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.device_tokens (id, customer_id, delivery_person_id, token, device_type, active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.expenses (id, store_id, created_by_id, title, description, amount, category, expense_date, created_at, updated_at) FROM stdin;
1	36	111	sds	s	3.00	Rent & Utilities	2026-03-30	2026-03-30 12:51:18.406395	2026-03-30 12:51:18.406395
\.


--
-- Data for Name: franchises; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.franchises (id, name, email, mobile, contact_person_name, business_type, address, city, state, pincode, pan_no, gst_no, license_no, establishment_date, territory, franchise_fee, commission_percentage, status, notes, password_digest, auto_generated_password, longitude, latitude, whatsapp_number, profile_image, business_documents, created_at, updated_at, user_id) FROM stdin;
2	abc	903342rewweewrrewrew93939393fdfds@gmail.com	+91 83838 38383	sads	\N	def	Bangalore	karnataka	\N	\N	\N	\N	\N	\N	\N	10.0	t	\N	\N	zU@shC1#TA	\N	\N	\N	\N	\N	2026-03-05 15:54:34.46635	2026-03-05 15:54:34.46635	68
3	abc	23ew32ewssew@gmail.com	+91 92928 18181	sads	\N	def	Bangalore	karnataka	\N	\N	\N	\N	\N	\N	\N	10.0	t	\N	\N	s182GX3Hd%	\N	\N	\N	\N	\N	2026-03-05 15:55:11.843016	2026-03-05 15:55:11.843016	69
4	Test Franchise	test_franchise_#{Time.current.to_i}@example.com	+91 9999999999	John Doe	\N	123 Test Street	Bangalore	Karnataka	\N	\N	\N	\N	\N	\N	\N	10.0	t	\N	\N	q&WQ$jw3i0	\N	\N	\N	\N	\N	2026-03-05 15:59:24.880331	2026-03-05 15:59:24.880331	70
5	Test Franchise	test_franchise_1772726408@example.com	+91 8888888888	John Doe	\N	123 Test Street	Bangalore	Karnataka	\N	\N	\N	\N	\N	\N	\N	10.0	t	\N	\N	hE$1vls#A8	\N	\N	\N	\N	\N	2026-03-05 16:00:15.062799	2026-03-05 16:00:15.062799	71
6	dds	90939393dfdf93fdfds@gmail.com	+91 99897 87878	sads	\N	df	Bangalore	karnataka	\N	\N	\N	\N	\N	\N	\N	10.0	t	\N	\N	uKX3pizcO&	\N	\N	\N	\N	\N	2026-03-06 00:38:46.405258	2026-03-06 00:38:46.405258	74
7	Pramod Bhat Franchise	pramodbha8@gmail.com	+91 8383838383	Pramod Bhat	\N	123 Main Street	Bangalore	Karnataka	\N	\N	\N	\N	\N	\N	\N	10.0	t	\N	\N	$TgsU27VUm	\N	\N	\N	\N	\N	2026-03-06 11:39:49.943756	2026-03-06 11:39:49.943756	77
\.


--
-- Data for Name: invoice_items; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.invoice_items (id, invoice_id, milk_delivery_task_id, description, quantity, unit_price, total_amount, created_at, updated_at, product_id) FROM stdin;
51	13	551	D Desi cow milk packet (28 deliveries: 2026-02-01 to 2026-02-28)	14.0	100.0	1400.0	2026-03-02 07:50:45.276702	2026-03-02 07:50:45.276702	2
60	21	\N	Pending from last month: Jan 26	1.0	1500.0	1500.0	2026-03-02 07:50:46.662986	2026-03-02 07:50:46.662986	\N
408	317	\N	Corn Nuchchu - Booking #BK20260313FB0AB6 (13 Mar 2026)	1.5	57.142857142857142857142857142857	85.7142857142857142857142857142855	2026-03-13 14:58:54.222133	2026-03-13 14:58:54.222133	29
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.invoices (id, invoice_number, payout_type, payout_id, total_amount, status, invoice_date, due_date, paid_at, created_at, updated_at, customer_id, payment_status, share_token, quick_invoice, paid_amount) FROM stdin;
13	INV-202603-0001	\N	\N	1400.0	draft	2026-02-28	2026-03-30	\N	2026-03-02 07:50:45.274464	2026-03-02 07:50:45.274464	169	0	i_KC3DXqFWvgHmYWv30GVipbblLTeTfk4Hu4AJP-l_E	f	0.00
14	INV-202603-0002	\N	\N	1400.0	draft	2026-02-28	2026-03-30	\N	2026-03-02 07:50:45.497853	2026-03-02 07:50:45.497853	170	0	faVQmcCic761wff8Kfbqql6pt-2Jb6PwqDmpaiHGckU	f	0.00
15	INV-202603-0003	\N	\N	1400.0	draft	2026-02-28	2026-03-30	\N	2026-03-02 07:50:45.667715	2026-03-02 07:50:45.667715	171	0	P05E5CN6oOpnFfk8vJdNRxzgS2X5JrWarRxqe1uuqvQ	f	0.00
16	INV-202603-0004	\N	\N	2800.0	draft	2026-02-28	2026-03-30	\N	2026-03-02 07:50:45.834105	2026-03-02 07:50:45.834105	172	0	gszJIFE3ZA4Ogn-0FOjO3oGKbJlizEcSexKczO-nAOE	f	0.00
17	INV-202603-0005	\N	\N	2800.0	draft	2026-02-28	2026-03-30	\N	2026-03-02 07:50:46.001727	2026-03-02 07:50:46.001727	173	0	3j0XtY7I23FvTGWlr15G-3RdtgVGL5uEQ15icPSjg7Q	f	0.00
18	INV-202603-0006	\N	\N	2700.0	draft	2026-02-28	2026-03-30	\N	2026-03-02 07:50:46.166975	2026-03-02 07:50:46.166975	174	0	rYyUxu8R3Fjqus6jirJkPG4yD4ATV4Eh4cJ719scuCM	f	0.00
20	INV-202603-0008	\N	\N	2800.0	draft	2026-02-28	2026-03-30	\N	2026-03-02 07:50:46.486769	2026-03-02 07:50:46.486769	176	0	5jYBP7v4sLE9x0tRr2-nuOl6C_9UZxr7axCiec4g6QE	f	0.00
19	INV-202603-0007	\N	\N	1250.0	paid	2026-02-28	2026-03-30	2026-03-06 10:28:20.346956	2026-03-02 07:50:46.323954	2026-03-06 10:28:20.347479	175	2	QuhykvKJKtTopuKQPer4BsynbLFmrc4CueCOGgVc4VY	f	0.00
22	INV-202603-0010	\N	\N	8850.0	paid	2026-02-28	2026-03-30	2026-03-06 12:34:41.752963	2026-03-02 07:50:46.832722	2026-03-06 12:34:41.753638	178	2	hqU07PKWLxL71OeFnGZz4BGjBecOkJj-BBkO86IxmNI	f	0.00
21	INV-202603-0009	\N	\N	2900.0	paid	2026-02-28	2026-03-30	2026-03-06 12:35:44.951509	2026-03-02 07:50:46.659269	2026-03-06 12:35:44.951923	177	2	pttHmVIDoqJMHFgHWNt7K_0iQeZv7iM1XXQsdMMXCiA	f	0.00
317	INV-03-00001	\N	\N	85.7142857142857142857142857142855	sent	2026-03-13	2026-04-12	2026-03-13 14:58:54.092967	2026-03-13 14:58:54.159718	2026-03-13 14:58:54.159718	477	2	900bb3zuOeEr4JBwXIuDr9rcuLZahsv7FYgoZI5MgwI	t	0.00
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.leads (id, name, contact_number, email, current_stage, lead_source, created_at, updated_at, product_category, product_subcategory, customer_type, affiliate_id, is_direct, first_name, last_name, middle_name, company_name, gender, marital_status, pan_no, gst_no, height, weight, annual_income, business_job) FROM stdin;
\.


--
-- Data for Name: milk_delivery_tasks; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.milk_delivery_tasks (id, subscription_id, customer_id, product_id, quantity, unit, delivery_date, delivery_person_id, status, assigned_at, completed_at, delivery_notes, created_at, updated_at, invoiced, invoiced_at) FROM stdin;
551	25	169	2	0.50	Liter	2026-02-01	7	completed	\N	2026-02-28 02:30:00	\N	2026-02-28 00:14:23.292767	2026-03-02 07:50:45.281354	t	2026-03-02 07:50:45.280919
552	25	169	2	0.50	Liter	2026-02-02	7	completed	\N	2026-02-28 02:30:00	\N	2026-02-28 00:14:23.687754	2026-03-02 07:50:45.286382	t	2026-03-02 07:50:45.286099
553	25	169	2	0.50	Liter	2026-02-03	7	completed	\N	2026-02-28 02:30:00	\N	2026-02-28 00:14:24.108115	2026-03-02 07:50:45.291389	t	2026-03-02 07:50:45.291106
554	25	169	2	0.50	Liter	2026-02-04	7	completed	\N	2026-02-28 02:30:00	\N	2026-02-28 00:14:24.467528	2026-03-02 07:50:45.331083	t	2026-03-02 07:50:45.330479
555	25	169	2	0.50	Liter	2026-02-05	7	completed	\N	2026-02-28 02:30:00	\N	2026-02-28 00:14:24.935635	2026-03-02 07:50:45.336648	t	2026-03-02 07:50:45.33628
556	25	169	2	0.50	Liter	2026-02-06	7	completed	\N	2026-02-28 02:30:00	\N	2026-02-28 00:14:25.316031	2026-03-02 07:50:45.341463	t	2026-03-02 07:50:45.341167
557	25	169	2	0.50	Liter	2026-02-07	7	completed	\N	2026-02-28 02:30:00	\N	2026-02-28 00:14:25.68878	2026-03-02 07:50:45.346049	t	2026-03-02 07:50:45.34581
558	25	169	2	0.50	Liter	2026-02-08	7	completed	\N	2026-02-28 02:30:00	\N	2026-02-28 00:14:26.393032	2026-03-02 07:50:45.350604	t	2026-03-02 07:50:45.350365
559	25	169	2	0.50	Liter	2026-02-09	7	completed	\N	2026-02-28 02:30:00	\N	2026-02-28 00:14:27.009094	2026-03-02 07:50:45.418831	t	2026-03-02 07:50:45.418632
560	25	169	2	0.50	Liter	2026-02-10	7	completed	\N	2026-02-28 02:30:00	\N	2026-02-28 00:14:27.623263	2026-03-02 07:50:45.431277	t	2026-03-02 07:50:45.431052
\.


--
-- Data for Name: milk_subscriptions; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.milk_subscriptions (id, customer_id, product_id, quantity, unit, start_date, end_date, delivery_time, delivery_pattern, specific_dates, total_amount, status, is_active, created_by, created_at, updated_at, delivery_person_id) FROM stdin;
25	169	2	0.50	Liter	2026-02-01	2026-02-28	08:00	daily	\N	1540.00	active	t	\N	2026-02-28 00:14:21.483148	2026-02-28 00:14:21.483148	7
26	170	2	0.50	Liter	2026-02-01	2026-02-28	08:00	daily	\N	1540.00	active	t	\N	2026-02-28 00:14:49.254501	2026-02-28 00:14:49.254501	7
27	171	2	0.50	Liter	2026-02-01	2026-02-28	08:00	daily	\N	1540.00	active	t	\N	2026-02-28 00:15:04.830497	2026-02-28 00:15:04.830497	7
28	172	2	1.00	Liter	2026-02-01	2026-02-28	08:00	daily	\N	3080.00	active	t	\N	2026-02-28 00:16:03.593521	2026-02-28 00:16:03.593521	7
29	173	2	1.00	Liter	2026-02-01	2026-02-28	08:00	daily	\N	3080.00	active	t	\N	2026-02-28 00:16:18.93924	2026-02-28 00:16:18.93924	7
30	174	2	1.00	Liter	2026-02-01	2026-02-28	08:00	daily	\N	3080.00	active	t	\N	2026-02-28 00:16:36.903194	2026-02-28 00:16:36.903194	7
31	175	2	0.50	Liter	2026-02-01	2026-02-28	08:00	daily	\N	1540.00	active	t	\N	2026-02-28 00:16:55.536813	2026-02-28 00:16:55.536813	7
32	176	2	1.00	Liter	2026-02-01	2026-02-28	08:00	daily	\N	3080.00	active	t	\N	2026-02-28 00:17:12.133831	2026-02-28 00:17:12.133831	7
33	177	2	0.50	Liter	2026-02-01	2026-02-28	08:00	daily	\N	1540.00	active	t	\N	2026-02-28 00:17:30.076636	2026-02-28 00:17:30.076636	7
34	178	2	1.50	Liter	2026-02-01	2026-02-28	08:00	daily	\N	4620.00	active	t	\N	2026-02-28 00:17:47.27898	2026-02-28 00:17:47.27898	7
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.notes (id, title, paid_to, amount, payment_method, reference_number, description, status, note_date, created_by_user_id, created_at, updated_at, paid_from, paid_to_category) FROM stdin;
1	sd	sds	31.99	Cash	232	sx	completed	2026-03-03	1	2026-03-03 15:57:02.573076	2026-03-03 15:57:02.573076	\N	\N
2	Milk payment	Murthy	50000.00	UPI		Jan 26 Balance	completed	2026-03-03	1	2026-03-04 01:26:03.436294	2026-03-04 01:26:03.436294	\N	\N
3	Jaggry Payment	Gopal	4350.00	UPI			completed	2026-03-03	1	2026-03-04 01:41:41.343162	2026-03-04 01:41:41.343162	\N	\N
4	Milk payment	Sridhar Sogadu	21300.00	UPI		@Atma	completed	2026-03-03	1	2026-03-04 01:42:56.993541	2026-03-04 01:42:56.993541	\N	\N
5	Fuel Purchase	Petrol Pump	2500.75	UPI	\N	Monthly fuel expense for delivery vehicle	completed	2026-03-04	1	2026-03-04 04:31:06.812147	2026-03-04 04:31:06.812147	Atma Nirbhar Farm Account	Petrol
6	Office Supplies	Stationery Store	1200.00	Cash	\N	Monthly office supplies purchase	pending	2026-03-03	1	2026-03-04 04:31:07.645798	2026-03-04 04:31:07.645798	\N	\N
7	Name Bord	Sujatha	14100.00	UPI			completed	2026-03-04	1	2026-03-04 16:06:58.287915	2026-03-04 16:06:58.287915	Personal Account	PG Business
8	3975	8th mile	280.00	UPI			completed	2026-03-04	1	2026-03-04 16:12:21.260444	2026-03-04 16:12:21.260444	Atma Nirbhar Farm Account	Petrol
9	Silender	Keerthi A	3600.00	UPI			completed	2026-03-04	1	2026-03-04 16:14:08.300271	2026-03-04 16:14:08.300271	Personal Account	PG Business
10	7444	Sharan	868.00	UPI			completed	2026-03-04	1	2026-03-04 16:16:06.295238	2026-03-04 16:16:06.295238	Atma Nirbhar Farm Account	Petrol
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.notifications (id, customer_id, title, message, notification_type, data, read, read_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.order_items (id, order_id, product_id, quantity, price, total, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.orders (id, customer_id, user_id, order_number, order_date, status, payment_method, payment_status, subtotal, tax_amount, discount_amount, shipping_amount, total_amount, notes, order_items, customer_name, customer_email, customer_phone, delivery_address, tracking_number, delivered_at, created_at, updated_at, processing_notes, estimated_processing_time, processing_started_at, packed_by, package_weight, package_dimensions, packing_notes, packed_at, shipping_carrier, estimated_delivery_date, shipping_cost, shipping_notes, shipped_at, delivered_to, delivery_location, delivery_notes, cancelled_at, cancellation_reason, refund_method, refund_amount, cancellation_notes, invoice_generated, invoice_number, cash_received, change_amount, order_stage, booking_date, booking_id) FROM stdin;
\.


--
-- Data for Name: pending_amounts; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.pending_amounts (id, customer_id, amount, description, pending_date, status, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.permissions (id, name, resource, action, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_ratings; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.product_ratings (id, product_id, customer_id, user_id, rating, comment, status, reviewer_name, reviewer_email, verified_purchase, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_reviews; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.product_reviews (id, product_id, customer_id, user_id, rating, comment, reviewer_name, reviewer_email, status, verified_purchase, helpful_count, pros, cons, title, images_data, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.products (id, name, description, category_id, price, discount_price, stock, status, sku, weight, dimensions, meta_title, meta_description, tags, created_at, updated_at, discount_type, discount_value, original_price, discount_amount, is_discounted, gst_enabled, gst_percentage, cgst_percentage, sgst_percentage, igst_percentage, gst_amount, cgst_amount, sgst_amount, igst_amount, final_amount_with_gst, buying_price, yesterday_price, today_price, price_change_percentage, last_price_update, price_history, is_occasional_product, occasional_start_date, occasional_end_date, occasional_description, occasional_auto_hide, product_type, occasional_schedule_type, occasional_recurring_from_day, occasional_recurring_from_time, occasional_recurring_to_day, occasional_recurring_to_time, is_subscription_enabled, unit_type, minimum_stock_alert, default_selling_price, hsn_code, image_url, additional_images_urls, display_order, base_price_excluding_gst) FROM stdin;
15	Groundnut Oil		4	459.00	413.10	494	active	OIL73AB8D	\N					2026-03-01 10:59:15.806507	2026-03-06 11:57:02.857616	percentage	\N	\N	\N	t	t	5.00	\N	\N	\N	19.67	\N	\N	\N	413.10	290.00	430.00	459.00	6.74	2026-03-06 11:57:02.857372	[{"date":"2026-03-01","price":"430.0","timestamp":1772362755},{"date":"2026-03-06","price":"459.0","timestamp":1772798222}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Piece	\N	\N	\N			\N	393.43
8	Chandan Soap		5	60.00	\N	489	active	SOAB94D36	\N					2026-03-01 10:50:20.166358	2026-03-01 16:06:59.535147	\N	\N	\N	\N	f	t	4.99	\N	\N	\N	2.85	\N	\N	\N	60.00	50.00	59.99	60.00	0.02	2026-03-01 10:50:20.16617	[{"date":"2026-03-01","price":"59.99","timestamp":1772362220},{"date":"2026-03-01","price":"60.0","timestamp":1772362315}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Piece	\N	\N	\N			\N	57.15
17	Cow Dong Cake		6	80.00	\N	196	active	GO 211B6C	\N					2026-03-01 16:08:54.606666	2026-03-01 16:08:54.606666	\N	\N	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	\N	80.00	60.00	80.00	80.00	0.00	2026-03-01 16:08:54.606523	[{"date":"2026-03-01","price":"80.0","timestamp":1772381334}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Box	\N	\N	\N			\N	\N
13	Jaggery Powder		2	110.00	\N	99	active	GRO070698	\N					2026-03-01 10:58:03.067943	2026-03-01 10:58:03.067943	\N	\N	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	\N	110.00	10.00	110.00	110.00	0.00	2026-03-01 10:58:03.067799	[{"date":"2026-03-01","price":"110.0","timestamp":1772362683}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Kg	\N	\N	\N			\N	\N
6	Rajmudi Rice		2	110.00	\N	500	active	GRO43A78A	\N					2026-03-01 10:29:07.670688	2026-03-04 10:09:44.60404	\N	\N	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	\N	110.00	78.00	109.99	110.00	0.01	2026-03-04 10:09:44.603817	[{"date":"2026-03-01","price":"109.99","timestamp":1772360947},{"date":"2026-03-04","price":"110.0","timestamp":1772618984}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Kg	\N	\N	\N			\N	\N
5	Butter	Our Desi Cow Butter (Makhan) is made from the milk of indigenous Indian cows using the traditional Bilona method. Fresh curd is hand-churned with a wooden bilona to extract soft, creamy white butter rich in natural goodness and authentic village taste.	1	1800.00	\N	484	active	DES208703	\N					2026-03-01 10:28:33.216302	2026-03-03 12:27:17.27526	\N	\N	\N	\N	f	t	4.97	\N	\N	\N	85.22	\N	\N	\N	1800.00	1700.00	1800.00	1800.00	0.00	2026-03-01 10:28:33.216062	[{"date":"2026-03-01","price":"1800.0","timestamp":1772360913}]	f	\N	\N	\N	t	Milk			\N		\N	f	Kg	\N	\N	\N			\N	1714.78
22	coconut Oil		4	680.00	612.00	100	active	COL96CCD2	\N					2026-03-04 10:17:05.520286	2026-03-06 11:53:52.145492	percentage	\N	\N	\N	t	f	\N	\N	\N	\N	\N	\N	\N	\N	612.00	530.00	550.00	680.00	23.64	2026-03-06 11:53:52.14519	[{"date":"2026-03-04","price":"550.0","timestamp":1772619425},{"date":"2026-03-06","price":"680.0","timestamp":1772798032}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Liter	\N	\N	\N			\N	\N
18	Sun Flower Oil		4	489.00	440.10	48	active	OIL9797EB	\N					2026-03-02 07:19:31.082826	2026-03-06 11:55:51.546367	percentage	\N	\N	\N	t	t	5.00	\N	\N	\N	20.96	\N	\N	\N	440.10	250.00	410.00	489.00	19.27	2026-03-06 11:55:51.54598	[{"date":"2026-03-02","price":"410.0","timestamp":1772435971},{"date":"2026-03-06","price":"489.0","timestamp":1772798151}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Liter	\N	\N	\N			\N	419.14
9	Panchagavya Soap		5	60.00	\N	497	active	SOA443525	\N					2026-03-01 10:51:00.766918	2026-03-01 16:02:23.516123	\N	\N	\N	\N	f	t	50.00	\N	\N	\N	20.00	\N	\N	\N	60.00	50.00	60.00	60.00	0.00	2026-03-01 10:51:00.766772	[{"date":"2026-03-01","price":"60.0","timestamp":1772362260}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Piece	\N	\N	\N			\N	40.0
14	Jaggery Achhu		2	99.98	\N	341	active	GROFD6933	\N					2026-03-01 10:58:32.101969	2026-03-01 10:58:32.101969	\N	\N	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	\N	99.98	90.00	99.98	99.98	0.00	2026-03-01 10:58:32.101824	[{"date":"2026-03-01","price":"99.98","timestamp":1772362712}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Piece	\N	\N	\N			\N	\N
2	Desi cow milk packet	Desi cow milk packet	1	110.00	100.00	33050	active	 DE2DEB8A	\N					2026-02-27 00:45:49.888397	2026-03-03 09:03:05.440229	fixed	10.00	\N	10.00	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	80.00	110.00	110.00	0.00	2026-02-27 00:45:49.887875	[{"date":"2026-02-27","price":"110.0","timestamp":1772153149}]	f	\N	\N	\N	t	Milk			\N		\N	f	Bottle	\N	\N	\N			\N	\N
10	Rose Soap		3	60.00	\N	494	active	SOAFE270D	\N					2026-03-01 10:51:32.733902	2026-03-04 10:13:31.999469	\N	\N	\N	\N	f	t	5.00	\N	\N	\N	2.86	\N	\N	\N	60.00	50.00	60.00	60.00	0.00	2026-03-01 10:51:32.733759	[{"date":"2026-03-01","price":"60.0","timestamp":1772362292}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Piece	\N	\N	\N			\N	57.14
21	Vibhuthi	Our Desi Cow Vibhuthi is made from pure indigenous desi cow dung, prepared using traditional sacred methods. The dung is naturally dried and carefully burned in a clean and spiritual environment to produce fine, pure ash used for religious and devotional purposes.	6	50.00	\N	200	active	COLFBB1F6	\N					2026-03-04 09:21:13.828471	2026-03-04 09:53:32.349643	\N	\N	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	\N	50.00	30.00	220.00	50.00	-77.27	2026-03-04 09:21:13.828326	[{"date":"2026-03-04","price":"220.0","timestamp":1772616073},{"date":"2026-03-04","price":"50.0","timestamp":1772618012}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Piece	\N	\N	\N			\N	\N
4	Paneer	Paneer	1	900.00	\N	99	active	DESC7B163	\N					2026-03-01 10:27:45.99671	2026-03-01 10:27:45.99671	\N	\N	\N	\N	f	t	5.00	\N	\N	\N	42.86	\N	\N	\N	900.00	800.00	900.00	900.00	0.00	2026-03-01 10:27:45.99652	[{"date":"2026-03-01","price":"900.0","timestamp":1772360865}]	f	\N	\N	\N	t	Milk			\N		\N	f	Kg	\N	\N	\N			\N	857.14
11	Sambrani Cup		6	150.00	\N	230	active	GO C90829	\N					2026-03-01 10:53:27.704876	2026-03-01 10:53:27.704876	\N	\N	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	\N	150.00	140.00	150.00	150.00	0.00	2026-03-01 10:53:27.704708	[{"date":"2026-03-01","price":"150.0","timestamp":1772362407}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Piece	\N	\N	\N			\N	150.0
20	Pink Salt		2	100.00	\N	100	active	COL9ABB0D	\N					2026-03-04 09:12:49.662789	2026-03-04 09:58:17.393852	percentage	\N	\N	\N	f	f	5.00	\N	\N	\N	\N	\N	\N	\N	100.00	65.00	1800.00	100.00	-94.44	2026-03-04 09:12:49.662559	[{"date":"2026-03-04","price":"1800.0","timestamp":1772615569},{"date":"2026-03-04","price":"2150.0","timestamp":1772615905},{"date":"2026-03-04","price":"100.0","timestamp":1772618297}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Kg	\N	\N	\N			\N	95.24
19	Dantha Manjan	qw	3	50.00	\N	100	active	32	40.000					2026-03-04 03:54:42.168395	2026-03-04 09:59:39.149071	\N	\N	\N	\N	f	f	4.99	\N	\N	\N	\N	\N	\N	\N	50.00	30.00	40.00	50.00	25.00	2026-03-04 03:54:42.168205	[{"date":"2026-03-04","price":"40.0","timestamp":1772596482},{"date":"2026-03-04","price":"50.0","timestamp":1772618379}]	f	\N	\N	\N	t	Milk			\N		\N	f	Piece	\N	\N	\N	products/product-temp-82c69c3477766d42		\N	47.62
7	Sanna Madhu rice		2	76.00	\N	29	active	GRO80790C	\N					2026-03-01 10:29:48.454468	2026-03-04 10:08:23.609455	\N	\N	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	\N	76.00	65.00	76.00	76.00	0.00	2026-03-01 10:29:48.454282	[{"date":"2026-03-01","price":"76.0","timestamp":1772360988}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Kg	\N	\N	\N			\N	\N
1	Desi A2 Cow Milk Bottel		1	120.00	110.00	488	active	 DE1AF406	\N					2026-02-27 00:43:55.888049	2026-03-02 23:46:35.104222	fixed	10.00	\N	10.00	t	t	18.00	\N	\N	\N	\N	\N	\N	\N	\N	80.00	120.00	120.00	0.00	2026-02-27 00:43:55.887482	[{"date":"2026-02-27","price":"120.0","timestamp":1772153035}]	f	\N	\N	\N	t	Milk			\N		\N	f	Liter	\N	\N	\N			\N	\N
16	Dhoop		6	100.00	\N	90	active	GO 6BDD76	0.750					2026-03-01 14:48:18.683086	2026-03-01 16:05:14.87902	\N	\N	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	\N	100.00	52.00	100.00	100.00	0.00	2026-03-01 14:48:18.682886	[{"date":"2026-03-01","price":"100.0","timestamp":1772376498}]	f	\N	\N	\N	t	Milk			\N		\N	f	Box	\N	\N	\N			\N	\N
23	test product	ads	2	55.98	53.18	1	active	GROFF906D	\N					2026-03-04 11:17:32.500265	2026-03-04 11:17:32.500265	percentage	\N	\N	\N	t	f	\N	\N	\N	\N	\N	\N	\N	\N	53.18	34.00	55.98	55.98	0.00	2026-03-04 11:17:32.499212	[{"date":"2026-03-04","price":"55.98","timestamp":1772623052}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Kg	\N	\N	\N			\N	\N
12	Agarbatti		2	100.00	\N	306	active	GRO08C30C	\N					2026-03-01 10:54:04.40161	2026-03-01 10:54:04.40161	\N	\N	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	\N	100.00	90.00	100.00	100.00	0.00	2026-03-01 10:54:04.401472	[{"date":"2026-03-01","price":"100.0","timestamp":1772362444}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Liter	\N	\N	\N			\N	\N
24	Sessami Oil	ds	4	598.00	\N	40	active	COL59CA2F	\N					2026-03-06 12:03:08.044194	2026-03-06 12:03:08.044194	\N	\N	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	\N	598.00	70.00	598.00	598.00	0.00	2026-03-06 12:03:08.043915	[{"date":"2026-03-06","price":"598.0","timestamp":1772798588}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Bottle	\N	\N	\N			\N	\N
25	Castor Oil		4	399.00	359.10	25	active	COL600015	\N					2026-03-06 12:04:35.457911	2026-03-06 12:06:01.752481	percentage	\N	\N	\N	t	t	5.00	\N	\N	\N	17.10	\N	\N	\N	359.10	280.00	380.00	399.00	5.00	2026-03-06 12:04:35.457707	[{"date":"2026-03-06","price":"380.0","timestamp":1772798675},{"date":"2026-03-06","price":"399.0","timestamp":1772798761}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Liter	\N	\N	\N			\N	342.0
26	Sample Fresh Milk 202603080547	Pure cow milk delivered daily - sample product	1	60.00	55.00	100	active	SAMPLE001	1.000	1L bottle	\N	\N	\N	2026-03-08 00:28:35.923461	2026-03-08 00:28:35.923461	\N	\N	\N	\N	f	t	5.00	2.50	2.50	\N	3.00	1.50	1.50	\N	63.00	45.00	\N	60.00	\N	2026-03-08 00:28:34.895848	[{"date":"2026-03-08","price":"60.0","timestamp":1772929715}]	f	\N	\N	\N	t	Grocery	\N	\N	\N	\N	\N	t	Liter	\N	\N	\N	\N	\N	\N	\N
27	Sample Vegetable Bundle 202603080547	Fresh organic vegetables bundle with seasonal variety - sample product	1	150.00	140.00	50	active	SAMPLE002	1.000	1kg bundle	\N	\N	\N	2026-03-08 00:28:39.683136	2026-03-08 00:28:39.683136	\N	\N	\N	\N	f	f	0.00	\N	\N	\N	\N	\N	\N	\N	\N	120.00	\N	150.00	\N	2026-03-08 00:28:39.451761	[{"date":"2026-03-08","price":"150.0","timestamp":1772929719}]	f	\N	\N	\N	t	Grocery	\N	\N	\N	\N	\N	f	Kg	\N	\N	\N	\N	\N	\N	\N
28	Sample Special Sweets 202603080547	Traditional sweets for festivals and special occasions - sample product	1	300.00	255.00	25	active	SAMPLE003	0.500	500g box	\N	\N	\N	2026-03-08 00:28:42.084536	2026-03-08 00:28:42.084536	\N	\N	\N	\N	f	t	5.00	2.50	2.50	\N	15.00	7.50	7.50	\N	315.00	200.00	\N	300.00	\N	2026-03-08 00:28:41.836155	[{"date":"2026-03-08","price":"300.0","timestamp":1772929722}]	f	\N	\N	\N	t	Grocery	\N	\N	\N	\N	\N	f	Box	\N	\N	\N	\N	\N	\N	\N
34	Sajje		2	60.00	\N	48	active	GRO0340F7	0.500					2026-03-31 14:51:44.588934	2026-03-31 14:51:44.588934	\N	\N	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	\N	60.00	50.00	60.00	60.00	0.00	2026-03-31 14:51:44.588583	[{"date":"2026-03-31","price":"60.0","timestamp":1774968704}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Kg	\N	\N	\N			\N	\N
36	Navane		2	60.00	\N	60	active	GROCE8F6B	1.000					2026-03-31 15:10:46.328797	2026-03-31 15:10:46.328797	\N	\N	\N	\N	f	t	5.00	\N	\N	\N	3.00	\N	\N	\N	60.00	40.00	60.00	60.00	0.00	2026-03-31 15:10:46.328586	[{"date":"2026-03-31","price":"60.0","timestamp":1774969846}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Kg	\N	\N	\N			\N	57.0
37	Apple		8	100.00	\N	495	active	ORGCA0D03	1.000					2026-03-31 15:14:05.312624	2026-03-31 15:14:05.312624	\N	\N	\N	\N	f	t	5.00	\N	\N	\N	5.00	\N	\N	\N	100.00	80.00	100.00	100.00	0.00	2026-03-31 15:14:05.312378	[{"date":"2026-03-31","price":"100.0","timestamp":1774970045}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Kg	\N	\N	\N			\N	95.0
30	Peda 202603141419	Pure cow milk delivered daily - sample product	1	60.00	55.00	100	active	PEDA20001	1.000	1L bottle	\N	\N	\N	2026-03-14 08:56:31.709227	2026-03-14 08:56:31.709227	\N	\N	\N	\N	f	t	5.00	2.50	2.50	\N	3.00	1.50	1.50	\N	63.00	45.00	\N	60.00	\N	2026-03-14 08:56:31.682606	[{"date":"2026-03-14","price":"60.0","timestamp":1773478591}]	f	\N	\N	\N	t	Grocery	\N	\N	\N	\N	\N	t	Liter	\N	\N	\N	\N	\N	\N	\N
31	Tapioca 202603141419	Fresh organic vegetables bundle with seasonal variety - sample product	1	150.00	140.00	50	active	TAPIOC001	1.000	1kg bundle	\N	\N	\N	2026-03-14 08:56:31.908528	2026-03-14 08:56:31.908528	\N	\N	\N	\N	f	f	0.00	\N	\N	\N	\N	\N	\N	\N	\N	120.00	\N	150.00	\N	2026-03-14 08:56:31.905012	[{"date":"2026-03-14","price":"150.0","timestamp":1773478591}]	f	\N	\N	\N	t	Grocery	\N	\N	\N	\N	\N	f	Kg	\N	\N	\N	\N	\N	\N	\N
32	Jaggery Sweets 202603141419	Traditional sweets for festivals and special occasions - sample product	1	300.00	255.00	25	active	JAGGER001	0.500	500g box	\N	\N	\N	2026-03-14 08:56:31.934576	2026-03-14 08:56:31.934576	\N	\N	\N	\N	f	t	5.00	2.50	2.50	\N	15.00	7.50	7.50	\N	315.00	200.00	\N	300.00	\N	2026-03-14 08:56:31.928464	[{"date":"2026-03-14","price":"300.0","timestamp":1773478591}]	f	\N	\N	\N	t	Grocery	\N	\N	\N	\N	\N	f	Box	\N	\N	\N	\N	\N	\N	\N
29	Corn Nuchchu	Godhi Nuchchu	2	100.00	\N	151	active	GRO7FE16F	\N					2026-03-13 14:26:25.438803	2026-03-21 03:55:19.973384	\N	\N	\N	\N	f	t	5.00	\N	\N	\N	4.76	0.00	0.00	0.00	100.00	45.00	60.00	100.00	66.67	2026-03-21 03:55:19.972803	[{"date":"2026-03-13","price":"65.0","timestamp":1773411985},{"date":"2026-03-13","price":"60.0","timestamp":1773412645},{"date":"2026-03-21","price":"100.0","timestamp":1774065319}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Kg	\N	\N	\N	products/product-temp-9ca86d34968a186b		\N	95.24
33	A2 Ghee	sd	2	100.00	\N	33	active	sd	\N					2026-03-23 00:18:56.528508	2026-03-23 00:21:49.968468	\N	\N	\N	\N	f	t	6.00	\N	\N	\N	6.00	\N	\N	\N	100.00	22.98	100.00	100.00	0.00	2026-03-23 00:18:56.528015	[{"date":"2026-03-23","price":"100.0","timestamp":1774225136}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Kg	\N	\N	\N	products/product-temp-88a817446e35d5fa		\N	94.0
3	A2 Ghee	Our Desi Cow Ghee is made from the milk of indigenous Indian cows using the traditional Bilona method. We first convert whole milk into curd, then churn it with a wooden bilona to extract makkhan (butter), which is slowly heated to produce rich, golden, aromatic A2 ghee.	1	2500.00	\N	73	active	DES85E367	\N					2026-02-27 02:16:52.755291	2026-03-03 12:23:03.597851	\N	\N	\N	\N	f	t	5.00	\N	\N	\N	119.05	\N	\N	\N	2500.00	1999.98	2500.00	2500.00	0.00	2026-02-27 02:16:52.754513	[{"date":"2026-02-27","price":"2500.0","timestamp":1772158612}]	f	\N	\N	\N	t	Milk			\N		\N	f	Kg	\N	\N	\N			\N	2380.95
35	Jola		2	60.00	\N	50	active	GRO643972	1.000					2026-03-31 15:03:16.941594	2026-03-31 15:04:41.342086	percentage	\N	\N	\N	f	t	5.00	\N	\N	\N	3.00	\N	\N	\N	60.00	40.00	60.00	60.00	0.00	2026-03-31 15:03:16.941384	[{"date":"2026-03-31","price":"60.0","timestamp":1774969396}]	f	\N	\N	\N	t	Grocery			\N		\N	f	Kg	\N	\N	\N			\N	57.0
\.


--
-- Data for Name: referrals; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.referrals (id, affiliate_id, referred_name, referred_mobile, referred_email, referral_date, status, notes, converted_at, customer_id, created_at, updated_at, referring_customer_id, referral_source) FROM stdin;
2	\N	Jane Test Friend	9876543211	jane.testfriend@example.com	2026-03-05	pending	Test referral for functionality verification - should work now!	\N	\N	2026-03-05 01:33:13.572138	2026-03-05 01:33:13.572138	169	affiliate
3	\N	Bob Final Test	9876543222	bob.final@example.com	2026-03-05	pending	Final comprehensive test referral	\N	\N	2026-03-05 01:35:43.333637	2026-03-05 01:35:43.333637	169	affiliate
4	\N	sdd	0919093939	9093939393fdfds@gmail.com	2026-03-05	pending	sd	\N	\N	2026-03-05 02:15:19.325341	2026-03-05 02:15:19.325341	469	affiliate
5	6	John Smith	9876543210	john.smith@example.com	2026-03-04	pending	Interested in organic products	\N	\N	2026-03-04 04:43:41.625724	2026-03-06 04:43:43.401227	\N	affiliate
6	6	Mike Davis	9876543212	mike.davis@example.com	2026-02-27	converted	Neighbor, interested in subscription	\N	\N	2026-02-27 04:43:41.626563	2026-03-06 04:43:47.079613	\N	affiliate
7	6	Lisa Williams	9876543213	lisa.williams@example.com	2026-03-03	pending	Colleague, wants fresh milk delivery	\N	\N	2026-03-03 04:43:41.626724	2026-03-06 04:43:49.141741	\N	affiliate
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.roles (id, name, description, status, permissions, created_at, updated_at) FROM stdin;
1	franchise	Franchise Partner Role	t	\N	2026-02-18 11:13:43.235447	2026-02-18 11:13:43.235447
2	affiliate	Affiliate role with limited access to referral features	t	\N	2026-02-23 14:13:19.543043	2026-02-23 14:13:19.543043
3	delivery	Delivery person role	t	\N	2026-02-27 01:06:02.546711	2026-02-27 01:06:02.546711
4	data_entry	Access to add and modify customer and policy data	t	\N	2026-03-04 04:46:15.898869	2026-03-04 04:46:15.898869
5	tele_calling	Access to leads and customer communication features	t	\N	2026-03-04 04:46:17.485304	2026-03-04 04:46:17.485304
6	accounts	Access to financial reports and commission management	t	\N	2026-03-04 04:46:19.100165	2026-03-04 04:46:19.100165
7	super_admin	Full system access and administration	t	\N	2026-03-04 04:46:20.841895	2026-03-04 04:46:20.841895
\.


--
-- Data for Name: sale_items; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.sale_items (id, booking_id, product_id, stock_batch_id, quantity, selling_price, purchase_price, profit_amount, line_total, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.schema_migrations (version) FROM stdin;
0
20260107092810
20260107101240
20260107111549
20260107131159
20260107131309
20260107131913
20260107150605
20260107150728
20260107150805
20260107150814
20260107151651
20260107171920
20260108042049
20260108042658
20260108043706
20260108045016
20260108045914
20260108060039
20260108072509
20260108104259
20260108110047
20260108171419
20260109024857
20260111014913
20260111020543
20260111020547
20260111031353
20260111032424
20260111060641
20260111070348
20260111071020
20260111071120
20260111071219
20260111071659
20260111092557
20260111101523
20260111101527
20260111105247
20260208061341
20260208062719
20260208101409
20260208101558
20260208101609
20260208101620
20260208101643
20260208101648
20260208102424
20260208102434
20260208103030
20260208103125
20260208153931
20260209090000
20260209090001
20260211095237
20260212010028
20260212023145
20260212114420
1
20260212133027
20260213005145
20260214025047
20260216073135
20260217163319
20260218014142
20260218014153
20260218014204
20260218073032
20260218073033
20260218073034
20260218073035
20260218073036
20260218073037
20260218104948
20260218105107
20260218105116
20260218111202
20260218111627
20260218113731
20260219063828
20260219065729
20260219114349
20260219163202
20260219163237
20260219163249
20260219163301
20260220121130
20260220170323
20260221051144
20260221051526
20260221071051
20260222101845
20260222113448
20260223003701
20260223004840
20260223012155
20260223013159
20260223093122
20260223112829
20260223140936
20260223140939
20260225162412
20260226005401
20260227012037
20260227042837
20260302070828
20260303124807
20260303140745
20260304040431
20260304150744
20260305011138
20260305013049
20260305013057
20260306005034
20260306133011
20260307032837
20240320001
20240320002
20240320003
20240320004
20260330121614
20260331111136
\.


--
-- Data for Name: solid_cache_entries; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.solid_cache_entries (id, key, value, created_at, key_hash, byte_size) FROM stdin;
\.


--
-- Data for Name: solid_queue_blocked_executions; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.solid_queue_blocked_executions (id, job_id, queue_name, priority, concurrency_key, expires_at, created_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_claimed_executions; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.solid_queue_claimed_executions (id, job_id, process_id, created_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_failed_executions; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.solid_queue_failed_executions (id, job_id, error, created_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_jobs; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.solid_queue_jobs (id, queue_name, class_name, arguments, priority, active_job_id, scheduled_at, finished_at, concurrency_key, created_at, updated_at) FROM stdin;
1	default	ActiveStorage::PurgeJob	{"job_class":"ActiveStorage::PurgeJob","job_id":"6e23288f-1632-4c68-842a-338ef76d4f1b","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/1"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2026-02-12T12:07:57.722857051Z","scheduled_at":"2026-02-12T12:07:57.722472853Z"}	0	6e23288f-1632-4c68-842a-338ef76d4f1b	2026-02-12 12:07:57.722472	\N	\N	2026-02-12 12:07:58.597033	2026-02-12 12:07:58.597033
2	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"60be65de-262d-4dbd-a55d-cbd554f0d94c","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/2"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2026-02-12T13:21:25.315101323Z","scheduled_at":"2026-02-12T13:21:25.314201655Z"}	0	60be65de-262d-4dbd-a55d-cbd554f0d94c	2026-02-12 13:21:25.314201	\N	\N	2026-02-12 13:21:25.87722	2026-02-12 13:21:25.87722
3	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"89855de3-34bd-46a3-b6da-e80825359da8","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/3"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2026-02-12T16:39:33.848379658Z","scheduled_at":"2026-02-12T16:39:33.847795998Z"}	0	89855de3-34bd-46a3-b6da-e80825359da8	2026-02-12 16:39:33.847795	\N	\N	2026-02-12 16:39:36.448794	2026-02-12 16:39:36.448794
4	default	ActiveStorage::PurgeJob	{"job_class":"ActiveStorage::PurgeJob","job_id":"ed7d0e25-8623-461d-8d08-7d0f4fecb369","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/3"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2026-02-12T16:43:19.465350484Z","scheduled_at":"2026-02-12T16:43:19.465113217Z"}	0	ed7d0e25-8623-461d-8d08-7d0f4fecb369	2026-02-12 16:43:19.465113	\N	\N	2026-02-12 16:43:19.465773	2026-02-12 16:43:19.465773
5	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"99639898-b8c9-419c-99fa-761214dcc7c8","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/4"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2026-02-12T16:43:20.443497958Z","scheduled_at":"2026-02-12T16:43:20.443370029Z"}	0	99639898-b8c9-419c-99fa-761214dcc7c8	2026-02-12 16:43:20.44337	\N	\N	2026-02-12 16:43:20.443884	2026-02-12 16:43:20.443884
6	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"c61ace8a-f368-42e7-8542-a8a4edb93fc8","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/5"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2026-02-12T16:45:25.189604937Z","scheduled_at":"2026-02-12T16:45:25.189416184Z"}	0	c61ace8a-f368-42e7-8542-a8a4edb93fc8	2026-02-12 16:45:25.189416	\N	\N	2026-02-12 16:45:25.190008	2026-02-12 16:45:25.190008
7	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"e5ee5f19-af29-4b1f-bd97-d6f3a7a8c352","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/6"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2026-02-13T05:51:25.110849051Z","scheduled_at":"2026-02-13T05:51:25.110299088Z"}	0	e5ee5f19-af29-4b1f-bd97-d6f3a7a8c352	2026-02-13 05:51:25.110299	\N	\N	2026-02-13 05:51:27.617643	2026-02-13 05:51:27.617643
8	default	ActiveStorage::PurgeJob	{"job_class":"ActiveStorage::PurgeJob","job_id":"92c464be-cfb8-424a-9405-5eb54be20c10","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/5"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2026-02-13T05:52:07.947848557Z","scheduled_at":"2026-02-13T05:52:07.947462818Z"}	0	92c464be-cfb8-424a-9405-5eb54be20c10	2026-02-13 05:52:07.947462	\N	\N	2026-02-13 05:52:10.513936	2026-02-13 05:52:10.513936
9	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"b890e8e2-667a-4697-ad5d-f81ef5e2e900","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/7"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2026-02-13T05:52:11.920236510Z","scheduled_at":"2026-02-13T05:52:11.920077446Z"}	0	b890e8e2-667a-4697-ad5d-f81ef5e2e900	2026-02-13 05:52:11.920077	\N	\N	2026-02-13 05:52:11.920643	2026-02-13 05:52:11.920643
10	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"f50176f0-d090-4d1c-89a8-b449c18abcac","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/8"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-16T11:41:10.013383748Z","scheduled_at":"2026-02-16T11:41:10.012471817Z"}	0	f50176f0-d090-4d1c-89a8-b449c18abcac	2026-02-16 11:41:10.012471	\N	\N	2026-02-16 11:41:10.568931	2026-02-16 11:41:10.568931
11	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"456ccfd9-642e-4cfe-87a5-b45da6074bb1","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/9"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-16T15:33:45.707208019Z","scheduled_at":"2026-02-16T15:33:45.706707231Z"}	0	456ccfd9-642e-4cfe-87a5-b45da6074bb1	2026-02-16 15:33:45.706707	\N	\N	2026-02-16 15:33:48.323511	2026-02-16 15:33:48.323511
12	default	ActiveStorage::PurgeJob	{"job_class":"ActiveStorage::PurgeJob","job_id":"7864fab5-6375-4d22-acd2-efd284bcc525","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/6"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-16T15:36:49.657321108Z","scheduled_at":"2026-02-16T15:36:49.656669795Z"}	0	7864fab5-6375-4d22-acd2-efd284bcc525	2026-02-16 15:36:49.656669	\N	\N	2026-02-16 15:36:52.194294	2026-02-16 15:36:52.194294
13	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"82d1ff4b-ea1f-45f3-928f-bf3cebb9602f","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/10"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-16T15:36:53.673805268Z","scheduled_at":"2026-02-16T15:36:53.673583730Z"}	0	82d1ff4b-ea1f-45f3-928f-bf3cebb9602f	2026-02-16 15:36:53.673583	\N	\N	2026-02-16 15:36:53.674247	2026-02-16 15:36:53.674247
14	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"ff0b07bc-96b4-43b6-a00f-b04d9aff7e6e","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/11"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-16T15:40:01.260636627Z","scheduled_at":"2026-02-16T15:40:01.260445581Z"}	0	ff0b07bc-96b4-43b6-a00f-b04d9aff7e6e	2026-02-16 15:40:01.260445	\N	\N	2026-02-16 15:40:01.2613	2026-02-16 15:40:01.2613
15	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"1427b853-48d9-4ce7-8233-bc4268f428f7","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/12"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-16T15:43:43.614356050Z","scheduled_at":"2026-02-16T15:43:43.614114361Z"}	0	1427b853-48d9-4ce7-8233-bc4268f428f7	2026-02-16 15:43:43.614114	\N	\N	2026-02-16 15:43:43.614745	2026-02-16 15:43:43.614745
16	default	ActiveStorage::PurgeJob	{"job_class":"ActiveStorage::PurgeJob","job_id":"0710aca2-2e3a-44db-b281-424efe830868","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/2"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-16T15:53:15.246650294Z","scheduled_at":"2026-02-16T15:53:15.246464197Z"}	0	0710aca2-2e3a-44db-b281-424efe830868	2026-02-16 15:53:15.246464	\N	\N	2026-02-16 15:53:15.24743	2026-02-16 15:53:15.24743
17	default	ActiveStorage::PurgeJob	{"job_class":"ActiveStorage::PurgeJob","job_id":"a561657c-fb93-4c3c-9e20-cb0f9d43e5e3","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/7"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-16T15:53:43.174932856Z","scheduled_at":"2026-02-16T15:53:43.174717999Z"}	0	a561657c-fb93-4c3c-9e20-cb0f9d43e5e3	2026-02-16 15:53:43.174717	\N	\N	2026-02-16 15:53:43.17539	2026-02-16 15:53:43.17539
18	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"c56c58a2-39f2-4791-89ed-c7e18bc85049","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/13"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-16T15:57:33.581977091Z","scheduled_at":"2026-02-16T15:57:33.581778565Z"}	0	c56c58a2-39f2-4791-89ed-c7e18bc85049	2026-02-16 15:57:33.581778	\N	\N	2026-02-16 15:57:33.582414	2026-02-16 15:57:33.582414
19	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"37d3121b-a976-487c-ba07-49b2c7050b13","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/14"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-17T11:36:35.185074548Z","scheduled_at":"2026-02-17T11:36:35.184661547Z"}	0	37d3121b-a976-487c-ba07-49b2c7050b13	2026-02-17 11:36:35.184661	\N	\N	2026-02-17 11:36:37.932016	2026-02-17 11:36:37.932016
20	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"d8a483e3-adf1-41d9-81c5-a51f71de5664","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/15"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-21T10:11:28.515351286Z","scheduled_at":"2026-02-21T10:11:28.515018278Z"}	0	d8a483e3-adf1-41d9-81c5-a51f71de5664	2026-02-21 10:11:28.515018	\N	\N	2026-02-21 10:11:31.045528	2026-02-21 10:11:31.045528
21	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"207f1716-cc46-434e-8aa8-ea8898ef2d61","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/16"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-21T10:13:49.920534157Z","scheduled_at":"2026-02-21T10:13:49.920203919Z"}	0	207f1716-cc46-434e-8aa8-ea8898ef2d61	2026-02-21 10:13:49.920203	\N	\N	2026-02-21 10:13:52.322138	2026-02-21 10:13:52.322138
22	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"2830261b-bed7-472c-9dc6-7ea86aa4f2c1","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/17"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-21T10:15:08.320345478Z","scheduled_at":"2026-02-21T10:15:08.320170214Z"}	0	2830261b-bed7-472c-9dc6-7ea86aa4f2c1	2026-02-21 10:15:08.32017	\N	\N	2026-02-21 10:15:08.320723	2026-02-21 10:15:08.320723
23	default	ActiveStorage::PurgeJob	{"job_class":"ActiveStorage::PurgeJob","job_id":"d7f06716-edab-4e85-bb5f-d88cee3ff977","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/17"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-21T10:15:40.854595805Z","scheduled_at":"2026-02-21T10:15:40.854422160Z"}	0	d7f06716-edab-4e85-bb5f-d88cee3ff977	2026-02-21 10:15:40.854422	\N	\N	2026-02-21 10:15:40.854968	2026-02-21 10:15:40.854968
24	default	ImportMasterSubscriptionJob	{"job_class":"ImportMasterSubscriptionJob","job_id":"f7ad328b-71e3-44f3-8743-1c42d4a2ef98","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[2,2026],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-21T12:06:20.100626588Z","scheduled_at":"2026-02-21T12:06:20.096576234Z"}	0	f7ad328b-71e3-44f3-8743-1c42d4a2ef98	2026-02-21 12:06:20.096576	\N	\N	2026-02-21 12:06:20.717464	2026-02-21 12:06:20.717464
25	default	ImportMasterSubscriptionJob	{"job_class":"ImportMasterSubscriptionJob","job_id":"6b384f9d-b54b-4cea-afed-cd53b1496ad8","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[2,2026],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-21T12:10:52.551623352Z","scheduled_at":"2026-02-21T12:10:52.551484474Z"}	0	6b384f9d-b54b-4cea-afed-cd53b1496ad8	2026-02-21 12:10:52.551484	\N	\N	2026-02-21 12:10:53.090857	2026-02-21 12:10:53.090857
26	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"60e9eec0-7d07-404a-a755-7e789248e1de","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/18"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-21T12:14:16.008162025Z","scheduled_at":"2026-02-21T12:14:16.007946450Z"}	0	60e9eec0-7d07-404a-a755-7e789248e1de	2026-02-21 12:14:16.007946	\N	\N	2026-02-21 12:14:16.53278	2026-02-21 12:14:16.53278
27	default	ImportMasterSubscriptionJob	{"job_class":"ImportMasterSubscriptionJob","job_id":"da4109e5-cdae-4238-81ac-d9fda8f05331","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[2,2026],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-21T15:40:33.513742572Z","scheduled_at":"2026-02-21T15:40:33.513695409Z"}	0	da4109e5-cdae-4238-81ac-d9fda8f05331	2026-02-21 15:40:33.513695	\N	\N	2026-02-21 15:40:34.12814	2026-02-21 15:40:34.12814
28	default	ImportMasterSubscriptionJob	{"job_class":"ImportMasterSubscriptionJob","job_id":"6d5235ed-99d9-49c8-8907-01762b90f4ac","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[2,2026],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-22T10:08:55.666369836Z","scheduled_at":"2026-02-22T10:08:55.665408706Z"}	0	6d5235ed-99d9-49c8-8907-01762b90f4ac	2026-02-22 10:08:55.665408	\N	\N	2026-02-22 10:08:56.209446	2026-02-22 10:08:56.209446
29	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"9453dffb-868b-4482-aed9-b3223892157d","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/19"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-23T12:37:56.820662923Z","scheduled_at":"2026-02-23T12:37:56.820147142Z"}	0	9453dffb-868b-4482-aed9-b3223892157d	2026-02-23 12:37:56.820147	\N	\N	2026-02-23 12:37:59.232192	2026-02-23 12:37:59.232192
30	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"0d31db1b-b8a4-405f-9a02-50e2d445c468","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/20"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-23T12:38:00.616603331Z","scheduled_at":"2026-02-23T12:38:00.616397325Z"}	0	0d31db1b-b8a4-405f-9a02-50e2d445c468	2026-02-23 12:38:00.616397	\N	\N	2026-02-23 12:38:00.617011	2026-02-23 12:38:00.617011
31	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"2d15cbf0-f9db-4078-afe8-e73d7751115b","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/21"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-24T01:34:56.491290297Z","scheduled_at":"2026-02-24T01:34:56.490237963Z"}	0	2d15cbf0-f9db-4078-afe8-e73d7751115b	2026-02-24 01:34:56.490237	\N	\N	2026-02-24 01:34:57.060309	2026-02-24 01:34:57.060309
32	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"67334cfd-0a5a-4734-88ea-6d86157cebb3","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/22"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-24T03:43:14.638157906Z","scheduled_at":"2026-02-24T03:43:14.637799885Z"}	0	67334cfd-0a5a-4734-88ea-6d86157cebb3	2026-02-24 03:43:14.637799	\N	\N	2026-02-24 03:43:17.111964	2026-02-24 03:43:17.111964
33	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"75c04e6e-1148-40b7-a1ed-075c1661e52e","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/23"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-24T03:43:46.275943379Z","scheduled_at":"2026-02-24T03:43:46.275723386Z"}	0	75c04e6e-1148-40b7-a1ed-075c1661e52e	2026-02-24 03:43:46.275723	\N	\N	2026-02-24 03:43:46.276401	2026-02-24 03:43:46.276401
34	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"aeee57f2-ad1e-4289-8d29-c59a7df7837f","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/24"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-24T03:44:11.235329178Z","scheduled_at":"2026-02-24T03:44:11.235143437Z"}	0	aeee57f2-ad1e-4289-8d29-c59a7df7837f	2026-02-24 03:44:11.235143	\N	\N	2026-02-24 03:44:11.235808	2026-02-24 03:44:11.235808
35	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"e621030c-cf7a-41bc-a3cd-3786791044a3","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/25"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-02-27T00:42:19.326259178Z","scheduled_at":"2026-02-27T00:42:19.323683818Z"}	0	e621030c-cf7a-41bc-a3cd-3786791044a3	2026-02-27 00:42:19.323683	\N	\N	2026-02-27 00:42:19.954412	2026-02-27 00:42:19.954412
36	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"d3277748-0b43-4b29-b6e0-ea4947b7bb14","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/26"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-03-04T06:38:37.543931263Z","scheduled_at":"2026-03-04T06:38:37.543606849Z"}	0	d3277748-0b43-4b29-b6e0-ea4947b7bb14	2026-03-04 06:38:37.543606	\N	\N	2026-03-04 06:38:37.663663	2026-03-04 06:38:37.663663
37	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"90f57244-98d2-4ada-b20c-f833c102c283","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://demo-farm-admin/ActiveStorage::Blob/27"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"Asia/Kolkata","enqueued_at":"2026-03-13T14:56:23.738751497Z","scheduled_at":"2026-03-13T14:56:23.738267507Z"}	0	90f57244-98d2-4ada-b20c-f833c102c283	2026-03-13 14:56:23.738267	\N	\N	2026-03-13 14:56:23.993585	2026-03-13 14:56:23.993585
\.


--
-- Data for Name: solid_queue_pauses; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.solid_queue_pauses (id, queue_name, created_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_processes; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.solid_queue_processes (id, kind, last_heartbeat_at, supervisor_id, pid, hostname, metadata, created_at, name) FROM stdin;
\.


--
-- Data for Name: solid_queue_ready_executions; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.solid_queue_ready_executions (id, job_id, queue_name, priority, created_at) FROM stdin;
1	1	default	0	2026-02-12 12:08:00.659859
2	2	default	0	2026-02-12 13:21:27.640663
3	3	default	0	2026-02-12 16:39:37.679176
4	4	default	0	2026-02-12 16:43:19.969805
5	5	default	0	2026-02-12 16:43:20.94988
6	6	default	0	2026-02-12 16:45:25.693479
7	7	default	0	2026-02-13 05:51:28.627623
8	8	default	0	2026-02-13 05:52:11.540424
9	9	default	0	2026-02-13 05:52:12.424767
10	10	default	0	2026-02-16 11:41:12.278278
11	11	default	0	2026-02-16 15:33:49.423897
12	12	default	0	2026-02-16 15:36:53.268588
13	13	default	0	2026-02-16 15:36:54.199201
14	14	default	0	2026-02-16 15:40:04.659369
15	15	default	0	2026-02-16 15:43:44.121434
16	16	default	0	2026-02-16 15:53:19.14923
17	17	default	0	2026-02-16 15:53:43.70142
18	18	default	0	2026-02-16 15:57:34.091297
19	19	default	0	2026-02-17 11:36:38.978225
20	20	default	0	2026-02-21 10:11:32.011118
21	21	default	0	2026-02-21 10:13:53.303348
22	22	default	0	2026-02-21 10:15:08.798475
23	23	default	0	2026-02-21 10:15:41.331665
24	24	default	0	2026-02-21 12:06:22.503679
25	25	default	0	2026-02-21 12:10:54.802315
26	26	default	0	2026-02-21 12:14:18.105218
27	27	default	0	2026-02-21 15:40:36.102443
28	28	default	0	2026-02-22 10:08:57.895861
29	29	default	0	2026-02-23 12:38:00.248349
30	30	default	0	2026-02-23 12:38:01.104664
31	31	default	0	2026-02-24 01:34:58.817153
32	32	default	0	2026-02-24 03:43:18.089017
33	33	default	0	2026-02-24 03:43:46.756886
34	34	default	0	2026-02-24 03:44:11.717307
35	35	default	0	2026-02-27 00:42:21.668974
36	36	default	0	2026-03-04 06:38:37.748088
37	37	default	0	2026-03-13 14:56:24.079832
\.


--
-- Data for Name: solid_queue_recurring_executions; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.solid_queue_recurring_executions (id, job_id, task_key, run_at, created_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_recurring_tasks; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.solid_queue_recurring_tasks (id, key, schedule, command, class_name, arguments, queue_name, priority, static, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_scheduled_executions; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.solid_queue_scheduled_executions (id, job_id, queue_name, priority, scheduled_at, created_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_semaphores; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.solid_queue_semaphores (id, key, value, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: stock_batches; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.stock_batches (id, product_id, vendor_id, vendor_purchase_id, quantity_purchased, quantity_remaining, purchase_price, selling_price, batch_date, status, created_at, updated_at, store_id) FROM stdin;
40	15	11	\N	153.0	148.0	321.3	459.0	2026-03-15	active	2026-03-21 03:46:21.847439	2026-03-23 01:42:42.963084	\N
1	1	1	\N	500.0	488.9	80.0	120.0	2026-02-27	active	2026-02-27 00:43:59.189251	2026-03-04 15:03:52.132873	1
7	8	1	\N	499.0	489.0	50.0	59.99	2026-03-01	active	2026-03-01 10:50:20.176723	2026-03-06 02:15:54.377772	1
2	2	1	\N	32320.0	32320.0	80.0	110.0	2026-02-27	active	2026-02-27 00:45:51.008852	2026-02-27 00:45:51.008852	1
9	10	1	\N	499.0	494.0	50.0	60.0	2026-03-01	active	2026-03-01 10:51:32.742201	2026-03-01 13:26:28.424208	1
5	6	1	\N	500.0	500.0	100.0	110.0	2026-03-01	active	2026-03-01 10:29:07.67896	2026-03-04 10:09:44.612372	1
6	7	1	\N	54.0	29.0	40.0	76.0	2026-03-01	active	2026-03-01 10:29:48.462506	2026-03-02 07:32:16.333521	1
8	9	1	\N	499.0	497.0	50.0	60.0	2026-03-01	active	2026-03-01 10:51:00.778669	2026-03-02 07:40:36.999038	1
4	5	1	\N	499.0	484.5	1700.0	1800.0	2026-03-01	active	2026-03-01 10:28:33.270159	2026-03-06 07:28:06.859037	1
3	4	1	\N	100.0	99.0	800.0	900.0	2026-03-01	active	2026-03-01 10:27:46.047652	2026-03-02 07:42:40.189597	1
10	11	1	\N	231.0	230.0	140.0	150.0	2026-03-01	active	2026-03-01 10:53:27.715975	2026-03-02 07:43:36.205974	1
37	30	1	\N	100.0	100.0	45.0	60.0	2026-03-14	active	2026-03-14 08:56:31.894046	2026-03-14 08:56:31.894046	1
38	31	1	\N	50.0	50.0	120.0	150.0	2026-03-14	active	2026-03-14 08:56:31.918749	2026-03-14 08:56:31.918749	1
39	32	1	\N	25.0	25.0	200.0	300.0	2026-03-14	active	2026-03-14 08:56:31.944331	2026-03-14 08:56:31.944331	1
74	8	11	\N	10.0	10.0	42.0	60.0	2026-03-23	active	2026-03-23 01:42:45.232914	2026-03-23 01:42:45.232914	15
43	13	11	\N	53.0	53.0	77.0	110.0	2026-03-17	active	2026-03-21 03:46:26.891264	2026-03-21 03:46:26.891264	\N
44	6	11	\N	56.0	56.0	77.0	110.0	2026-03-19	active	2026-03-21 03:46:28.376569	2026-03-21 03:46:28.376569	\N
45	5	11	\N	114.0	114.0	1260.0	1800.0	2026-03-20	active	2026-03-21 03:46:29.863383	2026-03-21 03:46:29.863383	\N
46	22	11	\N	60.0	60.0	476.0	680.0	2026-03-16	active	2026-03-21 03:46:31.352486	2026-03-21 03:46:31.352486	\N
47	18	11	\N	99.0	99.0	342.3	489.0	2026-03-18	active	2026-03-21 03:46:32.844828	2026-03-21 03:46:32.844828	\N
48	9	11	\N	104.0	104.0	42.0	60.0	2026-03-14	active	2026-03-21 03:46:34.318571	2026-03-21 03:46:34.318571	\N
49	14	11	\N	85.0	85.0	69.986	99.98	2026-03-11	active	2026-03-21 03:46:35.787958	2026-03-21 03:46:35.787958	\N
50	2	11	\N	141.0	141.0	77.0	110.0	2026-03-14	active	2026-03-21 03:46:37.274344	2026-03-21 03:46:37.274344	\N
51	10	11	\N	137.0	137.0	42.0	60.0	2026-03-12	active	2026-03-21 03:46:38.76735	2026-03-21 03:46:38.76735	\N
52	21	11	\N	110.0	110.0	35.0	50.0	2026-03-15	active	2026-03-21 03:46:40.275411	2026-03-21 03:46:40.275411	\N
55	20	11	\N	152.0	152.0	70.0	100.0	2026-03-13	active	2026-03-21 03:46:44.738029	2026-03-21 03:46:44.738029	\N
56	19	11	\N	155.0	155.0	35.0	50.0	2026-03-19	active	2026-03-21 03:46:46.224989	2026-03-21 03:46:46.224989	\N
57	7	11	\N	149.0	149.0	53.2	76.0	2026-03-18	active	2026-03-21 03:46:48.319288	2026-03-21 03:46:48.319288	\N
58	1	11	\N	55.0	55.0	84.0	120.0	2026-03-14	active	2026-03-21 03:46:49.868705	2026-03-21 03:46:49.868705	\N
59	16	11	\N	111.0	111.0	70.0	100.0	2026-03-20	active	2026-03-21 03:46:51.366536	2026-03-21 03:46:51.366536	\N
60	23	11	\N	172.0	172.0	39.186	55.98	2026-03-13	active	2026-03-21 03:46:52.837967	2026-03-21 03:46:52.837967	\N
62	12	11	\N	72.0	72.0	70.0	100.0	2026-03-14	active	2026-03-21 03:46:55.80853	2026-03-21 03:46:55.80853	\N
63	24	11	\N	126.0	126.0	418.6	598.0	2026-03-16	active	2026-03-21 03:46:57.297536	2026-03-21 03:46:57.297536	\N
64	25	11	\N	50.0	50.0	279.3	399.0	2026-03-13	active	2026-03-21 03:46:58.789387	2026-03-21 03:46:58.789387	\N
65	26	11	\N	92.0	92.0	42.0	60.0	2026-03-12	active	2026-03-21 03:47:00.290481	2026-03-21 03:47:00.290481	\N
66	27	11	\N	192.0	192.0	105.0	150.0	2026-03-15	active	2026-03-21 03:47:01.784914	2026-03-21 03:47:01.784914	\N
67	28	11	\N	145.0	145.0	210.0	300.0	2026-03-11	active	2026-03-21 03:47:03.280792	2026-03-21 03:47:03.280792	\N
68	30	11	\N	113.0	113.0	42.0	60.0	2026-03-15	active	2026-03-21 03:47:04.849448	2026-03-21 03:47:04.849448	\N
69	31	11	\N	122.0	122.0	105.0	150.0	2026-03-12	active	2026-03-21 03:47:06.345767	2026-03-21 03:47:06.345767	\N
70	32	11	\N	109.0	109.0	210.0	300.0	2026-03-14	active	2026-03-21 03:47:07.840802	2026-03-21 03:47:07.840802	\N
36	29	10	8	10.0	6.5	30.0	60.0	2026-03-13	active	2026-03-13 14:29:24.030814	2026-03-21 04:02:51.873796	1
71	29	11	\N	145.0	136.0	42.0	60.0	2026-03-18	active	2026-03-21 03:47:09.314415	2026-03-31 11:06:49.326168	\N
73	15	11	\N	5.0	5.0	321.3	459.0	2026-03-23	active	2026-03-23 01:42:41.665807	2026-03-23 01:42:41.665807	15
41	8	11	\N	148.0	138.0	42.0	60.0	2026-03-11	active	2026-03-21 03:46:23.903268	2026-03-23 01:42:46.254583	\N
75	17	11	\N	15.0	15.0	56.0	80.0	2026-03-23	active	2026-03-23 01:42:48.610401	2026-03-23 01:42:48.610401	15
42	17	11	\N	78.0	63.0	56.0	80.0	2026-03-12	active	2026-03-21 03:46:25.395986	2026-03-23 01:42:49.839284	\N
88	15	1	\N	50.0	50.0	15.0	30.0	2026-03-31	active	2026-03-31 12:13:15.109887	2026-03-31 12:13:15.109887	25
76	29	11	\N	4.0	4.0	42.0	60.0	2026-03-23	active	2026-03-23 06:43:04.152945	2026-03-23 06:43:04.152945	31
54	11	11	\N	64.0	45.0	105.0	150.0	2026-03-20	active	2026-03-21 03:46:43.252877	2026-03-23 06:43:07.505533	\N
77	11	11	\N	19.0	19.0	105.0	150.0	2026-03-23	active	2026-03-23 06:43:08.115254	2026-03-23 06:43:08.115254	31
82	3	11	\N	5.0	5.0	1750.0	2500.0	2026-03-30	active	2026-03-30 06:54:40.685092	2026-03-30 06:54:40.685092	36
78	3	11	\N	5.0	5.0	1750.0	2500.0	2026-03-30	active	2026-03-30 02:58:01.997655	2026-03-30 02:58:01.997655	32
86	29	11	\N	5.0	5.0	42.0	60.0	2026-03-31	active	2026-03-31 11:06:50.870001	2026-03-31 11:06:50.870001	38
79	33	1	\N	5.0	5.0	22.98	100.0	2026-03-30	active	2026-03-30 02:58:17.324407	2026-03-30 02:58:17.324407	32
53	4	11	\N	98.0	93.0	630.0	900.0	2026-03-12	active	2026-03-21 03:46:41.772489	2026-03-31 11:06:55.153656	\N
80	3	11	\N	5.0	5.0	1750.0	2500.0	2026-03-30	active	2026-03-30 04:31:43.877895	2026-03-30 04:31:43.877895	33
87	4	11	\N	5.0	5.0	630.0	900.0	2026-03-31	active	2026-03-31 11:06:55.973863	2026-03-31 11:06:55.973863	38
81	33	1	\N	5.0	5.0	22.98	100.0	2026-03-30	active	2026-03-30 04:31:48.810611	2026-03-30 04:31:48.810611	33
83	33	1	\N	4.97	4.97	22.98	100.0	2026-03-30	active	2026-03-30 06:54:44.336511	2026-03-30 06:54:44.336511	36
89	8	1	\N	50.0	50.0	16.0	31.0	2026-03-31	active	2026-03-31 12:13:15.992926	2026-03-31 12:13:15.992926	25
61	3	11	\N	74.0	48.0	1750.0	2500.0	2026-03-15	active	2026-03-21 03:46:54.32301	2026-03-31 10:46:00.705036	\N
84	3	11	\N	10.0	10.0	1750.0	2500.0	2026-03-31	active	2026-03-31 10:46:01.587398	2026-03-31 10:46:01.587398	37
72	33	1	\N	34.0	3.03	22.98	100.0	2026-03-23	active	2026-03-23 00:21:51.490656	2026-03-31 10:46:04.775634	\N
85	33	1	\N	15.0	15.0	22.98	100.0	2026-03-31	active	2026-03-31 10:46:05.367142	2026-03-31 10:46:05.367142	37
90	17	1	\N	50.0	50.0	17.0	32.0	2026-03-31	active	2026-03-31 12:13:16.892066	2026-03-31 12:13:16.892066	25
92	35	1	\N	50.0	50.0	40.0	60.0	2026-03-31	active	2026-03-31 15:03:16.96009	2026-03-31 15:03:16.96009	\N
91	34	1	\N	50.0	48.0	50.0	60.0	2026-03-31	active	2026-03-31 14:51:44.853623	2026-03-31 15:06:25.755818	\N
93	36	1	\N	60.0	60.0	40.0	60.0	2026-03-31	active	2026-03-31 15:10:46.387679	2026-03-31 15:10:46.387679	\N
94	37	1	\N	500.0	495.0	80.0	100.0	2026-03-31	active	2026-03-31 15:14:05.36735	2026-03-31 15:15:40.032284	\N
\.


--
-- Data for Name: stock_movements; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.stock_movements (id, product_id, reference_type, reference_id, movement_type, quantity, stock_before, stock_after, notes, created_at, updated_at, store_id) FROM stdin;
1	1	adjustment	\N	added	500.00	0.00	500.00	Initial stock when product was created	2026-02-27 00:43:57.011025	2026-02-27 00:43:57.011025	1
2	2	adjustment	\N	added	32320.00	0.00	32320.00	Initial stock when product was created	2026-02-27 00:45:50.444343	2026-02-27 00:45:50.444343	1
3	4	adjustment	\N	added	100.00	0.00	100.00	Initial stock when product was created	2026-03-01 10:27:46.012214	2026-03-01 10:27:46.012214	1
4	5	adjustment	\N	added	499.00	0.00	499.00	Initial stock when product was created	2026-03-01 10:28:33.24363	2026-03-01 10:28:33.24363	1
5	6	adjustment	\N	added	3998.00	0.00	3998.00	Initial stock when product was created	2026-03-01 10:29:07.675531	2026-03-01 10:29:07.675531	1
6	7	adjustment	\N	added	54.00	0.00	54.00	Initial stock when product was created	2026-03-01 10:29:48.459043	2026-03-01 10:29:48.459043	1
7	8	adjustment	\N	added	499.00	0.00	499.00	Initial stock when product was created	2026-03-01 10:50:20.17163	2026-03-01 10:50:20.17163	1
8	9	adjustment	\N	added	499.00	0.00	499.00	Initial stock when product was created	2026-03-01 10:51:00.773375	2026-03-01 10:51:00.773375	1
9	10	adjustment	\N	added	499.00	0.00	499.00	Initial stock when product was created	2026-03-01 10:51:32.738568	2026-03-01 10:51:32.738568	1
10	11	adjustment	\N	added	231.00	0.00	231.00	Initial stock when product was created	2026-03-01 10:53:27.710184	2026-03-01 10:53:27.710184	1
127	29	vendor_purchase	8	added	10.00	0.00	10.00	Stock added from vendor purchase: VP000008 - Corn Nuchchu (Qty: 10.0)	2026-03-13 14:29:24.124608	2026-03-13 14:29:24.124608	1
128	29	booking	71	consumed	-1.50	10.00	8.50	Stock consumed for booking item: Corn Nuchchu (Qty: 1.5)	2026-03-13 14:58:54.034954	2026-03-13 14:58:54.034954	1
129	30	adjustment	\N	added	100.00	0.00	100.00	Initial stock when product was created	2026-03-14 08:56:31.79544	2026-03-14 08:56:31.79544	1
130	31	adjustment	\N	added	50.00	0.00	50.00	Initial stock when product was created	2026-03-14 08:56:31.912851	2026-03-14 08:56:31.912851	1
131	32	adjustment	\N	added	25.00	0.00	25.00	Initial stock when product was created	2026-03-14 08:56:31.938175	2026-03-14 08:56:31.938175	1
132	29	booking	72	consumed	-1.00	8.50	7.50	Stock consumed for booking item: Corn Nuchchu (Qty: 1.0)	2026-03-21 03:29:27.590993	2026-03-21 03:29:27.590993	\N
133	29	booking	73	consumed	-1.00	152.50	151.50	Stock consumed for booking item: Corn Nuchchu (Qty: 1.0)	2026-03-21 04:02:51.97042	2026-03-21 04:02:51.97042	\N
134	33	booking	74	consumed	-1.00	34.00	33.00	Stock consumed for booking item: A2 Ghee (Qty: 1.0)	2026-03-23 00:32:59.970367	2026-03-23 00:32:59.970367	\N
135	29	store_transfer	31	consumed	-4.00	145.00	141.00	Transferred 4.0 units to store: asdd	2026-03-23 06:43:05.258256	2026-03-23 06:43:05.258256	\N
136	29	store_transfer	31	added	4.00	0.00	4.00	Received 4.0 units from central inventory	2026-03-23 06:43:05.561337	2026-03-23 06:43:05.561337	31
137	11	store_transfer	31	consumed	-19.00	64.00	45.00	Transferred 19.0 units to store: asdd	2026-03-23 06:43:08.420153	2026-03-23 06:43:08.420153	\N
138	11	store_transfer	31	added	19.00	0.00	19.00	Received 19.0 units from central inventory	2026-03-23 06:43:08.725218	2026-03-23 06:43:08.725218	31
139	3	store_transfer	32	consumed	-5.00	74.00	69.00	Transferred 5.0 units to store: asddsdddddddddd	2026-03-30 02:58:04.739073	2026-03-30 02:58:04.739073	\N
140	3	store_transfer	32	added	5.00	0.00	5.00	Received 5.0 units from central inventory	2026-03-30 02:58:06.59208	2026-03-30 02:58:06.59208	32
141	33	store_transfer	32	consumed	-5.00	33.00	28.00	Transferred 5.0 units to store: asddsdddddddddd	2026-03-30 02:58:17.643689	2026-03-30 02:58:17.643689	\N
142	33	store_transfer	32	added	5.00	0.00	5.00	Received 5.0 units from central inventory	2026-03-30 02:58:18.305367	2026-03-30 02:58:18.305367	32
143	3	store_transfer	33	consumed	-5.00	69.00	64.00	Transferred 5.0 units to store: asddsdddddddddd sd	2026-03-30 04:31:44.924522	2026-03-30 04:31:44.924522	\N
144	3	store_transfer	33	added	5.00	0.00	5.00	Received 5.0 units from central inventory	2026-03-30 04:31:45.307098	2026-03-30 04:31:45.307098	33
145	33	store_transfer	33	consumed	-5.00	28.00	23.00	Transferred 5.0 units to store: asddsdddddddddd sd	2026-03-30 04:31:49.880156	2026-03-30 04:31:49.880156	\N
146	33	store_transfer	33	added	5.00	0.00	5.00	Received 5.0 units from central inventory	2026-03-30 04:31:50.184664	2026-03-30 04:31:50.184664	33
147	3	store_transfer	36	consumed	-5.00	64.00	59.00	Transferred 5.0 units to store: adds	2026-03-30 06:54:41.621318	2026-03-30 06:54:41.621318	\N
148	3	store_transfer	36	added	5.00	0.00	5.00	Received 5.0 units from central inventory	2026-03-30 06:54:41.92403	2026-03-30 06:54:41.92403	36
149	33	store_transfer	36	consumed	-4.97	23.00	18.03	Transferred 4.97 units to store: adds	2026-03-30 06:54:44.640373	2026-03-30 06:54:44.640373	\N
150	33	store_transfer	36	added	4.97	0.00	4.97	Received 4.97 units from central inventory	2026-03-30 06:54:44.941998	2026-03-30 06:54:44.941998	36
151	3	booking	75	consumed	-1.00	74.00	73.00	Stock consumed for booking item: A2 Ghee (Qty: 1.0)	2026-03-30 11:22:58.505451	2026-03-30 11:22:58.505451	\N
152	3	store_transfer	37	consumed	-10.00	58.00	48.00	Transferred 10.0 units to store: ravi	2026-03-31 10:46:02.731577	2026-03-31 10:46:02.731577	\N
153	3	store_transfer	37	added	10.00	0.00	10.00	Received 10.0 units from central inventory	2026-03-31 10:46:03.025896	2026-03-31 10:46:03.025896	37
154	33	store_transfer	37	consumed	-15.00	18.03	3.03	Transferred 15.0 units to store: ravi	2026-03-31 10:46:05.663573	2026-03-31 10:46:05.663573	\N
155	33	store_transfer	37	added	15.00	0.00	15.00	Received 15.0 units from central inventory	2026-03-31 10:46:05.954458	2026-03-31 10:46:05.954458	37
156	29	store_transfer	38	consumed	-5.00	141.00	136.00	Transferred 5.0 units to store: raju	2026-03-31 11:06:52.18689	2026-03-31 11:06:52.18689	\N
157	29	store_transfer	38	added	5.00	0.00	5.00	Received 5.0 units from central inventory	2026-03-31 11:06:52.594112	2026-03-31 11:06:52.594112	38
158	4	store_transfer	38	consumed	-5.00	98.00	93.00	Transferred 5.0 units to store: raju	2026-03-31 11:06:56.384257	2026-03-31 11:06:56.384257	\N
159	4	store_transfer	38	added	5.00	0.00	5.00	Received 5.0 units from central inventory	2026-03-31 11:06:56.790806	2026-03-31 11:06:56.790806	38
160	34	adjustment	\N	added	50.00	0.00	50.00	Initial stock when product was created	2026-03-31 14:51:44.700225	2026-03-31 14:51:44.700225	\N
161	34	booking	76	consumed	-1.00	50.00	49.00	Stock consumed for booking item: Sajje (Qty: 1.0)	2026-03-31 14:58:27.481329	2026-03-31 14:58:27.481329	\N
162	35	adjustment	\N	added	50.00	0.00	50.00	Initial stock when product was created	2026-03-31 15:03:16.953405	2026-03-31 15:03:16.953405	\N
163	34	booking	77	consumed	-1.00	49.00	48.00	Stock consumed for booking item: Sajje (Qty: 1.0)	2026-03-31 15:06:25.859701	2026-03-31 15:06:25.859701	\N
164	36	adjustment	\N	added	60.00	0.00	60.00	Initial stock when product was created	2026-03-31 15:10:46.361668	2026-03-31 15:10:46.361668	\N
165	37	adjustment	\N	added	500.00	0.00	500.00	Initial stock when product was created	2026-03-31 15:14:05.354942	2026-03-31 15:14:05.354942	\N
166	37	booking	78	consumed	-5.00	500.00	495.00	Stock consumed for booking item: Apple (Qty: 5.0)	2026-03-31 15:15:40.056905	2026-03-31 15:15:40.056905	\N
\.


--
-- Data for Name: store_inventory_transfers; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.store_inventory_transfers (id, product_id, from_store_id, to_store_id, initiated_by_id, approved_by_id, quantity, transfer_price, status, notes, transfer_reference_number, courier_details, tracking_number, initiated_at, approved_at, shipped_at, completed_at, cancelled_at, transfer_metadata, shipping_cost, estimated_delivery_days, created_at, updated_at) FROM stdin;
1	29	\N	31	1	\N	4.00	\N	completed	Initial inventory allocation for new store: asdd	INITIAL31291774248181	\N	\N	2026-03-23 06:43:01.230481	2026-03-23 06:43:01.230553	\N	2026-03-23 06:43:01.230571	\N	\N	\N	\N	2026-03-23 06:43:02.180845	2026-03-23 06:43:02.180845
2	11	\N	31	1	\N	19.00	\N	completed	Initial inventory allocation for new store: asdd	INITIAL31111774248186	\N	\N	2026-03-23 06:43:06.502579	2026-03-23 06:43:06.502611	\N	2026-03-23 06:43:06.502619	\N	\N	\N	\N	2026-03-23 06:43:06.879393	2026-03-23 06:43:06.879393
3	3	\N	32	1	\N	5.00	\N	completed	Initial inventory allocation for new store: asddsdddddddddd	INITIAL3231774839475	\N	\N	2026-03-30 02:57:55.007729	2026-03-30 02:57:55.007769	\N	2026-03-30 02:57:55.007784	\N	\N	\N	\N	2026-03-30 02:57:57.693104	2026-03-30 02:57:57.693104
4	33	\N	32	1	\N	5.00	\N	completed	Initial inventory allocation for new store: asddsdddddddddd	INITIAL32331774839492	\N	\N	2026-03-30 02:58:12.005062	2026-03-30 02:58:12.005135	\N	2026-03-30 02:58:12.005148	\N	\N	\N	\N	2026-03-30 02:58:12.635313	2026-03-30 02:58:12.635313
5	3	\N	33	1	\N	5.00	\N	completed	Initial inventory allocation for new store: asddsdddddddddd sd	INITIAL3331774845100	\N	\N	2026-03-30 04:31:40.494597	2026-03-30 04:31:40.494637	\N	2026-03-30 04:31:40.49465	\N	\N	\N	\N	2026-03-30 04:31:41.723058	2026-03-30 04:31:41.723058
6	33	\N	33	1	\N	5.00	\N	completed	Initial inventory allocation for new store: asddsdddddddddd sd	INITIAL33331774845106	\N	\N	2026-03-30 04:31:46.433897	2026-03-30 04:31:46.433929	\N	2026-03-30 04:31:46.433937	\N	\N	\N	\N	2026-03-30 04:31:46.842208	2026-03-30 04:31:46.842208
7	3	\N	36	1	\N	5.00	\N	completed	Initial inventory allocation for new store: adds	INITIAL3631774853677	\N	\N	2026-03-30 06:54:37.885185	2026-03-30 06:54:37.885204	\N	2026-03-30 06:54:37.885208	\N	\N	\N	\N	2026-03-30 06:54:38.818387	2026-03-30 06:54:38.818387
8	33	\N	36	1	\N	4.97	\N	completed	Initial inventory allocation for new store: adds	INITIAL36331774853682	\N	\N	2026-03-30 06:54:42.829852	2026-03-30 06:54:42.82991	\N	2026-03-30 06:54:42.829932	\N	\N	\N	\N	2026-03-30 06:54:43.134827	2026-03-30 06:54:43.134827
9	3	\N	37	1	\N	10.00	\N	completed	Initial inventory allocation for new store: ravi	INITIAL3731774953959	\N	\N	2026-03-31 10:45:59.824812	2026-03-31 10:45:59.824853	\N	2026-03-31 10:45:59.824869	\N	\N	\N	\N	2026-03-31 10:46:00.113606	2026-03-31 10:46:00.113606
10	33	\N	37	1	\N	15.00	\N	completed	Initial inventory allocation for new store: ravi	INITIAL37331774953963	\N	\N	2026-03-31 10:46:03.903116	2026-03-31 10:46:03.903153	\N	2026-03-31 10:46:03.903162	\N	\N	\N	\N	2026-03-31 10:46:04.19425	2026-03-31 10:46:04.19425
11	29	\N	38	1	\N	5.00	\N	completed	Initial inventory allocation for new store: raju	INITIAL38291774955206	\N	\N	2026-03-31 11:06:46.857025	2026-03-31 11:06:46.857043	\N	2026-03-31 11:06:46.857047	\N	\N	\N	\N	2026-03-31 11:06:47.98523	2026-03-31 11:06:47.98523
12	4	\N	38	1	\N	5.00	\N	completed	Initial inventory allocation for new store: raju	INITIAL3841774955213	\N	\N	2026-03-31 11:06:53.922579	2026-03-31 11:06:53.922606	\N	2026-03-31 11:06:53.922615	\N	\N	\N	\N	2026-03-31 11:06:54.333495	2026-03-31 11:06:54.333495
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.stores (id, name, description, address, city, state, pincode, contact_person, contact_mobile, email, status, gst_no, created_at, updated_at, store_admin_user_id, inventory_management_enabled, auto_transfer_threshold, manager_email, operating_hours, timezone, admin_plain_password) FROM stdin;
1	Atma Nirbhar Farm - Main Store	\N	123 Main Street, Sector 5	Mumbai	Maharashtra	400001	Rajesh Kumar	9876543210	mainstore@atmanirbharfarm.com	t	\N	2026-03-05 01:47:28.863945	2026-03-05 01:47:28.863945	\N	t	10.00	\N	\N	UTC	\N
2	Atma Nirbhar Farm - Branch Store	\N	456 Park Avenue, Near Mall	Mumbai	Maharashtra	400002	Sunita Sharma	9876543211	branchstore@atmanirbharfarm.com	t	\N	2026-03-05 01:47:30.305813	2026-03-05 01:47:30.305813	\N	t	10.00	\N	\N	UTC	\N
11	Basic Store 1774228542	Basic test store without admin creation	123 Main Street, Tech Park	Bangalore	Karnataka	560068	Mahadev Bhat	9876528542	basicstore1774228542@test.com	t	\N	2026-03-23 01:15:49.790798	2026-03-23 01:15:49.790798	\N	t	10.00	\N	\N	UTC	\N
15	Enhanced Demo Store 1774230146	Demo store created with enhanced interface	123 Demo Street, Tech Hub	Mumbai	Maharashtra	400001	Demo Manager	7777761299	demo1774230146@enhancedstore.com	t	\N	2026-03-23 01:42:38.983658	2026-03-23 01:42:38.983658	\N	t	10.00	\N	\N	UTC	\N
16	Basic Store 1774238903	Basic test store without admin creation	123 Main Street, Tech Park	Bangalore	Karnataka	560068	Mahadev Bhat	9876538903	basicstore1774238903@test.com	t	\N	2026-03-23 04:08:39.360458	2026-03-23 04:08:39.360458	\N	t	10.00	\N	\N	UTC	\N
25	StepTestStore74038	\N	123 Step Test Road	Kolkata	West Bengal	700001	Step Test	8177424087	stepstore74038@debug.local	t	\N	2026-03-23 04:41:17.898639	2026-03-23 04:41:22.307621	100	t	10.00	\N	\N	UTC	\N
28	TransTestStore27482	\N	123 Transaction Test Road	Delhi	Delhi	110001	Trans Test	8177424125	transstore27482@debug.local	t	\N	2026-03-23 04:47:47.223671	2026-03-23 04:47:54.924539	103	t	10.00	\N	\N	UTC	\N
29	Complete Admin Test Store	\N	123 Complete Test St	Delhi	Delhi	110001	Test Contact	9123456789		t	\N	2026-03-23 04:51:38.628129	2026-03-23 04:51:47.067531	104	t	10.00	\N	\N	UTC	\N
30	CompleteUniqueStore1774241488636	Complete test store with all fields	999 Unique Test Boulevard	Pune	Maharashtra	411001	Unique Test Manager	8177424148	store1774241488636@uniquetest7685.local	t	\N	2026-03-23 04:51:42.56515	2026-03-23 04:51:51.273764	105	t	10.00	\N	\N	UTC	\N
31	asdd	\N	dfd	Bangalore	karnataka	560068	Store Administrator	9876543210		t		2026-03-23 06:42:55.264126	2026-03-23 06:43:00.131289	106	t	10.00	\N	\N	UTC	\N
32	asddsdddddddddd	\N	dfd	Bangalore	karnataka	560068	Store Administrator	9876543210		t		2026-03-30 02:57:37.678304	2026-03-30 02:57:50.649137	107	t	10.00	\N	\N	UTC	\N
33	asddsdddddddddd sd	\N	dfd	Bangalore	karnataka	560068	Store Administrator	9876543210		t		2026-03-30 04:31:33.65533	2026-03-30 04:31:39.3689	108	t	10.00	\N	\N	UTC	\N
34	Test Custom Store	\N	Test Address	Test City	Test State	123456	Store Manager	9876543210		t	\N	2026-03-30 05:01:05.704922	2026-03-30 05:01:16.649933	109	t	10.00	\N	\N	UTC	\N
35	Test Custom Password Store	\N	Test Address	Test City	Test State	123456	Store Manager	9876543210		t	\N	2026-03-30 06:51:14.464908	2026-03-30 06:51:23.068612	110	t	10.00	\N	\N	UTC	\N
36	adds	\N	dfd	Bangalore	karnataka	560068	Store Administrator	9876543210		t		2026-03-30 06:54:32.447743	2026-03-30 06:54:36.97444	111	t	10.00	\N	\N	UTC	\N
37	ravi	\N	dfd	Bangalore	karnataka	560068	Store Administrator	9876543210		t		2026-03-31 10:45:54.634963	2026-03-31 10:45:58.95552	112	t	10.00	\N	\N	UTC	\N
38	raju	\N	dfd	Bangalore	karnataka	560068	Store Administrator	9876543210		t		2026-03-31 11:06:39.478258	2026-03-31 11:06:44.605338	113	t	10.00	\N	\N	UTC	\N
39	Test Password Store	\N	Test Address	Test City	Test State	123456	Store Manager	9876543210		t	\N	2026-03-31 11:56:09.011106	2026-03-31 11:56:12.32339	114	t	10.00	\N	\N	UTC	mycustompassword123
\.


--
-- Data for Name: sub_agents; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.sub_agents (id, first_name, last_name, middle_name, email, mobile, password_digest, plain_password, original_password, role_id, gender, birth_date, pan_no, aadhar_no, gst_no, company_name, address, city, state, pincode, country, profile_picture, bank_name, account_no, ifsc_code, account_holder_name, account_type, upi_id, emergency_contact_name, emergency_contact_mobile, joining_date, salary, notes, status, distributor_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: subscription_templates; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.subscription_templates (id, customer_id, product_id, delivery_person_id, quantity, unit, price, delivery_time, is_active, template_name, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: system_settings; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.system_settings (id, key, value, setting_type, description, default_main_agent_commission, default_affiliate_commission, default_ambassador_commission, default_company_expenses, created_at, updated_at, business_name, address, mobile, email, gstin, pan_number, account_holder_name, bank_name, account_number, ifsc_code, upi_id, qr_code_path, terms_and_conditions, collect_from_store_enabled) FROM stdin;
2	system_config	system configuration	configuration	System configuration settings	\N	\N	\N	\N	2026-03-05 01:47:25.091333	2026-03-05 01:47:26.515289	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t
1	business_config	business configuration	configuration	Business configuration settings	\N	\N	\N	\N	2026-03-04 04:27:24.717793	2026-03-08 00:16:09.287302	Marali Santhe	#827 4th main 9th Block 2nd Stage Near Hanumagiri temple Nagarbhavi, Bangalore, Karnataka, 560072\r\n	+91 99728 08044	maralisanthe@gmail.com	29AOIPT8113K1ZC	AOIPT8113K	Marali Santhe	CNRB0003194	3194201000718	Canara Bank	97373737387@ybl	/qr_codes/upi_qr_1.svg	1. Kindly Do Make Every Month Payment on or Before the 10th of The Month\r\n2. Kindly Share the Screenshot Immediately Once the Payment is Done to Confirm Your Payment\r\n	\N
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.user_roles (id, name, description, active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.users (id, first_name, last_name, email, mobile, created_at, updated_at, middle_name, encrypted_password, user_type, role, role_id, status, is_active, is_verified, birth_date, gender, pan_no, aadhar_no, gst_no, company_name, address, city, state, pincode, country, profile_picture, bank_name, account_no, ifsc_code, account_holder_name, account_type, upi_id, emergency_contact_name, emergency_contact_mobile, department, designation, joining_date, salary, employee_id, reporting_manager_id, permissions, sidebar_permissions, last_login_at, login_count, email_verified_at, mobile_verified_at, two_factor_enabled, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unlock_token, locked_at, failed_attempts, notes, created_by, updated_by, deleted_at, original_password, authenticatable_type, authenticatable_id, assigned_store_id, store_permissions, last_store_access, store_access_logs, notification_preferences) FROM stdin;
11	rajesh	ar	raj@gmail.com	9879879879	2026-02-22 02:23:10.503634	2026-02-22 02:23:10.503634		$2a$12$sEdCu6/LX.q3q1DfgKVqUOXOYay1MnQj5.IME1NNERLAi1cdEO3.u	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	123 Main Street, Apartment 4B	Mumbai	Maharashtra	400001	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
13	pramod	bhat	pramsddodbha8@gmail.com	9190939300	2026-02-22 06:28:33.603929	2026-02-22 06:28:33.603929	\N	$2a$12$b52KqulR5.Y1W065fax.le3bVlZShS6vXq0Sgso/J01skDp8w8bOC	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N		Unknown	Unknown	000000	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
14	Pramod	Bhatdds	pcramodsdsdbha8@gmail.com	919190939311	2026-02-22 10:03:21.269615	2026-02-22 10:03:21.269615	\N	$2a$12$JvhN0mbaJDfcZwDjGhpY2eFX7aAP7ssartSlAEOW6mQTeWXBQsqZO	delivery_person	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	dfddsddss dsafddgffg	Bangalore	Karnataka	560068	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
15	Harish	Bha	pramodbha8sadsds21@gmail.com	918383838383	2026-02-22 10:05:51.152716	2026-02-22 10:05:51.152716	\N	$2a$12$NsuBhxj6SaEicr45A8..guI7M60Vuf0/Qnn.bUKOBsK7CUFflvpi2	delivery_person	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	asdsa2332FDSFFDS FDSF	Bangalore	Karnataka	560068	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
16	Venu	Bhat	venubha147@gmail.com	9632850872	2026-02-23 00:46:33.465265	2026-02-23 00:46:33.465265	Mahadev	$2a$12$Zjon.Ib86IXzMa9G2Yl2AeFYXcYgXG4swpBkVFRjYZCFoA8.7n1ly	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	Girigjagr	Bangalore	Karnataka	560085	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
17	Shankar	Msdddddddd	pramdsdsodbha8@gmail.com	919876543219	2026-02-23 00:50:27.093359	2026-02-23 00:50:27.093359	\N	$2a$12$W6R3Fv2RCNOZ0nrmuHLQdu.tuZ59loFQ.IhZtb4ygW4S8ZTVICsL6	delivery_person	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	sddssssssssssssssssssssssssssssssssssssssssssssssssssss	Bangalore	Karnataka	560068	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
18	John	Doe	testfranchise@example.com	9876543211	2026-02-23 14:15:47.170576	2026-02-23 14:15:47.170576	\N	$2a$12$8TAjH6wro0.5rFAMhrR85uwPs0pLb6lYbQhIrSxk1xXuhHQxMcPAa	franchise	super_admin	1	t	t	f	\N	\N	\N	\N	\N	Test Franchise Store	123 Main Street	Mumbai	Maharashtra	400001	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
19	Raju	sir	abcd8@gmail.com	9898989898	2026-02-24 01:34:55.499488	2026-02-24 01:34:55.499488	\N	$2a$12$rhPaoBOfGJ42.bwJBf7d.OsQp1imOl1kCvJdhyb8vVEL4t4Cz1J/G	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N		Unknown	Unknown	000000	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
2	Test	User	test1771316179@example.com	#{Time.current.to_i}	2026-02-17 08:16:27.928046	2026-02-17 08:16:27.928046	\N	$2a$12$lcuFV/t5i17Ijx20z7YD2.vIEewChdDTJw9g8DqWp7EOy7pFjaFmi	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
4	Test Franchise Store	Franchise	franchise1@example.com	9876543210	2026-02-18 11:15:49.981965	2026-02-18 11:15:49.981965	\N	$2a$12$gCpRxuZtV8mXWz36cqp9G.4h.f818IwM40xv0wTHfLlMNR5fH7ig6	franchise	super_admin	1	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
20	Sk	Bhat	sdsddsds9393fdfds@gmail.com	919190939300	2026-02-24 01:58:23.83573	2026-02-24 01:58:23.83573	\N	$2a$12$vzKr/dMM7ukjofoNrCVxeeJt.bhGtpUlGtOcD0Y9L95rXCizV5Jse	delivery_person	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	dfddsssdsdsfdffdsfdssdfds fdsf	Bangalore	Karnataka	560068	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
5	Test	Customer	assasa@gmail.com	9393939393	2026-02-20 13:38:06.84574	2026-02-20 13:38:06.84574	Mobile	$2a$12$3SW.vAWgdHxGNvigekyuVOhY/VH2JNYVrgr./kf1Ru3kzit8oM1hu	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	123 Test Street, Test Area	Mumbai	Maharashtra	400001	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
6	Test	Customer	asseasa@gmail.com	9393939313	2026-02-21 02:39:16.334135	2026-02-21 02:39:16.334135	Mobile	$2a$12$dHpp7OPaWd/NCVCFZXzaO.Ldte9h//GsT4t06aOJC81smlQU/BJ1O	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	123 Test Street, Test Area	Mumbai	Maharashtra	400001	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
7	TestFixed	Customer	testfixed@example.com	9876543212	2026-02-21 02:43:48.821806	2026-02-21 02:43:48.821806	Web	$2a$12$wmi5NYGLdTJZMuhsAl9OKOX5pl4JfdLW33DtTVhScbfmQu9KizfWG	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	Test Address	Unknown	Unknown	000000	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
9	Manjunath	Bhat	sagar_mopagar@gmail.com	9900503118	2026-02-21 09:49:29.65782	2026-02-21 09:49:29.65782	\N	$2a$12$NC31BVw0f9R.2Sq9XDKTme6ElW01vO/a4iKXTgLREgVMGWma3QeZq	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N		Unknown	Unknown	000000	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
21	Pramod	Bhat	ajjs@gmail.com	9632850870	2026-02-24 13:41:32.475517	2026-02-24 13:41:32.475517	Rma	$2a$12$IHJxS67Ev6D.w7Gtx68qN.HZGH2rD0hjW3bopjE9SnA0iE9Qp/HyG	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	Fnd	Kumta	Karnataka	560085	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
22	 dsds2	Singh	rameedsddddd223dedddshd.kumar@example.com	9111111115	2026-02-25 14:01:09.472153	2026-02-25 14:01:09.472153	Kumar	$2a$12$EMGT1QtWHt38hF5Yx59E1OhuUHkl98PJNYqXJ57WMVyL5tSVeugh2	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	123 Milk Street, Mumbai, Maharashtra, 400001	Unknown	Unknown	000000	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
23	ram2	Sharma	pdddrisdedeedyad.sharma@example.com	9000000005	2026-02-25 14:01:34.493874	2026-02-25 14:01:34.493874	\N	$2a$12$9MD9l8gi7/bBJobiP3sL6e3JV0ai6nBkY3QTVCGmKksMZH9M2qoOi	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	456 Park Avenue, Delhi, 110001	Unknown	Unknown	000000	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
24	ram3	Patel	sduddddeeeeenidddl.patel@example.com	9333333335	2026-02-25 14:01:57.077671	2026-02-25 14:01:57.077671	Kumar	$2a$12$1x.aUWdRgDJc8axh.w5wEuAL6.S1K9s4vvKVgH0paygs8THUe7kp2	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	789 Society, Ahmedabad, Gujarat, 380001	Unknown	Unknown	000000	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
25	Test	Customer	test.customer@example.com	9111222333	2026-02-25 14:02:07.107736	2026-02-25 14:02:07.107736	\N	$2a$12$VZePivnlnQcKtfKh4DIbceFrax6axszPwtxZb4MHBDQzRARPb9H7i	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	\N	Unknown	Unknown	000000	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
26	Import	TestCustomer	import.test@example.com	9222333444	2026-02-25 14:02:13.252528	2026-02-25 14:02:13.252528	\N	$2a$12$mdhrx2qyFG7F40jEDlfuV..IPpvLmPyjxh63b521L9KKKIWWrsfdW	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	\N	Unknown	Unknown	000000	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
27	Venu	Singh	ramededsddddd223dedddshd.kumar@example.com	9111111100	2026-02-26 00:22:09.441268	2026-02-26 00:22:09.441268	Kumar	$2a$12$YKRcRM08xWKutGYK9swXwuOCV2ytRZIWmQBCf7F.S8vSn0Ue0/RPm	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	123 Milk Street, Mumbai, Maharashtra, 400001	Unknown	Unknown	000000	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
28	M R bhat	Sharma	pddddrisdedeedyad.sharma@example.com	9000000002	2026-02-26 00:22:32.197401	2026-02-26 00:22:32.197401	\N	$2a$12$mjzqsB7b7zzVXpClYzRhYOMt92nIGkYJY4JVv8afMzQ3bBsKybV2C	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	456 Park Avenue, Delhi, 110001	Unknown	Unknown	000000	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
29	Ravi	Patel	sdudddddeeeeenidddl.patel@example.com	9333333302	2026-02-26 00:22:53.144797	2026-02-26 00:22:53.144797	Kumar	$2a$12$TZNkX1c/6kNwI5gNXdPbq.EQJ35VHIYhGlCRQ1IrBn2ublzyC7f4.	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	789 Society, Ahmedabad, Gujarat, 380001	Unknown	Unknown	000000	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
52	Sudarshan	Delivery	prakash1@gmail.com	7022479208	2026-02-27 01:09:45.67113	2026-02-27 01:09:45.67113	\N	$2a$12$mfoGkwvzWjJdtUOE4XAyS.UF1syRIXmd/IpNydv9I0vmjxkRIjCU6	delivery_person	super_admin	3	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	atma@123	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
53	Sunil	Delivery	shashank@gmail.com	6360180817	2026-02-27 01:09:51.270301	2026-02-27 01:09:51.270301	\N	$2a$12$6SAtWhz60nmWpSMB4jsctOQ5S6mvEQTYN68b6lP07ALqQz0YSJCpy	delivery_person	super_admin	3	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	atma@123	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
54	Balu	Night	sudarshan@gmail.com	8073631979	2026-02-27 01:09:56.049615	2026-02-27 01:09:56.049615	\N	$2a$12$zzxOdObFB3K33nM9VrqjWOGmySYgCLDlBrGpAzUZVou/h2j2lcrHe	delivery_person	super_admin	3	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	atma@123	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
55	Vinay	Delivery	vinayvinay6118@gmail.com	8123281864	2026-02-27 01:10:00.861171	2026-02-27 01:10:00.861171	\N	$2a$12$FpAP8AJOm6juuLwRi0pGW.qUy3wvxxY2rHW0vsfCbsQ7cN6q18Vf.	delivery_person	super_admin	3	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	atma@123	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
56	Suresh	Delivery	suresh@gmail.com	9945151165	2026-02-27 01:10:05.835867	2026-02-27 01:10:05.835867	\N	$2a$12$nZQcZmhvIR3h019krhaYBO/zf3kmizBo69wpzBxCy1MwPVqBOqyKq	delivery_person	super_admin	3	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	atma@123	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
57	8th	Mail	rajeevjoshi1991@gmail.com	8792169096	2026-02-27 01:10:10.610194	2026-02-27 01:10:10.610194	\N	$2a$12$g1Weia9C9HMnEw.v/kIQAu6OQ7P3hS/1AyG/Qq5uHvid0xuKkVp62	delivery_person	super_admin	3	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	atma@123	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
58	Sharannu	Delivery	take12@email.com	8296805667	2026-02-27 01:10:15.887951	2026-02-27 01:10:15.887951	\N	$2a$12$9zZz35LLOLgYTVJ0R1Ce2.trzxmv6qYbItE2DIzlAciqH/Z2Ir436	delivery_person	super_admin	3	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	atma@123	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
59	Ravi	Delivery	rajeevjoshi91@gmail.com	7483263539	2026-02-27 01:10:20.534426	2026-02-27 01:10:20.534426	\N	$2a$12$OFSyTCEVwfrOrhqLkPt3gO0PyLowaXsDxPCexv4LzGae1I5ZZNcte	delivery_person	super_admin	3	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	atma@123	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
60	Banashankara	Delivery	bana@gmail.com	8310057511	2026-02-27 01:10:25.425011	2026-02-27 01:10:25.425011	\N	$2a$12$wlFxOoF6z2r49Auh.ShX/.jN040Aq9EO3A.xdQlb8OA7FgaHzKVUW	delivery_person	super_admin	3	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	atma@123	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
61	Office	Delivery	manjunath@gmail.com	8050158237	2026-02-27 01:10:30.16285	2026-02-27 01:10:30.16285	\N	$2a$12$BWzIXGxGU//f6St7K/Lud.KIT34VXdfjYosWjnEpkpeaMxAJ5y7Bm	delivery_person	super_admin	3	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	atma@123	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
62	Akash	B4	pramsdsdsodbha8@gmail.com	919010101010	2026-02-28 08:50:34.059885	2026-02-28 08:50:34.059885	\N	$2a$12$Zz4.Uq.NwEP81QT1HazBwu0TzDEg0jfTFwcNChLZjsupCX1rrxLMS	delivery_person	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	dfd Banaglore	Bangalore	Karnataka	560068	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
63	Night	Nigh	9898989898@gmail.com	919898989898	2026-02-28 09:37:14.811666	2026-02-28 09:37:14.811666	\N	$2a$12$VooXwH35P5o5P6KWzAIwt.XITBlOyztJnnfEuuEr5Km.7keyQ4gk.	delivery_person	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	9898989898 9898989898	Bangalore	Karnataka	560068	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
69	sads	abc	23ew32ewssew@gmail.com	+91 92928 18181	2026-03-05 15:55:12.924435	2026-03-05 15:55:12.924435	\N	$2a$12$8iDGn/LokB6.SwxDA6BCseDb1o8TJi6a3epH6rCQkdZJyMvDutKWy	franchise	super_admin	1	t	t	f	\N	\N	\N	\N	\N	abc	def	Bangalore	karnataka	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
70	John Doe	Franchise	test_franchise_#{Time.current.to_i}@example.com	+91 9999999999	2026-03-05 15:59:27.232892	2026-03-05 15:59:27.232892	\N	$2a$12$RL2x2L7CgyOfKb4vHKidO.qPv1yzcOblBfm2CLcTOaimiCkJnfp5W	franchise	super_admin	1	t	t	f	\N	\N	\N	\N	\N	Test Franchise	123 Test Street	Bangalore	Karnataka	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
66	Raju Test	Bahtd	9093939393fdsdfds@gmail.com	8737373737	2026-03-04 06:38:37.529423	2026-03-04 06:38:37.529423	\N	$2a$12$75wo8FIl6H0OfLDxE6W1o.ShkYh1LX9lExH95pTo9eAfaWLDe9bYS	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	dffd	Unknown	Unknown	000000	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
71	John Doe	Franchise	test_franchise_1772726408@example.com	+91 8888888888	2026-03-05 16:00:17.446833	2026-03-05 16:00:17.446833	\N	$2a$12$/wJRYSilBhx1r5qfAJlGoeRoRJb.jS48F83Ba6MiLUKnXQGRcL1YW	franchise	super_admin	1	t	t	f	\N	\N	\N	\N	\N	Test Franchise	123 Test Street	Bangalore	Karnataka	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
72	Test	Affiliate	test_affiliate_1772757232@example.com	+91 6666666666	2026-03-06 00:33:56.109528	2026-03-06 00:33:56.109528	\N	$2a$12$PlhUb1UJ2iI3tlOdonvZHOVdQUlGybXBEWf7oGNiTK3PL1QyfI5wC	affiliate	super_admin	2	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
74	sads	dds	90939393dfdf93fdfds@gmail.com	+91 99897 87878	2026-03-06 00:38:47.965685	2026-03-06 00:38:47.965685	\N	$2a$12$s4FxErJLRnRiK3/XLyfuqu9p.U238G6LC34Q0cbXxT5iwmfuBYbiC	franchise	super_admin	1	t	t	f	\N	\N	\N	\N	\N	dds	df	Bangalore	karnataka	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
75	pramod	bhat	909fre3939393fdfds@gmail.com	+91 78788 38383	2026-03-06 00:40:53.898815	2026-03-06 00:40:53.898815	\N	$2a$12$RLp0zBexuHUkqcwDONLsHO8YF4QksIKz10ltTme6UlNbF9bEqXo/u	affiliate	super_admin	2	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
73	pramod	bhat	test_final_1772757316@example.com	+91 81305 99805	2026-03-06 00:35:25.590259	2026-03-06 04:37:42.930948	\N	$2a$12$1YF/6GA5uey6v4bTddgZ8ejfKAsvdqlp0l6XD7y2av7/LcmtlFzbK	affiliate	super_admin	2	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	Affiliate	6	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
68	sads	abc	903342rewweewrrewrew93939393fdfds@gmail.com	+91 83838 38383	2026-03-05 15:54:35.618108	2026-03-06 05:21:57.824251	\N	$2a$12$cX8en9U77WTQvlQAFoCWgORJpm51B0mhnSMXHc7G4XTZZgB90qoBm	franchise	super_admin	1	t	t	f	\N	\N	\N	\N	\N	abc	def	Bangalore	karnataka	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	Franchise	2	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
77	Pramod Bhat	Franchise	pramodbha8@gmail.com	+91 8383838383	2026-03-06 11:39:52.046965	2026-03-06 11:39:58.45993	\N	$2a$12$IXVe34zbhUWExOfETwNxnuGu7ZWjWa4yJzDd3rdr8zph4M7xaaAvu	franchise	super_admin	1	t	t	f	\N	\N	\N	\N	\N	Pramod Bhat Franchise	123 Main Street	Bangalore	Karnataka	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
78	Rohan	Shetty	r.shetty@gmail.com	8899889900	2026-03-13 14:56:23.638064	2026-03-13 14:56:23.638064	\N	$2a$12$Ir2VwRK1LxgYxNfm5px1R.ln6hf7JzOV8//DSl583bQ6EmRqFmRD.	customer	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	#4th Main, 10th Cross, R K Layout, Padmanabha Nagar - 560070	Unknown	Unknown	000000	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
3	Test	Flash	testflash@example.com	8888888888	2026-02-17 09:20:32.118752	2026-03-21 03:21:10.908367	\N	$2a$12$W8MTCiUpdLYRKFNNINnDJOWUWkTHKYevDzpNcP3/oTzRfZ/BvhJZG	admin	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	["delivery_people"]	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{"all_stores_access":true,"can_create_stores":true,"can_manage_transfers":true,"can_assign_store_admins":true}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
65	jerew32	dsfds32	pramscfcodbha8@gmail.com	+91 75757 57575	2026-03-04 06:01:36.185719	2026-03-21 03:21:11.247621	\N	$2a$12$/zQoVA0CC4ill.8QiLcUUet60mzJWawb4zdr8o2IvVe/q7xMe8fZq	admin	super_admin	5	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	{"dashboard":{"view":true,"create":true,"edit":true,"delete":true},"bookings":{"view":true,"create":true,"edit":true,"delete":true}}	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	admin123	\N	\N	\N	{"all_stores_access":true,"can_create_stores":true,"can_manage_transfers":true,"can_assign_store_admins":true}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
87	Test	Admin	testadmin_1774228700@teststore1774228700.store	8765432700	2026-03-23 01:18:27.048135	2026-03-23 01:18:27.048135	\N	$2a$12$c0aQPn0MXr6tU8zKyQS5LeyCEpxHrSwhAi6O4M3HSQoSQvkAmD.w.	admin	super_admin	\N	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
91	Test	Admin	testadmin_1774238855@teststore1774238855.store	8765432855	2026-03-23 04:07:50.435865	2026-03-23 04:07:50.435865	\N	$2a$12$FbR5lfe.FoZVDtlHDaP35OrjfbWiPo1Ce.3IGpvXCLjKdfquJY6q6	admin	super_admin	\N	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
1	Admin	User	admin@dhanvantri-naturals.com	9999999999	2026-02-12 11:39:37.772197	2026-03-30 02:37:19.64003	\N	$2a$12$wriEvvHCfvp0LFjqwTZ2eexz62HeUN0RjZzlchcHM2R.mtxyLPYXq	admin	super_admin	\N	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	{"dashboard":{"view":true,"create":true,"edit":true,"delete":true},"bookings":{"view":true,"create":true,"edit":true,"delete":true},"stores":{"view":true,"create":true,"edit":true,"delete":true},"customer_formats":{"view":true,"create":true,"edit":true,"delete":true},"subscriptions":{"view":true,"create":true,"edit":true,"delete":true},"invoices":{"view":true,"create":true,"edit":true,"delete":true},"notes":{"view":true,"create":true,"edit":true,"delete":true},"pending_amounts":{"view":true,"create":true,"edit":true,"delete":true},"invoice_check":{"view":true,"create":true,"edit":true,"delete":true},"vendors":{"view":true,"create":true,"edit":true,"delete":true},"vendor_purchases":{"view":true,"create":true,"edit":true,"delete":true},"customers":{"view":true,"create":true,"edit":true,"delete":true},"categories":{"view":true,"create":true,"edit":true,"delete":true},"products":{"view":true,"create":true,"edit":true,"delete":true},"coupons":{"view":true,"create":true,"edit":true,"delete":true},"customer_wallets":{"view":true,"create":true,"edit":true,"delete":true},"franchises":{"view":true,"create":true,"edit":true,"delete":true},"affiliates":{"view":true,"create":true,"edit":true,"delete":true},"subscription_templates":{"view":true,"create":true,"edit":true,"delete":true},"delivery_people":{"view":true,"create":true,"edit":true,"delete":true},"imports":{"view":true,"create":true,"edit":true,"delete":true},"reports":{"view":true,"create":true,"edit":true,"delete":true},"system_settings":{"view":true,"create":true,"edit":true,"delete":true},"user_roles":{"view":true,"create":true,"edit":true,"delete":true},"banners":{"view":true,"create":true,"edit":true,"delete":true},"client_requests":{"view":true,"create":true,"edit":true,"delete":true},"helpdesk":{"view":true,"create":true,"edit":true,"delete":true},"users":{"view":true,"create":true,"edit":true,"delete":true},"leads":{"view":true,"create":true,"edit":true,"delete":true},"life_insurance":{"view":true,"create":true,"edit":true,"delete":true},"health_insurance":{"view":true,"create":true,"edit":true,"delete":true},"motor_insurance":{"view":true,"create":true,"edit":true,"delete":true},"other_insurance":{"view":true,"create":true,"edit":true,"delete":true},"roles":{"view":true,"create":true,"edit":true,"delete":true},"settings":{"view":true,"create":true,"edit":true,"delete":true},"referrals":{"view":true,"create":true,"edit":true,"delete":true}}	\N	0	\N	\N	f	\N	\N	2026-03-14 07:57:06.010858	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	{"all_stores_access":true,"can_create_stores":true,"can_manage_transfers":true,"can_assign_store_admins":true}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
107	Store	Admin	sdssddabc@gmail.com	+91 98798 79879	2026-03-30 02:57:41.000068	2026-03-30 03:44:08.671544	\N	$2a$12$WdQ0c7X7Fu0lMxBDPMF4WOpuw64NyH0MnTvV0CNq52zXuNZO1B0gu	store_admin	super_admin	\N	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	all	{"dashboard":{"view":true},"stores":{"view":true,"create":true,"update":true,"delete":true},"products":{"view":true,"create":true,"update":true,"delete":true},"categories":{"view":true,"create":true,"update":true,"delete":true},"inventory":{"view":true,"create":true,"update":true,"delete":true},"stock_batches":{"view":true,"create":true,"update":true,"delete":true},"stock_movements":{"view":true,"create":true,"update":true,"delete":true},"vendors":{"view":true,"create":true,"update":true,"delete":true},"bookings":{"view":true,"create":true,"update":true,"delete":true},"orders":{"view":true,"create":true,"update":true,"delete":true},"customers":{"view":true,"create":true,"update":true,"delete":true},"invoices":{"view":true,"create":true,"update":true,"delete":true},"reports":{"view":true},"settings":{"view":true,"update":true},"users":{"view":true,"create":true,"update":true,"delete":true}}	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	32	{"can_manage_inventory":true,"can_create_bookings":true,"can_view_reports":true,"can_request_transfers":true,"can_approve_transfers":true}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
109	Test	Admin	testadmin123@example.com	+91 98765 43211	2026-03-30 05:01:10.715283	2026-03-30 05:01:10.715283	\N	$2a$12$WxxRDxdASpBkLrsDosYtGeMSa57axvVAIeYSfX5Y3mynV6khRhhIu	store_admin	super_admin	\N	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	all	{"dashboard":{"view":true},"stores":{"view":true,"create":true,"update":true,"delete":true},"products":{"view":true,"create":true,"update":true,"delete":true},"categories":{"view":true,"create":true,"update":true,"delete":true},"inventory":{"view":true,"create":true,"update":true,"delete":true},"stock_batches":{"view":true,"create":true,"update":true,"delete":true},"stock_movements":{"view":true,"create":true,"update":true,"delete":true},"vendors":{"view":true,"create":true,"update":true,"delete":true},"bookings":{"view":true,"create":true,"update":true,"delete":true},"orders":{"view":true,"create":true,"update":true,"delete":true},"customers":{"view":true,"create":true,"update":true,"delete":true},"invoices":{"view":true,"create":true,"update":true,"delete":true},"reports":{"view":true},"settings":{"view":true,"update":true},"users":{"view":true,"create":true,"update":true,"delete":true}}	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	34	{"can_manage_inventory":true,"can_create_bookings":true,"can_view_reports":true,"can_request_transfers":true,"can_approve_transfers":true}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
108	Store	Admin	9093939393fdfds@gmail.com	+91 98399 29292	2026-03-30 04:31:35.534538	2026-03-31 11:06:57.207471	\N	$2a$12$ZfdMVd5Z.0y7TxbSZYGQuukyNJH7spmTKmNnBcAhJ9ZZlWu2sOshu	store_admin	super_admin	\N	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	all	{"dashboard":{"view":true},"stores":{"view":true,"create":true,"update":true,"delete":true},"products":{"view":true,"create":true,"update":true,"delete":true},"categories":{"view":true,"create":true,"update":true,"delete":true},"inventory":{"view":true,"create":true,"update":true,"delete":true},"stock_batches":{"view":true,"create":true,"update":true,"delete":true},"stock_movements":{"view":true,"create":true,"update":true,"delete":true},"vendors":{"view":true,"create":true,"update":true,"delete":true},"bookings":{"view":true,"create":true,"update":true,"delete":true},"orders":{"view":true,"create":true,"update":true,"delete":true},"customers":{"view":true,"create":true,"update":true,"delete":true},"invoices":{"view":true,"create":true,"update":true,"delete":true},"reports":{"view":true},"settings":{"view":true,"update":true},"users":{"view":true,"create":true,"update":true,"delete":true}}	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	33	{"can_manage_inventory":true,"can_create_bookings":true,"can_view_reports":true,"can_request_transfers":true,"can_approve_transfers":true}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
110	Custom	Admin	newstoretest1774853464@example.com	+91 98765 43299	2026-03-30 06:51:18.651677	2026-03-30 06:51:18.651677	\N	$2a$12$BYl7kMM3cEMZp6tTm4GwKe7nO4agO7FIdA1WUCXTLPN/YjRCK16Z6	store_admin	super_admin	\N	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	all	{"dashboard":{"view":true},"stores":{"view":true,"create":true,"update":true,"delete":true},"products":{"view":true,"create":true,"update":true,"delete":true},"categories":{"view":true,"create":true,"update":true,"delete":true},"inventory":{"view":true,"create":true,"update":true,"delete":true},"stock_batches":{"view":true,"create":true,"update":true,"delete":true},"stock_movements":{"view":true,"create":true,"update":true,"delete":true},"vendors":{"view":true,"create":true,"update":true,"delete":true},"bookings":{"view":true,"create":true,"update":true,"delete":true},"orders":{"view":true,"create":true,"update":true,"delete":true},"customers":{"view":true,"create":true,"update":true,"delete":true},"invoices":{"view":true,"create":true,"update":true,"delete":true},"reports":{"view":true},"settings":{"view":true,"update":true},"users":{"view":true,"create":true,"update":true,"delete":true}}	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	35	{"can_manage_inventory":true,"can_create_bookings":true,"can_view_reports":true,"can_request_transfers":true,"can_approve_transfers":true}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
106	Store	Admin	90939393sds93fdfds@gmail.com	+91 91909 39390	2026-03-23 06:42:57.049878	2026-03-31 11:06:55.973724	\N	$2a$12$LqFOrFwUQRMuKemtdVhDnuYapkZxng2ccVhFCoj4LsbneK21lsiqi	store_admin	super_admin	\N	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	all	{"dashboard":{"view":true},"stores":{"view":true,"create":true,"update":true,"delete":true},"products":{"view":true,"create":true,"update":true,"delete":true},"categories":{"view":true,"create":true,"update":true,"delete":true},"inventory":{"view":true,"create":true,"update":true,"delete":true},"stock_batches":{"view":true,"create":true,"update":true,"delete":true},"stock_movements":{"view":true,"create":true,"update":true,"delete":true},"vendors":{"view":true,"create":true,"update":true,"delete":true},"bookings":{"view":true,"create":true,"update":true,"delete":true},"orders":{"view":true,"create":true,"update":true,"delete":true},"customers":{"view":true,"create":true,"update":true,"delete":true},"invoices":{"view":true,"create":true,"update":true,"delete":true},"reports":{"view":true},"settings":{"view":true,"update":true},"users":{"view":true,"create":true,"update":true,"delete":true}}	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	31	{"can_manage_inventory":true,"can_create_bookings":true,"can_view_reports":true,"can_request_transfers":true,"can_approve_transfers":true}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
100	Step	Admin	steptest1774240870068_74038@debug.local	7177424087	2026-03-23 04:41:20.278906	2026-03-31 11:06:51.261903	\N	$2a$12$7U0FQzuNBWE4.NI7TzRpWO5mPv8KsGcPwqYRV8XjUK0VL2TN7dnQK	store_admin	super_admin	\N	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	25	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
103	Trans	Admin	transtest1774241255764_27482@debug.local	7177424125	2026-03-23 04:47:51.511404	2026-03-31 11:06:52.162326	\N	$2a$12$udKp9J2eKCd1cmmyyTvVMuvy6LT6uFO5HCBpst8emqJdHPyLJ73Ha	store_admin	super_admin	\N	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	28	{}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
112	Store	Admin	90sdss93939393fdfds@gmail.com	+91 82828 28282	2026-03-31 10:45:56.057422	2026-03-31 10:45:56.057422	\N	$2a$12$owNMggxJ1vwfdxQaspvB2ueK7vkdDcv8Sk/L9hhqD.3IcbZYbJae2	store_admin	super_admin	\N	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	all	{"dashboard":{"view":true},"stores":{"view":true,"create":true,"update":true,"delete":true},"products":{"view":true,"create":true,"update":true,"delete":true},"categories":{"view":true,"create":true,"update":true,"delete":true},"inventory":{"view":true,"create":true,"update":true,"delete":true},"stock_batches":{"view":true,"create":true,"update":true,"delete":true},"stock_movements":{"view":true,"create":true,"update":true,"delete":true},"vendors":{"view":true,"create":true,"update":true,"delete":true},"bookings":{"view":true,"create":true,"update":true,"delete":true},"orders":{"view":true,"create":true,"update":true,"delete":true},"customers":{"view":true,"create":true,"update":true,"delete":true},"invoices":{"view":true,"create":true,"update":true,"delete":true},"reports":{"view":true},"settings":{"view":true,"update":true},"users":{"view":true,"create":true,"update":true,"delete":true}}	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	37	{"can_manage_inventory":true,"can_create_bookings":true,"can_view_reports":true,"can_request_transfers":true,"can_approve_transfers":true}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
111	Store	Admin	90939393sdd93fdfds@gmail.com	+91 89233 43434	2026-03-30 06:54:33.901054	2026-03-30 06:54:33.901054	\N	$2a$12$.Z8sgEKs3B9MD7.5yetXO.QTfzrIFPq7HF5wpSbmZWqTBhbYsLkIi	store_admin	super_admin	\N	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	all	{"dashboard":{"view":true},"stores":{"view":true,"create":true,"update":true,"delete":true},"products":{"view":true,"create":true,"update":true,"delete":true},"categories":{"view":true,"create":true,"update":true,"delete":true},"inventory":{"view":true,"create":true,"update":true,"delete":true},"stock_batches":{"view":true,"create":true,"update":true,"delete":true},"stock_movements":{"view":true,"create":true,"update":true,"delete":true},"vendors":{"view":true,"create":true,"update":true,"delete":true},"bookings":{"view":true,"create":true,"update":true,"delete":true},"orders":{"view":true,"create":true,"update":true,"delete":true},"customers":{"view":true,"create":true,"update":true,"delete":true},"invoices":{"view":true,"create":true,"update":true,"delete":true},"reports":{"view":true},"settings":{"view":true,"update":true},"users":{"view":true,"create":true,"update":true,"delete":true}}	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	36	{"can_manage_inventory":true,"can_create_bookings":true,"can_view_reports":true,"can_request_transfers":true,"can_approve_transfers":true}	2026-03-31 10:55:30.062281	[{"timestamp":"2026-03-30T12:32:25+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T15:01:45+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T15:11:41+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T15:12:21+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T15:12:36+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:00:53+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:01:01+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:03:51+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:03:59+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:10:19+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:10:25+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:10:37+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:10:49+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:12:16+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:12:19+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:12:23+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:12:32+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:50:01+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:50:29+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:50:40+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:51:46+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:51:50+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:52:00+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:52:45+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T16:53:01+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:16:14+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:19:05+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:20:01+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:20:08+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:20:55+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:21:18+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:21:19+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:21:31+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:21:40+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:22:44+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:23:04+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:25:26+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:25:39+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:30:16+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:32:55+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:33:42+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:34:26+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:38:15+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:38:19+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:38:31+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:41:16+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:41:42+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:42:47+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-30T18:45:12+05:30","store_id":36,"store_name":"adds"},{"timestamp":"2026-03-31T16:25:30+05:30","store_id":36,"store_name":"adds"}]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
104	Complete	TestUser	finaltest1774241494@finaltest.com	7000000001	2026-03-23 04:51:42.20471	2026-03-31 11:06:53.628737	\N	$2a$12$.RasKQibLUUOjQ9ZmXvU8uUTTn5hpR7DfmzdRTaM3Wt2ZkXPFhNQ6	store_admin	super_admin	\N	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	all	{"dashboard":{"view":true},"stores":{"view":true,"create":true,"update":true,"delete":true},"products":{"view":true,"create":true,"update":true,"delete":true},"categories":{"view":true,"create":true,"update":true,"delete":true},"inventory":{"view":true,"create":true,"update":true,"delete":true},"stock_batches":{"view":true,"create":true,"update":true,"delete":true},"stock_movements":{"view":true,"create":true,"update":true,"delete":true},"vendors":{"view":true,"create":true,"update":true,"delete":true},"bookings":{"view":true,"create":true,"update":true,"delete":true},"orders":{"view":true,"create":true,"update":true,"delete":true},"customers":{"view":true,"create":true,"update":true,"delete":true},"invoices":{"view":true,"create":true,"update":true,"delete":true},"reports":{"view":true},"settings":{"view":true,"update":true},"users":{"view":true,"create":true,"update":true,"delete":true}}	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	29	{"can_manage_inventory":true,"can_create_bookings":true,"can_view_reports":true,"can_request_transfers":true,"can_approve_transfers":true}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
105	Unique	Administrator	admin1774241488636@uniquetest7685.local	7177424148	2026-03-23 04:51:47.577401	2026-03-31 11:06:54.742702	\N	$2a$12$V86zUhCWaX2/tlF/Db7zi.klF15LafwGjoN6W7ydHKLRRSkq94kJK	store_admin	super_admin	\N	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	all	{"dashboard":{"view":true},"stores":{"view":true,"create":true,"update":true,"delete":true},"products":{"view":true,"create":true,"update":true,"delete":true},"categories":{"view":true,"create":true,"update":true,"delete":true},"inventory":{"view":true,"create":true,"update":true,"delete":true},"stock_batches":{"view":true,"create":true,"update":true,"delete":true},"stock_movements":{"view":true,"create":true,"update":true,"delete":true},"vendors":{"view":true,"create":true,"update":true,"delete":true},"bookings":{"view":true,"create":true,"update":true,"delete":true},"orders":{"view":true,"create":true,"update":true,"delete":true},"customers":{"view":true,"create":true,"update":true,"delete":true},"invoices":{"view":true,"create":true,"update":true,"delete":true},"reports":{"view":true},"settings":{"view":true,"update":true},"users":{"view":true,"create":true,"update":true,"delete":true}}	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	30	{"can_manage_inventory":true,"can_create_bookings":true,"can_view_reports":true,"can_request_transfers":true,"can_approve_transfers":true}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
114	Test	Admin	teststore1774958158@example.com	+91 98765 43210	2026-03-31 11:56:10.657198	2026-03-31 11:56:10.657198	\N	$2a$12$lReAXyOr4kOkt7wrwa80pOOHJS3MoF3r4bS5DdQ7Prm5Kt0TX.PjC	store_admin	super_admin	\N	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	all	{"dashboard":{"view":true},"stores":{"view":true,"create":true,"update":true,"delete":true},"products":{"view":true,"create":true,"update":true,"delete":true},"categories":{"view":true,"create":true,"update":true,"delete":true},"inventory":{"view":true,"create":true,"update":true,"delete":true},"stock_batches":{"view":true,"create":true,"update":true,"delete":true},"stock_movements":{"view":true,"create":true,"update":true,"delete":true},"vendors":{"view":true,"create":true,"update":true,"delete":true},"bookings":{"view":true,"create":true,"update":true,"delete":true},"orders":{"view":true,"create":true,"update":true,"delete":true},"customers":{"view":true,"create":true,"update":true,"delete":true},"invoices":{"view":true,"create":true,"update":true,"delete":true},"reports":{"view":true},"settings":{"view":true,"update":true},"users":{"view":true,"create":true,"update":true,"delete":true}}	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	39	{"can_manage_inventory":true,"can_create_bookings":true,"can_view_reports":true,"can_request_transfers":true,"can_approve_transfers":true}	\N	[]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
113	Store	Admin	909393dsds21saddsadsa9393fdfds@gmail.com	+91 82828 28181	2026-03-31 11:06:40.917538	2026-03-31 11:06:40.917538	\N	$2a$12$vPHpdu91TJXM9ZGEK6KN7.KXwt/h3ha.wnfAkFk6.tz4rF5ePQVBu	store_admin	super_admin	\N	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	all	{"dashboard":{"view":true},"stores":{"view":true,"create":true,"update":true,"delete":true},"products":{"view":true,"create":true,"update":true,"delete":true},"categories":{"view":true,"create":true,"update":true,"delete":true},"inventory":{"view":true,"create":true,"update":true,"delete":true},"stock_batches":{"view":true,"create":true,"update":true,"delete":true},"stock_movements":{"view":true,"create":true,"update":true,"delete":true},"vendors":{"view":true,"create":true,"update":true,"delete":true},"bookings":{"view":true,"create":true,"update":true,"delete":true},"orders":{"view":true,"create":true,"update":true,"delete":true},"customers":{"view":true,"create":true,"update":true,"delete":true},"invoices":{"view":true,"create":true,"update":true,"delete":true},"reports":{"view":true},"settings":{"view":true,"update":true},"users":{"view":true,"create":true,"update":true,"delete":true}}	\N	0	\N	\N	f	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	38	{"can_manage_inventory":true,"can_create_bookings":true,"can_view_reports":true,"can_request_transfers":true,"can_approve_transfers":true}	2026-03-31 12:00:17.943559	[{"timestamp":"2026-03-31T16:39:59+05:30","store_id":38,"store_name":"raju"},{"timestamp":"2026-03-31T16:40:45+05:30","store_id":38,"store_name":"raju"},{"timestamp":"2026-03-31T16:40:57+05:30","store_id":38,"store_name":"raju"},{"timestamp":"2026-03-31T16:41:02+05:30","store_id":38,"store_name":"raju"},{"timestamp":"2026-03-31T16:41:22+05:30","store_id":38,"store_name":"raju"},{"timestamp":"2026-03-31T16:41:29+05:30","store_id":38,"store_name":"raju"},{"timestamp":"2026-03-31T17:17:26+05:30","store_id":38,"store_name":"raju"},{"timestamp":"2026-03-31T17:17:34+05:30","store_id":38,"store_name":"raju"},{"timestamp":"2026-03-31T17:18:34+05:30","store_id":38,"store_name":"raju"},{"timestamp":"2026-03-31T17:19:12+05:30","store_id":38,"store_name":"raju"},{"timestamp":"2026-03-31T17:27:50+05:30","store_id":38,"store_name":"raju"},{"timestamp":"2026-03-31T17:28:18+05:30","store_id":38,"store_name":"raju"},{"timestamp":"2026-03-31T17:28:37+05:30","store_id":38,"store_name":"raju"},{"timestamp":"2026-03-31T17:30:17+05:30","store_id":38,"store_name":"raju"}]	{"low_stock_alerts":true,"transfer_notifications":true,"booking_alerts":true,"daily_reports":false}
\.


--
-- Data for Name: vendor_invoices; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.vendor_invoices (id, vendor_purchase_id, invoice_number, total_amount, status, invoice_date, share_token, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vendor_payments; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.vendor_payments (id, vendor_id, vendor_purchase_id, amount_paid, payment_date, payment_mode, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vendor_purchase_items; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.vendor_purchase_items (id, vendor_purchase_id, product_id, quantity, purchase_price, selling_price, line_total, created_at, updated_at) FROM stdin;
1	1	2	105.0	62.0	100.0	6510.0	2026-03-03 14:08:34.54955	2026-03-03 14:08:34.54955
2	2	2	100.0	62.0	100.0	6200.0	2026-03-03 14:09:54.377292	2026-03-03 14:09:54.377292
3	3	2	115.0	62.0	100.0	7130.0	2026-03-03 14:11:04.870483	2026-03-03 14:11:04.870483
4	4	2	140.0	61.0	100.0	8540.0	2026-03-03 14:12:10.638546	2026-03-03 14:12:10.638546
5	5	2	140.0	61.0	100.0	8540.0	2026-03-03 14:13:01.556446	2026-03-03 14:13:01.556446
6	6	2	130.0	61.0	100.0	7930.0	2026-03-03 14:13:38.400487	2026-03-03 14:13:38.400487
7	7	19	12.0	23.0	44.99	276.0	2026-03-04 04:37:33.567332	2026-03-04 04:37:33.567332
8	8	29	10.0	45.0	60.0	450.0	2026-03-13 14:29:23.978795	2026-03-14 08:04:26.072588
\.


--
-- Data for Name: vendor_purchases; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.vendor_purchases (id, vendor_id, purchase_date, total_amount, paid_amount, status, notes, created_at, updated_at) FROM stdin;
1	2	2026-03-01	6510.0	0.0	completed		2026-03-03 14:08:34.547114	2026-03-03 14:08:45.280224
2	2	2026-03-02	6200.0	0.0	completed		2026-03-03 14:09:54.375405	2026-03-03 14:10:01.412216
3	2	2026-03-03	7130.0	0.0	completed		2026-03-03 14:11:04.869118	2026-03-03 14:11:13.512088
4	3	2026-03-01	8540.0	0.0	completed		2026-03-03 14:12:10.636452	2026-03-03 14:12:17.460103
5	3	2026-03-02	8540.0	0.0	completed		2026-03-03 14:13:01.555044	2026-03-03 14:13:05.521362
6	3	2026-03-03	7930.0	0.0	completed		2026-03-03 14:13:38.399187	2026-03-03 14:13:42.060958
7	1	2026-03-04	276.0	0.0	pending	qs	2026-03-04 04:37:33.263975	2026-03-04 04:37:33.263975
8	10	2026-03-13	450.0	0.0	pending		2026-03-13 14:29:23.975351	2026-03-14 08:04:26.068656
\.


--
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.vendors (id, name, phone, email, address, payment_type, opening_balance, status, created_at, updated_at) FROM stdin;
1	System Default	0000000000	system@default.com	System Generated	Cash	\N	t	2026-02-27 00:43:58.095148	2026-02-27 00:43:58.095148
2	Arjun Shivali	+91 86608 30176		Attibele	Credit	200000.0	t	2026-03-03 13:47:50.532937	2026-03-03 13:47:50.532937
3	Murthy Harohalli	+91 96325 47143		Harohalli	Credit	114000.0	t	2026-03-03 13:50:10.301853	2026-03-03 13:50:10.301853
4	Sridhar Sogadu	+91 98455 67783		Tavarekere	Credit	\N	t	2026-03-03 13:51:37.242031	2026-03-03 13:51:37.242031
5	Krishna Kembavi	+91 70192 82943		Kalburgi	Credit	13000.0	t	2026-03-03 13:54:09.63627	2026-03-03 13:54:09.63627
6	Anand	+91 97997 47479		Mathikere	Credit	\N	t	2026-03-03 13:55:40.614759	2026-03-03 13:55:40.614759
7	Ajeesh Puthur	+91 72047 76221		Kengeri	Credit	16000.0	t	2026-03-03 13:57:16.341014	2026-03-03 13:57:16.341014
8	Danush	+91 73489 89058		Doddabalapura	Credit	20000.0	t	2026-03-03 13:58:56.090857	2026-03-03 13:58:56.090857
9	Gopal Kaivalya	+91 98457 98137		Kotigepalya	Credit	\N	t	2026-03-03 14:00:12.044288	2026-03-03 14:00:12.044288
10	Vedant Health Products	+91 99005 03117	ve-he-pro@gmail.com		Credit	\N	t	2026-03-13 14:28:09.091803	2026-03-13 14:28:09.091803
11	Central Supplier	9876543210	supplier@central.com	Central Supply Hub, Mumbai	Cash	\N	t	2026-03-21 03:46:19.071474	2026-03-21 03:46:19.071474
\.


--
-- Data for Name: wallet_transactions; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.wallet_transactions (id, customer_wallet_id, transaction_type, amount, balance_after, description, reference_number, metadata, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: wishlists; Type: TABLE DATA; Schema: public; Owner: dhan02_user
--

COPY public.wishlists (id, customer_id, product_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 27, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 27, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: affiliates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.affiliates_id_seq', 7, true);


--
-- Name: banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.banners_id_seq', 1, false);


--
-- Name: booking_invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.booking_invoices_id_seq', 26, true);


--
-- Name: booking_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.booking_items_id_seq', 95, true);


--
-- Name: booking_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.booking_schedules_id_seq', 1, false);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.bookings_id_seq', 78, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.categories_id_seq', 20, true);


--
-- Name: client_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.client_requests_id_seq', 3, true);


--
-- Name: coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.coupons_id_seq', 1, false);


--
-- Name: customer_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.customer_addresses_id_seq', 1, true);


--
-- Name: customer_formats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.customer_formats_id_seq', 320, true);


--
-- Name: customer_wallets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.customer_wallets_id_seq', 1, false);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.customers_id_seq', 477, true);


--
-- Name: delivery_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.delivery_people_id_seq', 12, true);


--
-- Name: delivery_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.delivery_rules_id_seq', 31, true);


--
-- Name: device_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.device_tokens_id_seq', 1, false);


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.expenses_id_seq', 1, true);


--
-- Name: franchises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.franchises_id_seq', 7, true);


--
-- Name: invoice_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.invoice_items_id_seq', 408, true);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.invoices_id_seq', 317, true);


--
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.leads_id_seq', 1, false);


--
-- Name: milk_delivery_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.milk_delivery_tasks_id_seq', 9463, true);


--
-- Name: milk_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.milk_subscriptions_id_seq', 335, true);


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.notes_id_seq', 28, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.order_items_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: pending_amounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.pending_amounts_id_seq', 32, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);


--
-- Name: product_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.product_ratings_id_seq', 1, false);


--
-- Name: product_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.product_reviews_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.products_id_seq', 37, true);


--
-- Name: referrals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.referrals_id_seq', 7, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.roles_id_seq', 7, true);


--
-- Name: sale_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.sale_items_id_seq', 1, false);


--
-- Name: solid_cache_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.solid_cache_entries_id_seq', 1, false);


--
-- Name: solid_queue_blocked_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.solid_queue_blocked_executions_id_seq', 1, false);


--
-- Name: solid_queue_claimed_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.solid_queue_claimed_executions_id_seq', 1, false);


--
-- Name: solid_queue_failed_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.solid_queue_failed_executions_id_seq', 1, false);


--
-- Name: solid_queue_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.solid_queue_jobs_id_seq', 37, true);


--
-- Name: solid_queue_pauses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.solid_queue_pauses_id_seq', 1, false);


--
-- Name: solid_queue_processes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.solid_queue_processes_id_seq', 1, false);


--
-- Name: solid_queue_ready_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.solid_queue_ready_executions_id_seq', 37, true);


--
-- Name: solid_queue_recurring_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.solid_queue_recurring_executions_id_seq', 1, false);


--
-- Name: solid_queue_recurring_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.solid_queue_recurring_tasks_id_seq', 1, false);


--
-- Name: solid_queue_scheduled_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.solid_queue_scheduled_executions_id_seq', 1, false);


--
-- Name: solid_queue_semaphores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.solid_queue_semaphores_id_seq', 1, false);


--
-- Name: stock_batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.stock_batches_id_seq', 94, true);


--
-- Name: stock_movements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.stock_movements_id_seq', 166, true);


--
-- Name: store_inventory_transfers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.store_inventory_transfers_id_seq', 12, true);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.stores_id_seq', 39, true);


--
-- Name: sub_agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.sub_agents_id_seq', 1, false);


--
-- Name: subscription_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.subscription_templates_id_seq', 1, false);


--
-- Name: system_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.system_settings_id_seq', 2, true);


--
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.user_roles_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.users_id_seq', 114, true);


--
-- Name: vendor_invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.vendor_invoices_id_seq', 1, false);


--
-- Name: vendor_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.vendor_payments_id_seq', 1, false);


--
-- Name: vendor_purchase_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.vendor_purchase_items_id_seq', 8, true);


--
-- Name: vendor_purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.vendor_purchases_id_seq', 8, true);


--
-- Name: vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.vendors_id_seq', 11, true);


--
-- Name: wallet_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.wallet_transactions_id_seq', 1, false);


--
-- Name: wishlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhan02_user
--

SELECT pg_catalog.setval('public.wishlists_id_seq', 1, false);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: affiliates affiliates_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.affiliates
    ADD CONSTRAINT affiliates_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: booking_invoices booking_invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.booking_invoices
    ADD CONSTRAINT booking_invoices_pkey PRIMARY KEY (id);


--
-- Name: booking_items booking_items_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.booking_items
    ADD CONSTRAINT booking_items_pkey PRIMARY KEY (id);


--
-- Name: booking_schedules booking_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.booking_schedules
    ADD CONSTRAINT booking_schedules_pkey PRIMARY KEY (id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: client_requests client_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.client_requests
    ADD CONSTRAINT client_requests_pkey PRIMARY KEY (id);


--
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: customer_addresses customer_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.customer_addresses
    ADD CONSTRAINT customer_addresses_pkey PRIMARY KEY (id);


--
-- Name: customer_formats customer_formats_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.customer_formats
    ADD CONSTRAINT customer_formats_pkey PRIMARY KEY (id);


--
-- Name: customer_wallets customer_wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.customer_wallets
    ADD CONSTRAINT customer_wallets_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: delivery_people delivery_people_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.delivery_people
    ADD CONSTRAINT delivery_people_pkey PRIMARY KEY (id);


--
-- Name: delivery_rules delivery_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.delivery_rules
    ADD CONSTRAINT delivery_rules_pkey PRIMARY KEY (id);


--
-- Name: device_tokens device_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.device_tokens
    ADD CONSTRAINT device_tokens_pkey PRIMARY KEY (id);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- Name: franchises franchises_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.franchises
    ADD CONSTRAINT franchises_pkey PRIMARY KEY (id);


--
-- Name: invoice_items invoice_items_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.invoice_items
    ADD CONSTRAINT invoice_items_pkey PRIMARY KEY (id);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: leads leads_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (id);


--
-- Name: milk_delivery_tasks milk_delivery_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.milk_delivery_tasks
    ADD CONSTRAINT milk_delivery_tasks_pkey PRIMARY KEY (id);


--
-- Name: milk_subscriptions milk_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.milk_subscriptions
    ADD CONSTRAINT milk_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: pending_amounts pending_amounts_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.pending_amounts
    ADD CONSTRAINT pending_amounts_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: product_ratings product_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.product_ratings
    ADD CONSTRAINT product_ratings_pkey PRIMARY KEY (id);


--
-- Name: product_reviews product_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT product_reviews_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: referrals referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sale_items sale_items_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.sale_items
    ADD CONSTRAINT sale_items_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: solid_cache_entries solid_cache_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_cache_entries
    ADD CONSTRAINT solid_cache_entries_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_blocked_executions solid_queue_blocked_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_blocked_executions
    ADD CONSTRAINT solid_queue_blocked_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_claimed_executions solid_queue_claimed_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_claimed_executions
    ADD CONSTRAINT solid_queue_claimed_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_failed_executions solid_queue_failed_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_failed_executions
    ADD CONSTRAINT solid_queue_failed_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_jobs solid_queue_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_jobs
    ADD CONSTRAINT solid_queue_jobs_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_pauses solid_queue_pauses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_pauses
    ADD CONSTRAINT solid_queue_pauses_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_processes solid_queue_processes_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_processes
    ADD CONSTRAINT solid_queue_processes_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_ready_executions solid_queue_ready_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_ready_executions
    ADD CONSTRAINT solid_queue_ready_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_recurring_executions solid_queue_recurring_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_recurring_executions
    ADD CONSTRAINT solid_queue_recurring_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_recurring_tasks solid_queue_recurring_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_recurring_tasks
    ADD CONSTRAINT solid_queue_recurring_tasks_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_scheduled_executions solid_queue_scheduled_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_scheduled_executions
    ADD CONSTRAINT solid_queue_scheduled_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_semaphores solid_queue_semaphores_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_semaphores
    ADD CONSTRAINT solid_queue_semaphores_pkey PRIMARY KEY (id);


--
-- Name: stock_batches stock_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.stock_batches
    ADD CONSTRAINT stock_batches_pkey PRIMARY KEY (id);


--
-- Name: stock_movements stock_movements_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.stock_movements
    ADD CONSTRAINT stock_movements_pkey PRIMARY KEY (id);


--
-- Name: store_inventory_transfers store_inventory_transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.store_inventory_transfers
    ADD CONSTRAINT store_inventory_transfers_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: sub_agents sub_agents_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.sub_agents
    ADD CONSTRAINT sub_agents_pkey PRIMARY KEY (id);


--
-- Name: subscription_templates subscription_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.subscription_templates
    ADD CONSTRAINT subscription_templates_pkey PRIMARY KEY (id);


--
-- Name: system_settings system_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.system_settings
    ADD CONSTRAINT system_settings_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vendor_invoices vendor_invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendor_invoices
    ADD CONSTRAINT vendor_invoices_pkey PRIMARY KEY (id);


--
-- Name: vendor_payments vendor_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendor_payments
    ADD CONSTRAINT vendor_payments_pkey PRIMARY KEY (id);


--
-- Name: vendor_purchase_items vendor_purchase_items_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendor_purchase_items
    ADD CONSTRAINT vendor_purchase_items_pkey PRIMARY KEY (id);


--
-- Name: vendor_purchases vendor_purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendor_purchases
    ADD CONSTRAINT vendor_purchases_pkey PRIMARY KEY (id);


--
-- Name: vendors vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);


--
-- Name: wallet_transactions wallet_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.wallet_transactions
    ADD CONSTRAINT wallet_transactions_pkey PRIMARY KEY (id);


--
-- Name: wishlists wishlists_pkey; Type: CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT wishlists_pkey PRIMARY KEY (id);


--
-- Name: idx_milk_subscriptions_dates; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX idx_milk_subscriptions_dates ON public.milk_subscriptions USING btree (start_date, end_date);


--
-- Name: idx_milk_subscriptions_status; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX idx_milk_subscriptions_status ON public.milk_subscriptions USING btree (status);


--
-- Name: idx_on_delivery_person_id_delivery_date_8b580f1b82; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX idx_on_delivery_person_id_delivery_date_8b580f1b82 ON public.milk_delivery_tasks USING btree (delivery_person_id, delivery_date);


--
-- Name: idx_stock_movements_created_at; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX idx_stock_movements_created_at ON public.stock_movements USING btree (created_at);


--
-- Name: idx_stock_movements_movement_type; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX idx_stock_movements_movement_type ON public.stock_movements USING btree (movement_type);


--
-- Name: idx_stock_movements_product_created; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX idx_stock_movements_product_created ON public.stock_movements USING btree (product_id, created_at);


--
-- Name: idx_stock_movements_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX idx_stock_movements_product_id ON public.stock_movements USING btree (product_id);


--
-- Name: idx_stock_movements_ref_type_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX idx_stock_movements_ref_type_id ON public.stock_movements USING btree (reference_type, reference_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_affiliates_on_email; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_affiliates_on_email ON public.affiliates USING btree (email);


--
-- Name: index_affiliates_on_mobile; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_affiliates_on_mobile ON public.affiliates USING btree (mobile);


--
-- Name: index_banners_on_display_location; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_banners_on_display_location ON public.banners USING btree (display_location);


--
-- Name: index_banners_on_display_order; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_banners_on_display_order ON public.banners USING btree (display_order);


--
-- Name: index_banners_on_status; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_banners_on_status ON public.banners USING btree (status);


--
-- Name: index_booking_invoices_on_booking_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_booking_invoices_on_booking_id ON public.booking_invoices USING btree (booking_id);


--
-- Name: index_booking_invoices_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_booking_invoices_on_customer_id ON public.booking_invoices USING btree (customer_id);


--
-- Name: index_booking_invoices_on_invoice_number; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_booking_invoices_on_invoice_number ON public.booking_invoices USING btree (invoice_number);


--
-- Name: index_booking_invoices_on_share_token; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_booking_invoices_on_share_token ON public.booking_invoices USING btree (share_token);


--
-- Name: index_booking_schedules_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_booking_schedules_on_customer_id ON public.booking_schedules USING btree (customer_id);


--
-- Name: index_booking_schedules_on_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_booking_schedules_on_product_id ON public.booking_schedules USING btree (product_id);


--
-- Name: index_bookings_on_booked_by; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_bookings_on_booked_by ON public.bookings USING btree (booked_by);


--
-- Name: index_bookings_on_booking_schedule_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_bookings_on_booking_schedule_id ON public.bookings USING btree (booking_schedule_id);


--
-- Name: index_bookings_on_courier_service; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_bookings_on_courier_service ON public.bookings USING btree (courier_service);


--
-- Name: index_bookings_on_delivery_person_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_bookings_on_delivery_person_id ON public.bookings USING btree (delivery_person_id);


--
-- Name: index_bookings_on_delivery_time; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_bookings_on_delivery_time ON public.bookings USING btree (delivery_time);


--
-- Name: index_bookings_on_expected_delivery_date; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_bookings_on_expected_delivery_date ON public.bookings USING btree (expected_delivery_date);


--
-- Name: index_bookings_on_franchise_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_bookings_on_franchise_id ON public.bookings USING btree (franchise_id);


--
-- Name: index_bookings_on_stage_updated_at; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_bookings_on_stage_updated_at ON public.bookings USING btree (stage_updated_at);


--
-- Name: index_bookings_on_stage_updated_by; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_bookings_on_stage_updated_by ON public.bookings USING btree (stage_updated_by);


--
-- Name: index_bookings_on_store_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_bookings_on_store_id ON public.bookings USING btree (store_id);


--
-- Name: index_bookings_on_tracking_number; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_bookings_on_tracking_number ON public.bookings USING btree (tracking_number);


--
-- Name: index_categories_on_display_order; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_categories_on_display_order ON public.categories USING btree (display_order);


--
-- Name: index_categories_on_status; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_categories_on_status ON public.categories USING btree (status);


--
-- Name: index_client_requests_on_assignee_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_client_requests_on_assignee_id ON public.client_requests USING btree (assignee_id);


--
-- Name: index_client_requests_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_client_requests_on_customer_id ON public.client_requests USING btree (customer_id);


--
-- Name: index_client_requests_on_department; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_client_requests_on_department ON public.client_requests USING btree (department);


--
-- Name: index_client_requests_on_estimated_resolution_time; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_client_requests_on_estimated_resolution_time ON public.client_requests USING btree (estimated_resolution_time);


--
-- Name: index_client_requests_on_stage; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_client_requests_on_stage ON public.client_requests USING btree (stage);


--
-- Name: index_client_requests_on_ticket_number; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_client_requests_on_ticket_number ON public.client_requests USING btree (ticket_number);


--
-- Name: index_coupons_on_code; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_coupons_on_code ON public.coupons USING btree (code);


--
-- Name: index_customer_addresses_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_customer_addresses_on_customer_id ON public.customer_addresses USING btree (customer_id);


--
-- Name: index_customer_formats_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_customer_formats_on_customer_id ON public.customer_formats USING btree (customer_id);


--
-- Name: index_customer_formats_on_delivery_person_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_customer_formats_on_delivery_person_id ON public.customer_formats USING btree (delivery_person_id);


--
-- Name: index_customer_formats_on_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_customer_formats_on_product_id ON public.customer_formats USING btree (product_id);


--
-- Name: index_customer_wallets_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_customer_wallets_on_customer_id ON public.customer_wallets USING btree (customer_id);


--
-- Name: index_customers_on_location; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_customers_on_location ON public.customers USING btree (latitude, longitude);


--
-- Name: index_customers_on_whatsapp_number; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_customers_on_whatsapp_number ON public.customers USING btree (whatsapp_number);


--
-- Name: index_delivery_rules_on_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_delivery_rules_on_product_id ON public.delivery_rules USING btree (product_id);


--
-- Name: index_delivery_rules_on_rule_type; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_delivery_rules_on_rule_type ON public.delivery_rules USING btree (rule_type);


--
-- Name: index_device_tokens_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_device_tokens_on_customer_id ON public.device_tokens USING btree (customer_id);


--
-- Name: index_device_tokens_on_delivery_person_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_device_tokens_on_delivery_person_id ON public.device_tokens USING btree (delivery_person_id);


--
-- Name: index_expenses_on_category; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_expenses_on_category ON public.expenses USING btree (category);


--
-- Name: index_expenses_on_created_by_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_expenses_on_created_by_id ON public.expenses USING btree (created_by_id);


--
-- Name: index_expenses_on_store_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_expenses_on_store_id ON public.expenses USING btree (store_id);


--
-- Name: index_expenses_on_store_id_and_expense_date; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_expenses_on_store_id_and_expense_date ON public.expenses USING btree (store_id, expense_date);


--
-- Name: index_franchises_on_email; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_franchises_on_email ON public.franchises USING btree (email);


--
-- Name: index_franchises_on_mobile; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_franchises_on_mobile ON public.franchises USING btree (mobile);


--
-- Name: index_franchises_on_pan_no; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_franchises_on_pan_no ON public.franchises USING btree (pan_no);


--
-- Name: index_franchises_on_user_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_franchises_on_user_id ON public.franchises USING btree (user_id);


--
-- Name: index_invoice_items_on_invoice_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_invoice_items_on_invoice_id ON public.invoice_items USING btree (invoice_id);


--
-- Name: index_invoice_items_on_milk_delivery_task_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_invoice_items_on_milk_delivery_task_id ON public.invoice_items USING btree (milk_delivery_task_id);


--
-- Name: index_invoice_items_on_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_invoice_items_on_product_id ON public.invoice_items USING btree (product_id);


--
-- Name: index_invoices_on_invoice_number; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_invoices_on_invoice_number ON public.invoices USING btree (invoice_number);


--
-- Name: index_invoices_on_share_token; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_invoices_on_share_token ON public.invoices USING btree (share_token);


--
-- Name: index_milk_delivery_tasks_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_milk_delivery_tasks_on_customer_id ON public.milk_delivery_tasks USING btree (customer_id);


--
-- Name: index_milk_delivery_tasks_on_customer_id_and_delivery_date; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_milk_delivery_tasks_on_customer_id_and_delivery_date ON public.milk_delivery_tasks USING btree (customer_id, delivery_date);


--
-- Name: index_milk_delivery_tasks_on_delivery_date; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_milk_delivery_tasks_on_delivery_date ON public.milk_delivery_tasks USING btree (delivery_date);


--
-- Name: index_milk_delivery_tasks_on_delivery_person_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_milk_delivery_tasks_on_delivery_person_id ON public.milk_delivery_tasks USING btree (delivery_person_id);


--
-- Name: index_milk_delivery_tasks_on_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_milk_delivery_tasks_on_product_id ON public.milk_delivery_tasks USING btree (product_id);


--
-- Name: index_milk_delivery_tasks_on_status; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_milk_delivery_tasks_on_status ON public.milk_delivery_tasks USING btree (status);


--
-- Name: index_milk_delivery_tasks_on_subscription_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_milk_delivery_tasks_on_subscription_id ON public.milk_delivery_tasks USING btree (subscription_id);


--
-- Name: index_milk_subscriptions_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_milk_subscriptions_on_customer_id ON public.milk_subscriptions USING btree (customer_id);


--
-- Name: index_milk_subscriptions_on_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_milk_subscriptions_on_product_id ON public.milk_subscriptions USING btree (product_id);


--
-- Name: index_notes_on_created_by_user_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_notes_on_created_by_user_id ON public.notes USING btree (created_by_user_id);


--
-- Name: index_notes_on_note_date; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_notes_on_note_date ON public.notes USING btree (note_date);


--
-- Name: index_notes_on_payment_method; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_notes_on_payment_method ON public.notes USING btree (payment_method);


--
-- Name: index_notes_on_status; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_notes_on_status ON public.notes USING btree (status);


--
-- Name: index_notifications_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_notifications_on_customer_id ON public.notifications USING btree (customer_id);


--
-- Name: index_orders_on_booking_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_orders_on_booking_id ON public.orders USING btree (booking_id);


--
-- Name: index_pending_amounts_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_pending_amounts_on_customer_id ON public.pending_amounts USING btree (customer_id);


--
-- Name: index_permissions_on_name; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_permissions_on_name ON public.permissions USING btree (name);


--
-- Name: index_permissions_on_resource_and_action; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_permissions_on_resource_and_action ON public.permissions USING btree (resource, action);


--
-- Name: index_product_ratings_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_product_ratings_on_customer_id ON public.product_ratings USING btree (customer_id);


--
-- Name: index_product_ratings_on_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_product_ratings_on_product_id ON public.product_ratings USING btree (product_id);


--
-- Name: index_product_ratings_on_product_id_and_rating; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_product_ratings_on_product_id_and_rating ON public.product_ratings USING btree (product_id, rating);


--
-- Name: index_product_ratings_on_product_id_and_status; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_product_ratings_on_product_id_and_status ON public.product_ratings USING btree (product_id, status);


--
-- Name: index_product_ratings_on_user_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_product_ratings_on_user_id ON public.product_ratings USING btree (user_id);


--
-- Name: index_product_reviews_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_product_reviews_on_customer_id ON public.product_reviews USING btree (customer_id);


--
-- Name: index_product_reviews_on_customer_id_and_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_product_reviews_on_customer_id_and_product_id ON public.product_reviews USING btree (customer_id, product_id) WHERE (customer_id IS NOT NULL);


--
-- Name: index_product_reviews_on_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_product_reviews_on_product_id ON public.product_reviews USING btree (product_id);


--
-- Name: index_product_reviews_on_product_id_and_created_at; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_product_reviews_on_product_id_and_created_at ON public.product_reviews USING btree (product_id, created_at);


--
-- Name: index_product_reviews_on_product_id_and_rating; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_product_reviews_on_product_id_and_rating ON public.product_reviews USING btree (product_id, rating);


--
-- Name: index_product_reviews_on_product_id_and_status; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_product_reviews_on_product_id_and_status ON public.product_reviews USING btree (product_id, status);


--
-- Name: index_product_reviews_on_user_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_product_reviews_on_user_id ON public.product_reviews USING btree (user_id);


--
-- Name: index_products_on_category_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_products_on_category_id ON public.products USING btree (category_id);


--
-- Name: index_products_on_is_occasional_product; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_products_on_is_occasional_product ON public.products USING btree (is_occasional_product);


--
-- Name: index_products_on_is_subscription_enabled; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_products_on_is_subscription_enabled ON public.products USING btree (is_subscription_enabled);


--
-- Name: index_products_on_last_price_update; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_products_on_last_price_update ON public.products USING btree (last_price_update);


--
-- Name: index_products_on_name; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_products_on_name ON public.products USING btree (name);


--
-- Name: index_products_on_occasional_dates; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_products_on_occasional_dates ON public.products USING btree (is_occasional_product, occasional_start_date, occasional_end_date);


--
-- Name: index_products_on_product_type; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_products_on_product_type ON public.products USING btree (product_type);


--
-- Name: index_products_on_sku; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_products_on_sku ON public.products USING btree (sku);


--
-- Name: index_products_on_status; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_products_on_status ON public.products USING btree (status);


--
-- Name: index_referrals_on_affiliate_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_referrals_on_affiliate_id ON public.referrals USING btree (affiliate_id);


--
-- Name: index_referrals_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_referrals_on_customer_id ON public.referrals USING btree (customer_id);


--
-- Name: index_referrals_on_referral_source; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_referrals_on_referral_source ON public.referrals USING btree (referral_source);


--
-- Name: index_referrals_on_referring_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_referrals_on_referring_customer_id ON public.referrals USING btree (referring_customer_id);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_roles_on_name ON public.roles USING btree (name);


--
-- Name: index_sale_items_on_booking_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_sale_items_on_booking_id ON public.sale_items USING btree (booking_id);


--
-- Name: index_sale_items_on_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_sale_items_on_product_id ON public.sale_items USING btree (product_id);


--
-- Name: index_sale_items_on_stock_batch_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_sale_items_on_stock_batch_id ON public.sale_items USING btree (stock_batch_id);


--
-- Name: index_solid_cache_entries_on_byte_size; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_cache_entries_on_byte_size ON public.solid_cache_entries USING btree (byte_size);


--
-- Name: index_solid_cache_entries_on_key_hash; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_solid_cache_entries_on_key_hash ON public.solid_cache_entries USING btree (key_hash);


--
-- Name: index_solid_cache_entries_on_key_hash_and_byte_size; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_cache_entries_on_key_hash_and_byte_size ON public.solid_cache_entries USING btree (key_hash, byte_size);


--
-- Name: index_solid_queue_blocked_executions_for_maintenance; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_blocked_executions_for_maintenance ON public.solid_queue_blocked_executions USING btree (expires_at, concurrency_key);


--
-- Name: index_solid_queue_blocked_executions_for_release; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_blocked_executions_for_release ON public.solid_queue_blocked_executions USING btree (concurrency_key, priority, job_id);


--
-- Name: index_solid_queue_blocked_executions_on_job_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_solid_queue_blocked_executions_on_job_id ON public.solid_queue_blocked_executions USING btree (job_id);


--
-- Name: index_solid_queue_claimed_executions_on_job_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_solid_queue_claimed_executions_on_job_id ON public.solid_queue_claimed_executions USING btree (job_id);


--
-- Name: index_solid_queue_claimed_executions_on_process_id_and_job_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_claimed_executions_on_process_id_and_job_id ON public.solid_queue_claimed_executions USING btree (process_id, job_id);


--
-- Name: index_solid_queue_dispatch_all; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_dispatch_all ON public.solid_queue_scheduled_executions USING btree (scheduled_at, priority, job_id);


--
-- Name: index_solid_queue_failed_executions_on_job_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_solid_queue_failed_executions_on_job_id ON public.solid_queue_failed_executions USING btree (job_id);


--
-- Name: index_solid_queue_jobs_for_alerting; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_jobs_for_alerting ON public.solid_queue_jobs USING btree (scheduled_at, finished_at);


--
-- Name: index_solid_queue_jobs_for_filtering; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_jobs_for_filtering ON public.solid_queue_jobs USING btree (queue_name, finished_at);


--
-- Name: index_solid_queue_jobs_on_active_job_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_jobs_on_active_job_id ON public.solid_queue_jobs USING btree (active_job_id);


--
-- Name: index_solid_queue_jobs_on_class_name; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_jobs_on_class_name ON public.solid_queue_jobs USING btree (class_name);


--
-- Name: index_solid_queue_jobs_on_finished_at; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_jobs_on_finished_at ON public.solid_queue_jobs USING btree (finished_at);


--
-- Name: index_solid_queue_pauses_on_queue_name; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_solid_queue_pauses_on_queue_name ON public.solid_queue_pauses USING btree (queue_name);


--
-- Name: index_solid_queue_poll_all; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_poll_all ON public.solid_queue_ready_executions USING btree (priority, job_id);


--
-- Name: index_solid_queue_poll_by_queue; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_poll_by_queue ON public.solid_queue_ready_executions USING btree (queue_name, priority, job_id);


--
-- Name: index_solid_queue_processes_on_last_heartbeat_at; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_processes_on_last_heartbeat_at ON public.solid_queue_processes USING btree (last_heartbeat_at);


--
-- Name: index_solid_queue_processes_on_name_and_supervisor_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_solid_queue_processes_on_name_and_supervisor_id ON public.solid_queue_processes USING btree (name, supervisor_id);


--
-- Name: index_solid_queue_processes_on_supervisor_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_processes_on_supervisor_id ON public.solid_queue_processes USING btree (supervisor_id);


--
-- Name: index_solid_queue_ready_executions_on_job_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_solid_queue_ready_executions_on_job_id ON public.solid_queue_ready_executions USING btree (job_id);


--
-- Name: index_solid_queue_recurring_executions_on_job_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_solid_queue_recurring_executions_on_job_id ON public.solid_queue_recurring_executions USING btree (job_id);


--
-- Name: index_solid_queue_recurring_executions_on_task_key_and_run_at; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_solid_queue_recurring_executions_on_task_key_and_run_at ON public.solid_queue_recurring_executions USING btree (task_key, run_at);


--
-- Name: index_solid_queue_recurring_tasks_on_key; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_solid_queue_recurring_tasks_on_key ON public.solid_queue_recurring_tasks USING btree (key);


--
-- Name: index_solid_queue_recurring_tasks_on_static; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_recurring_tasks_on_static ON public.solid_queue_recurring_tasks USING btree (static);


--
-- Name: index_solid_queue_scheduled_executions_on_job_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_solid_queue_scheduled_executions_on_job_id ON public.solid_queue_scheduled_executions USING btree (job_id);


--
-- Name: index_solid_queue_semaphores_on_expires_at; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_semaphores_on_expires_at ON public.solid_queue_semaphores USING btree (expires_at);


--
-- Name: index_solid_queue_semaphores_on_key; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_solid_queue_semaphores_on_key ON public.solid_queue_semaphores USING btree (key);


--
-- Name: index_solid_queue_semaphores_on_key_and_value; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_solid_queue_semaphores_on_key_and_value ON public.solid_queue_semaphores USING btree (key, value);


--
-- Name: index_stock_batches_on_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_stock_batches_on_product_id ON public.stock_batches USING btree (product_id);


--
-- Name: index_stock_batches_on_store_and_product; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_stock_batches_on_store_and_product ON public.stock_batches USING btree (store_id, product_id);


--
-- Name: index_stock_batches_on_store_and_status; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_stock_batches_on_store_and_status ON public.stock_batches USING btree (store_id, status);


--
-- Name: index_stock_batches_on_store_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_stock_batches_on_store_id ON public.stock_batches USING btree (store_id);


--
-- Name: index_stock_batches_on_vendor_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_stock_batches_on_vendor_id ON public.stock_batches USING btree (vendor_id);


--
-- Name: index_stock_batches_on_vendor_purchase_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_stock_batches_on_vendor_purchase_id ON public.stock_batches USING btree (vendor_purchase_id);


--
-- Name: index_stock_movements_on_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_stock_movements_on_product_id ON public.stock_movements USING btree (product_id);


--
-- Name: index_stock_movements_on_store_and_date; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_stock_movements_on_store_and_date ON public.stock_movements USING btree (store_id, created_at);


--
-- Name: index_stock_movements_on_store_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_stock_movements_on_store_id ON public.stock_movements USING btree (store_id);


--
-- Name: index_store_inventory_transfers_on_approved_by_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_store_inventory_transfers_on_approved_by_id ON public.store_inventory_transfers USING btree (approved_by_id);


--
-- Name: index_store_inventory_transfers_on_from_store_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_store_inventory_transfers_on_from_store_id ON public.store_inventory_transfers USING btree (from_store_id);


--
-- Name: index_store_inventory_transfers_on_initiated_by_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_store_inventory_transfers_on_initiated_by_id ON public.store_inventory_transfers USING btree (initiated_by_id);


--
-- Name: index_store_inventory_transfers_on_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_store_inventory_transfers_on_product_id ON public.store_inventory_transfers USING btree (product_id);


--
-- Name: index_store_inventory_transfers_on_to_store_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_store_inventory_transfers_on_to_store_id ON public.store_inventory_transfers USING btree (to_store_id);


--
-- Name: index_stores_on_store_admin_user_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_stores_on_store_admin_user_id ON public.stores USING btree (store_admin_user_id);


--
-- Name: index_sub_agents_on_aadhar_no; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_sub_agents_on_aadhar_no ON public.sub_agents USING btree (aadhar_no);


--
-- Name: index_sub_agents_on_email; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_sub_agents_on_email ON public.sub_agents USING btree (email);


--
-- Name: index_sub_agents_on_mobile; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_sub_agents_on_mobile ON public.sub_agents USING btree (mobile);


--
-- Name: index_sub_agents_on_pan_no; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_sub_agents_on_pan_no ON public.sub_agents USING btree (pan_no);


--
-- Name: index_subscription_templates_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_subscription_templates_on_customer_id ON public.subscription_templates USING btree (customer_id);


--
-- Name: index_subscription_templates_on_delivery_person_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_subscription_templates_on_delivery_person_id ON public.subscription_templates USING btree (delivery_person_id);


--
-- Name: index_subscription_templates_on_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_subscription_templates_on_product_id ON public.subscription_templates USING btree (product_id);


--
-- Name: index_system_settings_on_key; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_system_settings_on_key ON public.system_settings USING btree (key);


--
-- Name: index_transfers_on_from_store_and_status; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_transfers_on_from_store_and_status ON public.store_inventory_transfers USING btree (from_store_id, status);


--
-- Name: index_transfers_on_product_and_status; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_transfers_on_product_and_status ON public.store_inventory_transfers USING btree (product_id, status);


--
-- Name: index_transfers_on_reference_number; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_transfers_on_reference_number ON public.store_inventory_transfers USING btree (transfer_reference_number);


--
-- Name: index_transfers_on_status; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_transfers_on_status ON public.store_inventory_transfers USING btree (status);


--
-- Name: index_transfers_on_to_store_and_status; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_transfers_on_to_store_and_status ON public.store_inventory_transfers USING btree (to_store_id, status);


--
-- Name: index_transfers_on_user_and_date; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_transfers_on_user_and_date ON public.store_inventory_transfers USING btree (initiated_by_id, created_at);


--
-- Name: index_user_roles_on_name; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_user_roles_on_name ON public.user_roles USING btree (name);


--
-- Name: index_users_on_aadhar_no; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_users_on_aadhar_no ON public.users USING btree (aadhar_no);


--
-- Name: index_users_on_assigned_store; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_users_on_assigned_store ON public.users USING btree (assigned_store_id);


--
-- Name: index_users_on_assigned_store_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_users_on_assigned_store_id ON public.users USING btree (assigned_store_id);


--
-- Name: index_users_on_authenticatable; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_users_on_authenticatable ON public.users USING btree (authenticatable_type, authenticatable_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_deleted_at; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_users_on_deleted_at ON public.users USING btree (deleted_at);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_employee_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_users_on_employee_id ON public.users USING btree (employee_id);


--
-- Name: index_users_on_is_active; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_users_on_is_active ON public.users USING btree (is_active);


--
-- Name: index_users_on_mobile; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_users_on_mobile ON public.users USING btree (mobile);


--
-- Name: index_users_on_pan_no; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_users_on_pan_no ON public.users USING btree (pan_no);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_role; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_users_on_role ON public.users USING btree (role);


--
-- Name: index_users_on_status; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_users_on_status ON public.users USING btree (status);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON public.users USING btree (unlock_token);


--
-- Name: index_users_on_user_type; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_users_on_user_type ON public.users USING btree (user_type);


--
-- Name: index_vendor_invoices_on_invoice_number; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_vendor_invoices_on_invoice_number ON public.vendor_invoices USING btree (invoice_number);


--
-- Name: index_vendor_invoices_on_share_token; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_vendor_invoices_on_share_token ON public.vendor_invoices USING btree (share_token);


--
-- Name: index_vendor_invoices_on_vendor_purchase_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_vendor_invoices_on_vendor_purchase_id ON public.vendor_invoices USING btree (vendor_purchase_id);


--
-- Name: index_vendor_payments_on_vendor_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_vendor_payments_on_vendor_id ON public.vendor_payments USING btree (vendor_id);


--
-- Name: index_vendor_payments_on_vendor_purchase_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_vendor_payments_on_vendor_purchase_id ON public.vendor_payments USING btree (vendor_purchase_id);


--
-- Name: index_vendor_purchase_items_on_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_vendor_purchase_items_on_product_id ON public.vendor_purchase_items USING btree (product_id);


--
-- Name: index_vendor_purchase_items_on_vendor_purchase_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_vendor_purchase_items_on_vendor_purchase_id ON public.vendor_purchase_items USING btree (vendor_purchase_id);


--
-- Name: index_vendor_purchases_on_vendor_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_vendor_purchases_on_vendor_id ON public.vendor_purchases USING btree (vendor_id);


--
-- Name: index_wallet_transactions_on_customer_wallet_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_wallet_transactions_on_customer_wallet_id ON public.wallet_transactions USING btree (customer_wallet_id);


--
-- Name: index_wallet_transactions_on_reference_number; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE UNIQUE INDEX index_wallet_transactions_on_reference_number ON public.wallet_transactions USING btree (reference_number);


--
-- Name: index_wallet_transactions_on_transaction_type; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_wallet_transactions_on_transaction_type ON public.wallet_transactions USING btree (transaction_type);


--
-- Name: index_wishlists_on_customer_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_wishlists_on_customer_id ON public.wishlists USING btree (customer_id);


--
-- Name: index_wishlists_on_product_id; Type: INDEX; Schema: public; Owner: dhan02_user
--

CREATE INDEX index_wishlists_on_product_id ON public.wishlists USING btree (product_id);


--
-- Name: milk_subscriptions fk_milk_subscriptions_delivery_person; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.milk_subscriptions
    ADD CONSTRAINT fk_milk_subscriptions_delivery_person FOREIGN KEY (delivery_person_id) REFERENCES public.delivery_people(id);


--
-- Name: subscription_templates fk_rails_0427a5a8f5; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.subscription_templates
    ADD CONSTRAINT fk_rails_0427a5a8f5 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: booking_invoices fk_rails_0588ce0fe5; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.booking_invoices
    ADD CONSTRAINT fk_rails_0588ce0fe5 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: invoice_items fk_rails_0c6e1fd09e; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.invoice_items
    ADD CONSTRAINT fk_rails_0c6e1fd09e FOREIGN KEY (milk_delivery_task_id) REFERENCES public.milk_delivery_tasks(id);


--
-- Name: stock_batches fk_rails_0fd8722280; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.stock_batches
    ADD CONSTRAINT fk_rails_0fd8722280 FOREIGN KEY (vendor_purchase_id) REFERENCES public.vendor_purchases(id);


--
-- Name: sale_items fk_rails_10aa153cb0; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.sale_items
    ADD CONSTRAINT fk_rails_10aa153cb0 FOREIGN KEY (booking_id) REFERENCES public.bookings(id);


--
-- Name: referrals fk_rails_143e21be26; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT fk_rails_143e21be26 FOREIGN KEY (affiliate_id) REFERENCES public.affiliates(id);


--
-- Name: wishlists fk_rails_18bd87f3b0; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT fk_rails_18bd87f3b0 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: bookings fk_rails_1a839bd564; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT fk_rails_1a839bd564 FOREIGN KEY (delivery_person_id) REFERENCES public.delivery_people(id);


--
-- Name: vendor_purchase_items fk_rails_1d0b180fcb; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendor_purchase_items
    ADD CONSTRAINT fk_rails_1d0b180fcb FOREIGN KEY (vendor_purchase_id) REFERENCES public.vendor_purchases(id);


--
-- Name: booking_schedules fk_rails_1de48ebd18; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.booking_schedules
    ADD CONSTRAINT fk_rails_1de48ebd18 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: invoice_items fk_rails_25bf3d2c5e; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.invoice_items
    ADD CONSTRAINT fk_rails_25bf3d2c5e FOREIGN KEY (invoice_id) REFERENCES public.invoices(id);


--
-- Name: store_inventory_transfers fk_rails_282674ddcf; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.store_inventory_transfers
    ADD CONSTRAINT fk_rails_282674ddcf FOREIGN KEY (from_store_id) REFERENCES public.stores(id);


--
-- Name: device_tokens fk_rails_287313072c; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.device_tokens
    ADD CONSTRAINT fk_rails_287313072c FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: referrals fk_rails_2a86f7c55b; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT fk_rails_2a86f7c55b FOREIGN KEY (referring_customer_id) REFERENCES public.customers(id);


--
-- Name: vendor_purchase_items fk_rails_2b2646ec33; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendor_purchase_items
    ADD CONSTRAINT fk_rails_2b2646ec33 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: stock_batches fk_rails_30af726acb; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.stock_batches
    ADD CONSTRAINT fk_rails_30af726acb FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: bookings fk_rails_30b4781a51; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT fk_rails_30b4781a51 FOREIGN KEY (franchise_id) REFERENCES public.franchises(id);


--
-- Name: solid_queue_recurring_executions fk_rails_318a5533ed; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_recurring_executions
    ADD CONSTRAINT fk_rails_318a5533ed FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- Name: milk_delivery_tasks fk_rails_3630bcf24a; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.milk_delivery_tasks
    ADD CONSTRAINT fk_rails_3630bcf24a FOREIGN KEY (subscription_id) REFERENCES public.milk_subscriptions(id);


--
-- Name: product_ratings fk_rails_36795236ae; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.product_ratings
    ADD CONSTRAINT fk_rails_36795236ae FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: milk_delivery_tasks fk_rails_390b1646ed; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.milk_delivery_tasks
    ADD CONSTRAINT fk_rails_390b1646ed FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: solid_queue_failed_executions fk_rails_39bbc7a631; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_failed_executions
    ADD CONSTRAINT fk_rails_39bbc7a631 FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- Name: client_requests fk_rails_3d32864cfc; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.client_requests
    ADD CONSTRAINT fk_rails_3d32864cfc FOREIGN KEY (assignee_id) REFERENCES public.users(id);


--
-- Name: vendor_payments fk_rails_3d8456966c; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendor_payments
    ADD CONSTRAINT fk_rails_3d8456966c FOREIGN KEY (vendor_id) REFERENCES public.vendors(id);


--
-- Name: stock_movements fk_rails_3d89b8d043; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.stock_movements
    ADD CONSTRAINT fk_rails_3d89b8d043 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: franchises fk_rails_41d1977e7e; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.franchises
    ADD CONSTRAINT fk_rails_41d1977e7e FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: wishlists fk_rails_4224d8f53b; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT fk_rails_4224d8f53b FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: bookings fk_rails_469339cd03; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT fk_rails_469339cd03 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: delivery_rules fk_rails_495c599380; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.delivery_rules
    ADD CONSTRAINT fk_rails_495c599380 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: milk_subscriptions fk_rails_4b4fb0c9b4; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.milk_subscriptions
    ADD CONSTRAINT fk_rails_4b4fb0c9b4 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: subscription_templates fk_rails_4cd084b669; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.subscription_templates
    ADD CONSTRAINT fk_rails_4cd084b669 FOREIGN KEY (delivery_person_id) REFERENCES public.delivery_people(id);


--
-- Name: solid_queue_blocked_executions fk_rails_4cd34e2228; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_blocked_executions
    ADD CONSTRAINT fk_rails_4cd34e2228 FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- Name: product_reviews fk_rails_4d29a9c00a; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT fk_rails_4d29a9c00a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: store_inventory_transfers fk_rails_4f064e8973; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.store_inventory_transfers
    ADD CONSTRAINT fk_rails_4f064e8973 FOREIGN KEY (approved_by_id) REFERENCES public.users(id);


--
-- Name: notes fk_rails_65a5c39deb; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT fk_rails_65a5c39deb FOREIGN KEY (created_by_user_id) REFERENCES public.users(id);


--
-- Name: customer_wallets fk_rails_67b1f56e66; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.customer_wallets
    ADD CONSTRAINT fk_rails_67b1f56e66 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: expenses fk_rails_707830cb5c; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT fk_rails_707830cb5c FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: invoice_items fk_rails_72ed60e62c; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.invoice_items
    ADD CONSTRAINT fk_rails_72ed60e62c FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: referrals fk_rails_77c18d42bf; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT fk_rails_77c18d42bf FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: customer_addresses fk_rails_79041ef784; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.customer_addresses
    ADD CONSTRAINT fk_rails_79041ef784 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: subscription_templates fk_rails_7cbefbc65a; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.subscription_templates
    ADD CONSTRAINT fk_rails_7cbefbc65a FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: vendor_purchases fk_rails_7dbe9a831a; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendor_purchases
    ADD CONSTRAINT fk_rails_7dbe9a831a FOREIGN KEY (vendor_id) REFERENCES public.vendors(id);


--
-- Name: milk_delivery_tasks fk_rails_7f5c180cc8; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.milk_delivery_tasks
    ADD CONSTRAINT fk_rails_7f5c180cc8 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: solid_queue_ready_executions fk_rails_81fcbd66af; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_ready_executions
    ADD CONSTRAINT fk_rails_81fcbd66af FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- Name: store_inventory_transfers fk_rails_857c811f15; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.store_inventory_transfers
    ADD CONSTRAINT fk_rails_857c811f15 FOREIGN KEY (to_store_id) REFERENCES public.stores(id);


--
-- Name: bookings fk_rails_94a0a341bb; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT fk_rails_94a0a341bb FOREIGN KEY (booking_schedule_id) REFERENCES public.booking_schedules(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: solid_queue_claimed_executions fk_rails_9cfe4d4944; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_claimed_executions
    ADD CONSTRAINT fk_rails_9cfe4d4944 FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- Name: product_reviews fk_rails_9dcee7d533; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT fk_rails_9dcee7d533 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: vendor_invoices fk_rails_a2e0d1751f; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendor_invoices
    ADD CONSTRAINT fk_rails_a2e0d1751f FOREIGN KEY (vendor_purchase_id) REFERENCES public.vendor_purchases(id);


--
-- Name: product_reviews fk_rails_a6af267e3d; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT fk_rails_a6af267e3d FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: device_tokens fk_rails_a6eff83e14; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.device_tokens
    ADD CONSTRAINT fk_rails_a6eff83e14 FOREIGN KEY (delivery_person_id) REFERENCES public.delivery_people(id);


--
-- Name: milk_delivery_tasks fk_rails_aafb5e9feb; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.milk_delivery_tasks
    ADD CONSTRAINT fk_rails_aafb5e9feb FOREIGN KEY (delivery_person_id) REFERENCES public.delivery_people(id);


--
-- Name: users fk_rails_af3410ee91; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_af3410ee91 FOREIGN KEY (assigned_store_id) REFERENCES public.stores(id);


--
-- Name: stock_batches fk_rails_affef9f32d; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.stock_batches
    ADD CONSTRAINT fk_rails_affef9f32d FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: booking_schedules fk_rails_bf34e93579; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.booking_schedules
    ADD CONSTRAINT fk_rails_bf34e93579 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: client_requests fk_rails_bf4af15099; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.client_requests
    ADD CONSTRAINT fk_rails_bf4af15099 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: stores fk_rails_c187cc0d50; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT fk_rails_c187cc0d50 FOREIGN KEY (store_admin_user_id) REFERENCES public.users(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: solid_queue_scheduled_executions fk_rails_c4316f352d; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.solid_queue_scheduled_executions
    ADD CONSTRAINT fk_rails_c4316f352d FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- Name: product_ratings fk_rails_cc19464c64; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.product_ratings
    ADD CONSTRAINT fk_rails_cc19464c64 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: store_inventory_transfers fk_rails_cdb2015bd6; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.store_inventory_transfers
    ADD CONSTRAINT fk_rails_cdb2015bd6 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: customer_formats fk_rails_cec20eb18b; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.customer_formats
    ADD CONSTRAINT fk_rails_cec20eb18b FOREIGN KEY (delivery_person_id) REFERENCES public.delivery_people(id);


--
-- Name: product_ratings fk_rails_d174ea1e32; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.product_ratings
    ADD CONSTRAINT fk_rails_d174ea1e32 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: customer_formats fk_rails_d1c53afd32; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.customer_formats
    ADD CONSTRAINT fk_rails_d1c53afd32 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sale_items fk_rails_d6e0e81317; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.sale_items
    ADD CONSTRAINT fk_rails_d6e0e81317 FOREIGN KEY (stock_batch_id) REFERENCES public.stock_batches(id);


--
-- Name: customer_formats fk_rails_d8a77fd5fc; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.customer_formats
    ADD CONSTRAINT fk_rails_d8a77fd5fc FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: wallet_transactions fk_rails_dc5903e62b; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.wallet_transactions
    ADD CONSTRAINT fk_rails_dc5903e62b FOREIGN KEY (customer_wallet_id) REFERENCES public.customer_wallets(id);


--
-- Name: stock_movements fk_rails_deb37fa2ee; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.stock_movements
    ADD CONSTRAINT fk_rails_deb37fa2ee FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: milk_subscriptions fk_rails_e110a3862f; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.milk_subscriptions
    ADD CONSTRAINT fk_rails_e110a3862f FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: notifications fk_rails_e82fd73b00; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_rails_e82fd73b00 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: sale_items fk_rails_ee606308b2; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.sale_items
    ADD CONSTRAINT fk_rails_ee606308b2 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: store_inventory_transfers fk_rails_f5539aafc2; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.store_inventory_transfers
    ADD CONSTRAINT fk_rails_f5539aafc2 FOREIGN KEY (initiated_by_id) REFERENCES public.users(id);


--
-- Name: pending_amounts fk_rails_f63a5d559b; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.pending_amounts
    ADD CONSTRAINT fk_rails_f63a5d559b FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: expenses fk_rails_f7e2e7081b; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT fk_rails_f7e2e7081b FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- Name: vendor_payments fk_rails_fa51839ac6; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.vendor_payments
    ADD CONSTRAINT fk_rails_fa51839ac6 FOREIGN KEY (vendor_purchase_id) REFERENCES public.vendor_purchases(id);


--
-- Name: products fk_rails_fb915499a4; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_fb915499a4 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: booking_invoices fk_rails_fd3dea094d; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.booking_invoices
    ADD CONSTRAINT fk_rails_fd3dea094d FOREIGN KEY (booking_id) REFERENCES public.bookings(id);


--
-- Name: stock_batches fk_rails_fd8d4dc083; Type: FK CONSTRAINT; Schema: public; Owner: dhan02_user
--

ALTER TABLE ONLY public.stock_batches
    ADD CONSTRAINT fk_rails_fd8d4dc083 FOREIGN KEY (vendor_id) REFERENCES public.vendors(id);


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES TO dhan02_user;


--
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES TO dhan02_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS TO dhan02_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO dhan02_user;


--
-- PostgreSQL database dump complete
--

\unrestrict M7DRyf2e0FZvB3piGvsVQg6HQY8JBMdvhRgFuqfGWA0VBmDiTY5R78ixTJy40qW

