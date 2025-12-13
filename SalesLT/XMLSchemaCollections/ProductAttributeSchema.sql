CREATE XML SCHEMA COLLECTION [SalesLT].[ProductAttributeSchema]
    AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://SalesLT/ProductAttributes" targetNamespace="http://SalesLT/ProductAttributes" elementFormDefault="qualified">
  <xsd:element name="Attributes">
    <xsd:complexType>
      <xsd:complexContent>
        <xsd:restriction base="xsd:anyType">
          <xsd:sequence>
            <xsd:element name="Name" type="xsd:string" />
            <xsd:element name="Color" type="xsd:string" />
            <xsd:element name="Size" type="xsd:string" />
            <xsd:element name="Material" type="xsd:string" />
            <xsd:element name="Manufacturer" type="xsd:string" />
          </xsd:sequence>
        </xsd:restriction>
      </xsd:complexContent>
    </xsd:complexType>
  </xsd:element>
</xsd:schema>';

