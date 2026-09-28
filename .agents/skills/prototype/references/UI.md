# UI Prototype

Use a UI prototype to answer a visual or interaction decision. A single mockup can test one idea; build multiple variants when comparing different structures is the question.

- Put the experiment in its real page context when possible, with representative content and the project's existing components. Use a temporary route only when no suitable page exists.
- Make variants meaningfully different in layout, information hierarchy, or primary action. Copy and color tweaks alone rarely test a design choice.
- When the user needs to compare variants in the app, use one route with a query parameter such as `?variant=A` and a small switcher. Keep data loading shared while swapping the rendered section. The URL should be easy to share and reload.
- Keep mutations stubbed unless the interaction itself is the question. Avoid shipping the switcher or unused variants to production.
- Show the user how to open the experiment. Record which design worked and why, then remove the throwaway code or harden the selected design under normal production requirements.
