describe(' Home page', () => {

it("Visit the home page", () => {
    cy.visit('/');
});

it("There are products on page", () => {
    cy.get(".products article").should("be.visible");
});
it("There are 2 products on page", () => {
    cy.get(".products article").should("have.length", 2);
 });
});