// users can navigate from the home page to the product detail page by clicking on a product
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

it("Navigate to product details page by clicking a product", () => {
    cy.get("[alt='Scented Blade']").click();
    cy.contains(".product-detail", "Scented Blade");
})

});