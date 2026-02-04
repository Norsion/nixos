const getDateTime = Variable(new Date(), {
	poll: [
		1000,
		() => {
			const currentDate = new Date();
			const dayOfWeek = currentDate.getDay();
			const isWeekend = dayOfWeek === 0 || dayOfWeek === 6; // 0 is Sunday, 6 is Saturday

			return {
				date: `${currentDate.toLocaleDateString("en-US", {
					weekday: "long",
					month: "short",
					day: "numeric",
				})}`,
				time: `${currentDate.toLocaleTimeString([], {
					hour: "2-digit",
					minute: "2-digit",
					hour12: true,
				})}`,
				isWeekend: isWeekend,
			};
		},
	],
});