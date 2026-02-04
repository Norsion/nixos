// Bar layout
const Left = () => {
	return Box({
		hpack: "start",
		spacing: 8,
		children: [
			
		],
	});
};

const Center = () => {
	return Box({
		hpack: "center",
		spacing: 8,
		children: [],
	});
};

const Right = () => {
	return Box({
		hpack: "end",
		spacing: 8,
		children: [
			
		],
	});
};

export const Bar = (monitor = 0) =>
	Window({
		monitor,
		name: `bar-${monitor}`, // name has to be unique
		className: "bar",
		exclusivity: "exclusive",
		anchor: ["top", "left", "right"],
		child: CenterBox({
			css: "min-width: 2px; min-height: 2px;",
			className: "bar-window",
			startWidget: Left(),
			centerWidget: Center(),
			endWidget: Right(),
		}),
		// setup: (self) =>
		// 	self.hook(Hyprland, () => {
		// 		print(self.monitor);
		// 	}),
	});