describe('Product details', () => {

    it("Visit the homepage", () => {
        cy.visit('/');
    });

    it("There are products on page", () => {
        cy.get(".products article").should("be.visible");
    });

    it("There are 2 products on page", () => {
        cy.get(".products article").should("have.length", 2);
    });

    it("The count of the cart button changes when adding products to it", () => {
        cy.get("button").contains("Add").click({ force: true });
        cy.get(".nav-link").contains("My Cart (1)").should("be.visible")
    });

});